{-
Authors: Andrei Paskevich (2001 - 2008), Steffen Frerix (2017 - 2018), Makarius Wenzel (2018)

Syntax of ForThel Instructions.
-}

module SAD.ForTheL.Instruction where

import Control.Monad
import Data.Char

import SAD.Core.SourcePos
import SAD.Data.Instr (Instr)
import qualified SAD.Data.Instr as Instr

import SAD.ForTheL.Base

import SAD.Parser.Base
import SAD.Parser.Combinators
import SAD.Parser.Primitives
import SAD.ForTheL.Reports
import SAD.Parser.Token


instrPos :: (Instr.Pos -> FTL ()) -> FTL a -> FTL (Instr.Pos, a)
instrPos report p = do
  ((pos1, pos2), x) <- enclosed begin end p
  let pos = Instr.Pos pos1 pos2 (makeRange (pos1, pos2 `advanceAlong` end))
  report pos; return (pos, x)
  where begin = "["; end = "]"


instr :: FTL (Instr.Pos, Instr)
instr =
  instrPos addDropReport $ readInstr >>=
    (\case
      Instr.GetArgument Instr.Read _ -> fail "'read' not allowed here"
      Instr.Command Instr.EXIT -> fail "'exit' not allowed here"
      Instr.Command Instr.QUIT -> fail "'quit' not allowed here"
      i -> return i)


instrRead :: FTL (Instr.Pos, Instr)
instrRead =
  instrPos addInstrReport $ readInstr >>=
    (\case { i@(Instr.GetArgument Instr.Read _) -> return i; _ -> mzero })

instrExit :: FTL (Instr.Pos, Instr)
instrExit =
  instrPos addInstrReport $ readInstr >>=
    (\case
      i@(Instr.Command Instr.EXIT) -> return i
      i@(Instr.Command Instr.QUIT) -> return i
      _ -> mzero)

instrDrop :: FTL (Instr.Pos, Instr.Drop)
instrDrop = instrPos addInstrReport (token' "/" >> readInstrDrop)


readInstr :: FTL Instr
readInstr =
  readInstrCommand -|- readInstrLimit -|- readInstrBool -|- readInstrString -|- readInstrStrings
  where
    readInstrCommand = fmap Instr.Command (readKeywords Instr.keywordsCommand)
    readInstrLimit = liftM2 Instr.LimitBy (readKeywords Instr.keywordsLimit) readInt
    readInstrBool = liftM2 Instr.SetFlag (readKeywords Instr.keywordsFlag) readBool
    readInstrString = liftM2 Instr.GetArgument (readKeywords Instr.keywordsArgument) readString
    readInstrStrings = liftM2 Instr.GetArguments (readKeywords Instr.keywordsArguments) readWords

readInt :: Parser st Int
readInt = try $ readString >>= intCheck
  where
    intCheck s = case reads s of
      ((n,[]):_) | n >= 0 -> return n
      _                   -> mzero

readBool :: Parser st Bool
readBool = try $ readString >>= boolCheck
  where
    boolCheck "yes" = return True
    boolCheck "on"  = return True
    boolCheck "no"  = return False
    boolCheck "off" = return False
    boolCheck _     = mzero

readString :: Parser st String
readString = fmap concat readStrings


readStrings :: Parser st [String]
readStrings = chainLL1 notClosingBrk
  where
    notClosingBrk = tokenPrim notCl
    notCl t = let tk = showToken t in guard (tk /= "]") >> return tk

readWords :: Parser st [String]
readWords = shortHand </> chainLL1 word
  where
  shortHand = do
    w <- word ; root <- optLL1 w $ variant w; token "/"
    syms <- (fmap (map toLower) word -|- variant w) `sepByLL1` token "/"
    return $ root : syms
  variant w = token "-" >> fmap (w ++) word

readInstrDrop :: FTL Instr.Drop
readInstrDrop = readInstrCommand -|- readInstrLimit -|- readInstrBool
  where
    readInstrCommand = fmap Instr.DropCommand (readKeywords Instr.keywordsCommand)
    readInstrLimit = fmap Instr.DropLimit (readKeywords Instr.keywordsLimit)
    readInstrBool = fmap Instr.DropFlag (readKeywords Instr.keywordsFlag)


readKeywords :: [(a, String)] -> Parser st a
readKeywords keywords = try $
  anyToken >>= \s -> msum . map (return . fst) $ filter ((== s) . snd) keywords
