% Kelley Morse Theory of Sets and Classes

% We formalize the 

% Appendix: ELEMENTARY SET THEORY 

% of John L. Kelley 
% GENERAL TOPOLOGY 
% D. Van Nostrand Company Inc. 1955
%
% The appendix develops what is known as Kelley-Morse
% class theory (KM). 
% Kelley writes: "The system of axioms adopted is a variant
% of systems of Skolem and of A.P.Morse and owes much to
% the Hilbert-Bernays-von Neumann system as formulated
% by Gödel."

% This file covers the first 56 top level sections of the appendix.
% It uses SADs inbuilt class notion and mechanisms to model the
% classes of Kelley. We have built the class notion into 
% Naproche-SAD by replacing "set" by "class"

% This file checks in ~ 1 min on my laptop.

\section{The Classification Axiom Scheme}

Let $x, y, z, r, s, t, u, v, a, b, c, d, e$ stand for classes.

Let $a \neq b$ stand for $a$ != $b$.
Let $a \in b$ stand for $a$ is an element of $b$.

% Axiom I. Axiom of extent.
\begin{axiom} For each $x, y$  
it is true that $x = y$ if and only if for each $z$\ $z \in x$ 
when and only when $z \in y$.
\end{axiom}

% II Classification axiom-scheme corresponds to the way
% "classifications", i.e., abstraction terms are handled
% in Naproche-SAD

[synonym set/-s]

\begin{definition} 
$x$ is a set iff for some $y$ $x \in y$.
\end{definition}

\section{ELEMENTARY ALGEBRA OF CLASSES}

\begin{definition} 
$x \cup y = \{$set $z : z \in x$ or $z \in y \}$.
\end{definition}

\begin{definition} 
$x \cap y = \{$set $u : u \in x$ and $u \in y \}$.
\end{definition}

Let the union of $x$ and $y$ stand for $x \cup y$.
Let the intersection of $x$ and $y$ stand for $x \cap y$.

\begin{theorem}
$(z \in x \cup y$ iff $z \in x$ or $z \in y)$
and $(z \in x \cap y$ iff $z \in x$ and $z \in y)$.
\end{theorem}

\begin{theorem}
$x \cup x = x$ and $x \cap x = x$.
\end{theorem}

\begin{theorem}
$x \cup y = y \cup x$ and $x \cap y = y \cap x$.
\end{theorem}

\begin{theorem}
$(x \cup y) \cup z = x \cup (y \cup z)$ 
and $(x \cap y) \cap z = x \cap (y \cap z)$.
\end{theorem}

\begin{theorem} $x \cap (y \cup z) = (x \cap y) \cup (x \cap z)$
and $x \cup (y \cap z) = (x \cup y) \cap (x \cup z)$.
\end{theorem}

% 9 Definition, as a parser directive.
Let $a \notin b$ stand for $a$ is not an element of $b$.

\begin{definition} $\sim x = \{$set $y : y \notin x\}$.\end{definition}
Let the complement of $x$ stand for $\sim x$.

\begin{theorem}
$\sim (\sim x) = x$.
\end{theorem}

\begin{theorem}
$\sim (x \cup y) = (\sim x) \cap (\sim y)$ 
and $\sim (x \cap y) = (\sim x) \cup (\sim y)$.
\end{theorem}

\begin{definition} $x \sim y = x \cap (\sim y)$.\end{definition}

\begin{theorem}
$x \cap (y \sim z) = (x \cap y) \sim z$.
\end{theorem}

\begin{definition} $0 = \{$set $x : x \neq x\}$.\end{definition}
Let the void class stand for $0$.
Let zero stand for $0$.

\begin{theorem}
$x \notin 0$.
\end{theorem}

\begin{theorem}
$0 \cup x = x$ and $0 \cap x = 0$.
\end{theorem}

\begin{definition} $\cal{U} = \{$set $x : x = x\}$.\end{definition}
Let the universe stand for $\cal{U}$.

\begin{theorem}
$x \in \cal{U}$ if and only if $x$ is a set.
\end{theorem}

\begin{theorem}
$x \cup \cal{U} = \cal{U}$ and $x \cap \cal{U} = x$.
\end{theorem}

\begin{theorem}
$\sim 0 = \cal{U}$ and $\sim \cal{U} = 0$.
\end{theorem}

\begin{definition} $\bigcap x = 
\{$set $z :$ for each $y$ if $y \in x$ then $z \in y\}$.\end{definition}

\begin{definition} $\bigcup x = 
\{$set $z :$ for some $y$ $(z \in y$ and $y \in x)\}$.\end{definition}

Let the intersection of $x$ stand for $\bigcap x$.
Let the union of $x$ stand for $\bigcup x$.

\begin{theorem}
$\bigcap 0 = \cal{U}$ and $\bigcup 0 = 0$.
\end{theorem}

\begin{definition} $x$ is a subclass of $y$ iff 
for each $z$ if $z \in x$ then $z \in y$.
\end{definition}

Let $x \subset y$ stand for $x$ is a subclass of $y$.
Let $x$ is contained in $y$ stand for $x \subset y$.

\begin{lemma}
$0 \subset 0$ and $0 \notin 0$.
\end{lemma}

\begin{theorem}
$0 \subset x$ and $x \subset \cal{U}$.
\end{theorem}

\begin{theorem}
$x = y$ iff $x \subset y$ and $y \subset x$.
\end{theorem}

\begin{theorem}
If $x \subset y$ and $y \subset z$ then $x \subset z$.
\end{theorem}

\begin{theorem}
$x \subset y$ iff $x \cup y = y$.
\end{theorem}

\begin{theorem}
$x \subset y$ iff $x \cap y = x$.
\end{theorem}

\begin{theorem}
If $x \subset y$ then $\bigcup x \subset \bigcup y$
and $\bigcap y \subset \bigcap x$.
\end{theorem}

\begin{theorem}
If $x \in y$ then $x \subset \bigcup y$ 
and $\bigcap y \subset x$.
\end{theorem}

\section{EXISTENCE OF SETS}

% Axiom of subsets.
\begin{axiom}
If $x$ is a set then there is a set $y$ such that for each
$z$ if $z \subset x$ then $z \in y$.
\end{axiom}

% This axiom is a kind of powerclass axiom, where the powerclass
% also has all subCLASSES as elements.

\begin{theorem}
If $x$ is a set and $z \subset x$ then $z$ is a set.
\end{theorem}

\begin{theorem}
$0 = \bigcap \cal{U}$ and $\cal{U} = \bigcup \cal{U}$.
\end{theorem}

\begin{theorem}
If $x \neq 0$ then $\bigcap x$ is a set.
\end{theorem}

\begin{definition} $2^{x} = \{$set $y : y \subset x\}$.\end{definition}

\begin{theorem}
$\cal{U} = 2^{\cal{U}}$.
\end{theorem}

%[prove off]
\begin{theorem}
If $x$ is a set then $2^{x}$ is a set and for
each $y$  $y \subset x$ iff $y \in 2^{x}$.
\end{theorem}

\begin{proof}
Let $x$ be a set.
Take a set $y$ such that for each $z$ 
if $z \subset x$ then $z \in y$.
$2^{x} \subset y$.
\end{proof}
%[/prove]

% The Russell paradox.

\begin{definition} $\cal{R} = \{$set $x : x \notin x\}$.\end{definition}

\begin{theorem}
$\cal{R}$ is not a set.
\end{theorem}

\begin{theorem}
$\cal{U}$ is not a set.
\end{theorem}

\begin{definition} $\{x\} = \{$set $z :$ if $x \in \cal{U}$ then $z = x\}$.\end{definition}
Let the singleton of $x$ stand for ${x}$.

% Before We used <x> instead of {x} since {x} was an inbuilt 
% set notation   

\begin{theorem}
If $x$ is a set then for each $y$ $y \in \{x\}$ iff $y = x$.
\end{theorem}

\begin{theorem}
If $x$ is a set then $\{x\}$ is a set.
\end{theorem}
\begin{proof}
Let $x$ be a set. Then $\{x\} \subset 2^{x}$ 
and $2^{x}$ is a set.
\end{proof}

\begin{theorem}
$\{x\} = \cal{U}$ if and only if $x$ is not a set.
\end{theorem}

\begin{theorem}
If $x$ is a set then $\bigcap \{x\} = x$ 
and $\bigcup \{x\} = x$.
\end{theorem}

\begin{theorem}
If $x$ is not a set then $\bigcap \{x\} = 0$
and $\bigcup \{x\} = \cal{U}$.
\end{theorem}

% Axiom IV. 
\begin{axiom}
If $x$ is a set and $y$ is a set then $x \cup y$ is a set.
\end{axiom}

\begin{definition} $\{x,y\} = \{x\} \cup \{y\}$.\end{definition}
Let the unordered pair of $x$ and $y$ stand for $\{x,y\}$.

% The following has been a problem before:
% We use <x,y> instead of {x y} because Naproche-SAD requires
% some symbolic or textual material between the variables
% x and y. We use {x;y} instead of {x,y} because the latter
% notion is an inbuilt set notation of Naproche-SAD.

\begin{theorem}
If $x$ is a set and $y$ is a set 
then $\{x,y\}$ is a set and $(z \in \{x,y\}$ iff $z=x$ or $z=y$). 
\end{theorem}

\begin{theorem}
$\{x,y\} = \cal{U}$ if and only if $x$ is not a set or $y$ is not a set.
\end{theorem}

\begin{theorem}
If $x,y$ are sets then $\bigcap \{x,y\} = x \cap y$
and $\bigcup \{x,y\} = x \cup y$.
\end{theorem}
\begin{proof}
Let $x,y$ be sets.
$\bigcup \{x,y\} \subset x \cup y$.
$x \cup y \subset \bigcup \{x,y\}$.
\end{proof}

\begin{theorem}
If $x$ is not a set or $y$ is not a set then
$\bigcap \{x,y\} = 0$ and $\bigcup \{x,y\} = \cal{U}$.
\end{theorem}

\section{ORDERED PAIRS: RELATIONS}

\begin{definition} $[x,y] = \{\{x\},\{x,y\}\}$.\end{definition}
Let the ordered pair of $x$ and $y$ stand for $[x,y]$.

\begin{theorem}
$[x,y]$ is a set if and only if $x$ is a set and $y$ is a set.
\end{theorem}

\begin{theorem}
If $[x,y]$ is not a set then $[x,y] = \cal{U}$.
\end{theorem}

\begin{theorem}
If $x$ and $y$ are sets then 
  $\bigcup [x,y] = \{x,y\}$ and
  $\bigcap [x,y] = \{x\}$ and
  $\bigcup \bigcap [x,y] = x$ and
  $\bigcap \bigcap [x,y] = x$ and
  $\bigcup \bigcup [x,y] = x \cup y$ and
  $\bigcap \bigcup [x,y] = x \cap y$.
\end{theorem}

\begin{theorem}
If $x$ is not a set or $y$ is not a set then
  $\bigcup \bigcap [x,y] = 0$ and
  $\bigcap \bigcap [x,y] = \cal{U}$ and
  $\bigcup \bigcup [x,y] = \cal{U}$ and
  $\bigcap \bigcup [x,y] = 0$.
\end{theorem}

\begin{definition} $1^{st}$ coord $z = \bigcap \bigcap z$.\end{definition}

\begin{definition} $2^{nd}$ coord $z = (\bigcap \bigcup z) \cup 
((\bigcup \bigcup z) \sim \bigcup \bigcap z)$.\end{definition} 
Let the first coordinate of $z$ stand for $1^{st}$ coord $z$.
Let the second coordinate of $z$ stand for$2^{nd}$ coord $z$.
             
\begin{theorem}
$2^{nd}$ coord $\cal{U} = \cal{U}$.
\end{theorem}

\begin{theorem}
If $x$ and $y$ are sets 
then $1^{st}$ coord $[x,y] = x$ and $2^{nd}$ coord $[x,y] = y$.
\end{theorem}
\begin{proof}
Let $x$ and $y$ be sets.
$2^{nd}$ coord $[x,y] = (\bigcap \bigcup [x,y]) \cup 
((\bigcup \bigcup [x,y]) \sim \bigcup \bigcap [x,y])
= (x \cap y) \cup ((x \cup y) \sim x)
= y$.
\end{proof}

\begin{theorem}
If $x$ is not a set or $y$ is not a set then
$1^{st}$ coord $[x,y] = \cal{U}$ and 
$2^{nd}$ coord $[x,y] = \cal{U}$.
\end{theorem}

\begin{theorem}
If $x$ and $y$ are sets and $[x,y] = [u,v]$ then
$x = u$ and $y = v$.
\end{theorem}

% We can interpret \cal{U} to mean undefined.
% Then ( , ) produces a a set or undefined.
% We can instead extend the signature (our language)
% by an elementary symbol ( , ), satisfying standard axioms ... .
% Ideally, we would like ( , ) to be an "object" and
% not a set. Sets will also be objects.

\begin{definition} 
A class $r$ is a relation if and only if for each element $z$ of $r$
there is $x$ and $y$ such that $z = [x,y]$.
\end{definition}


