\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eitidypl}[2007/07/23 v0.1 Praca dyplomowa EiTI by Jakub Schmidtke: sjakub@gmail.com]

\def\@baseclass{mwrep}
\PassOptionsToClass{12pt,oneside,a4paper}{\@baseclass}

\ProcessOptions

\LoadClass[withmarginpar]{\@baseclass}

%\usepackage[left=25mm, right=20mm, top=25mm, bottom=30mm]{geometry}
\usepackage[left=35mm, right=20mm, top=20mm, bottom=30mm]{geometry}

% Ponizej moze kontrowersyjne ustawienie, ale bardziej mi sie podoba
% brak wciec w pierwszych liniach paragrafu, za to wieksze
% odstepy w pionie miedzy paragrafami.
% Troche nie po polsku, ale wiecej ``powietrza'' jest w pracy.
\parskip=1em
\parindent=0mm
\intextsep=10mm

\SetSectionFormatting[breakbefore]{chapter}
	{6em}
	{\FormatChapterHeading{0pt}{\Large Rozdzia\l\ }{\LARGE }}
	{8em plus1em minus1em}

\newcommand{\B}[1]{\textbf{#1}}

\renewcommand\maketitle{
	\begin{titlepage}
	\noindent
	\begin{tabular*}{\textwidth}{l @{\extracolsep{\fill}} r}
		\begin{tabular}[t]{c}
			\scriptsize POLITECHNIKA WARSZAWSKA\\
			\scriptsize WYDZIA\L~ELEKTRONIKI I TECHNIK INFORMACYJNYCH\\
			\scriptsize INSTYTUT \MakeUppercase{\@instytut}
		\end{tabular} &
		\begin{tabular}[t]{r}
			\scriptsize Rok akademicki \@rokak
		\end{tabular}
	\end{tabular*}
	\vfill
	\begin{center}
		\B{PRACA DYPLOMOWA \MakeUppercase{\@typ}}\\[25mm]
		\large \@autor\\[10mm]
		\Large \B{\@tytul}
	\end{center}
	\vspace{20mm}
	\begin{flushright}
		\begin{tabular}{l}
			Opiekun pracy\\
			\large \@opiekun
		\end{tabular}
	\end{flushright}
	\vfill
	\begin{tabular}{c}
		\scriptsize Ocena \dotfill\\[10mm]
		\scriptsize \makebox[55mm]{\dotfill}\\
		\scriptsize Podpis Przewodnicz\k{a}cego\\
		\scriptsize Komisji Egzaminu Dyplomowego
	\end{tabular}
	\end{titlepage}
	\setcounter{footnote}{0}
}

\newcommand\makebio{
	\begin{titlepage}
		\noindent
		\begin{minipage}{50mm}
			\includegraphics[width=45mm]{\@foto}
		\end{minipage}
		\hspace{10mm}
		\begin{minipage}{140mm}
			\textbf{Specjalno\'{s}\'{c}:}\\\hspace*{10mm}\@specjalnosc \\[10mm] %'
			\textbf{Data urodzenia:}\hspace*{5mm}\@dataurodzenia \\[10mm]
			\textbf{Data rozpocz\k{e}cia studi\'{o}w:}\hspace*{5mm}\@datarozpoczecia \\ %'
		\end{minipage}
		\\[10mm]
		\textbf{\.{Z}yciorys}\\[1em]
			%\begin{small}
				\@zyciorys
			%\end{small}
		\vspace{10mm}
		\begin{flushright}
			\footnotesize \makebox[50mm]{\dotfill}
		\end{flushright}
		\vfill
		EGZAMIN DYPLOMOWY\\[5mm]
		Z\l o\.{z}y\l~egzamin dyplomowy w dniu \dotfill~\@rokegz\\[2mm]
		z wynikiem \dotfill\\[2mm]
		Og\'{o}lny wynik studi\'{o}w \dotfill\\[5mm] %'
		Dodatkowe wnioski i uwagi Komisji \dotfill \\[2mm]
		\makebox[\textwidth]{\dotfill}\\[2mm]
		\makebox[\textwidth]{\dotfill}\\
	\end{titlepage}
}

\newcommand\makeabstracts{
	\begin{titlepage}
		\noindent
		\begin{center}
			\textbf{Streszczenie}\\[5mm]
		\end{center}
			\@streszczenie\\[5mm]
		\textbf{S\l owa kluczowe:} \@slowakluczowe\\[5mm]
		\begin{minipage}{\textwidth}
			\hrulefill\\
		\end{minipage}
		\begin{center}
			\textbf{\@tytulen}\\[5mm]
		\end{center}
			\@streszczenieen\\[5mm]
		\textbf{Keywords:} \@slowakluczoween\\
		\vspace*{0pt}\vfill
	\end{titlepage}
}

\newcommand\makeinfo{
	\begin{titlepage}
		\noindent
		\begin{tabular*}{\textwidth}{l @{\extracolsep{\fill}} r}
			\begin{tabular}[t]{c}
				\scriptsize POLITECHNIKA WARSZAWSKA\\
				\scriptsize INSTYTUT \MakeUppercase{\@instytut}
			\end{tabular} &
			\begin{tabular}[t]{r}
				\scriptsize Rok akademicki\\
				\scriptsize \@semestr~\@rokak\\
			\end{tabular}\\[10mm]
			\multicolumn{2}{c}{\textbf{\small KARTA INFORMACYJNA DYPLOMANTA}}\\
			\multicolumn{2}{c}{\small{studia \@stopien~stopnia}}\\[5mm]
		\end{tabular*}
		\begin{minipage}{50mm}
			\includegraphics[width=45mm]{\@foto}
		\end{minipage}
		\hspace{7mm}
		\begin{minipage}{140mm}
			\begin{tabular}[t]{p{30mm} l}
				\multicolumn{2}{l}\@autor \\[5mm]
				Kierunek: & \@kierunek \\[5mm]
				Specjalno\'{s}\'{c}: & \@specjalnosc \\[5mm] %'
				Adres: & \@adresa \\
				& \@adresb \\
			\end{tabular}\\
			% \@autor\\[5mm]
			% Kierunek:\hspace*{8mm}\@kierunek \\[5mm]
			% Specjalno\'{s}\'{c}:\hspace*{3mm}\@specjalnosc \\[5mm] %'
			% Adres:\\\hspace*{5mm}\@adres1 \\[5mm]
		\end{minipage}
		\begin{center}
			\textbf{\small \.{Z}YCIORYS}\\[1em]
		\end{center}
		\begin{small}\@zyciorys\end{small}
		\begin{flushright}
			\footnotesize \makebox[50mm]{\dotfill}
		\end{flushright}
		\vfill
		\small Z\l o\.{z}y\l~egzamin dyplomowy w dniu \dotfill~\@rokegz\\[2mm]
		\makebox[\textwidth]{\small z wynikiem \dotfill~Ocena pracy dyplomowej \dotfill}\\[2mm]
		\makebox[\textwidth]{\small \'{S}rednia ocen ze studi\'{o}w \dotfill~Og\'{o}lny wynik studi\'{o}w \dotfill}\\[2mm] %'
		\makebox[\textwidth]{\hrulefill}
		\small Recenzent pracy dyplomowej \dotfill \\[2mm]
		\small Ocena recenzenta \dotfill \\[2mm]
		\small Przewodnicz\k{a}cy Kom.Egz.Dyplomowego \dotfill \\[2mm]
		\small Cz\l onkowie Kom.Egz. \dotfill \\[2mm]
		\makebox[\textwidth]{\small \dotfill}\\
	\end{titlepage}
	\begin{titlepage}
		\noindent
		\scriptsize POLITECHNIKA WARSZAWSKA\\
		\scriptsize INSTYTUT \MakeUppercase{\@instytut}\\[5mm]
		\begin{tabular}[t]{l p{100mm}}
			\small Autor: & \small \@autor\\[5mm]
			\small Tytu\l~pracy dyplomowej: & \small \@tytul\\[5mm]
			\small Opiekun naukowy: & \small \@opiekun\\[2mm]
		\end{tabular}
		\begin{center}
			\textbf{\small STRESZCZENIE}\\[5mm]
		\end{center}
			\footnotesize \@streszczenie\\[5mm]
		\textbf{\small S\l owa kluczowe:} \small \@slowakluczowe
		\begin{center}
			\makebox[\textwidth]{\scriptsize \hrulefill}\\[15mm]
		\end{center}
		\begin{center}
			\textbf{\small \@tytulen}\\[5mm]
		\end{center}
			\footnotesize \@streszczenieen\\[5mm]
		\textbf{\small Keywords:} \small \@slowakluczoween\\
		\vspace*{0pt}\vfill
	\end{titlepage}
}

\def\rokak#1{\gdef\@rokak{#1}}
\def\@rokak{???\ClassError{eitidypl}{Brak roku akademickiego}\@ehc}

\def\semestr#1{\gdef\@semestr{#1}}
\def\@semestr{???\ClassError{eitidypl}{Brak semestru}\@ehc}

\def\stopien#1{\gdef\@stopien{#1}}
\def\@stopien{???\ClassError{eitidypl}{Brak stopnia studiow}\@ehc}

\def\kierunek#1{\gdef\@kierunek{#1}}
\def\@kierunek{???\ClassError{eitidypl}{Brak kierunku studiow}\@ehc}

\def\adresa#1{\gdef\@adresa{#1}}
\def\@adresa{???\ClassError{eitidypl}{Brak adresu-a}\@ehc}

\def\adresb#1{\gdef\@adresb{#1}}
\def\@adresb{???\ClassError{eitidypl}{Brak adresu-b}\@ehc}

\def\rokegz#1{\gdef\@rokegz{#1}}
\def\@rokegz{???\ClassError{eitidypl}{Brak roku zlozenia egzaminu}\@ehc}

\def\autor#1{\gdef\@autor{#1}}
\def\@autor{???\ClassError{eitidypl}{Brak autora}\@ehc}

\def\tytul#1{\gdef\@tytul{#1}}
\def\@tytul{???\ClassError{eitidypl}{Brak tytulu}\@ehc}

\def\tytulen#1{\gdef\@tytulen{#1}}
\def\@tytulen{???\ClassError{eitidypl}{Brak tytulu po angielsku}\@ehc}

\def\opiekun#1{\gdef\@opiekun{#1}}
\def\@opiekun{???\ClassError{eitidypl}{Brak opiekuna}\@ehc}

\def\dataurodzenia#1{\gdef\@dataurodzenia{#1}}
\def\@dataurodzenia{???\ClassError{eitidypl}{Brak daty urodzin}\@ehc}

\def\datarozpoczecia#1{\gdef\@datarozpoczecia{#1}}
\def\@datarozpoczecia{???\ClassError{eitidypl}{Brak daty rozpoczecia studiow}\@ehc}

\def\foto#1{\gdef\@foto{#1}}
\def\@foto{???\ClassError{eitidypl}{Brak fotografii}\@ehc}

\def\zyciorys#1{\gdef\@zyciorys{#1}}
\def\@zyciorys{???\ClassError{eitidypl}{Brak zyciorysu}\@ehc}

\def\streszczenie#1{\gdef\@streszczenie{#1}}
\def\@streszczenie{???\ClassError{eitidypl}{Brak streszczenia}\@ehc}

\def\streszczenieen#1{\gdef\@streszczenieen{#1}}
\def\@streszczenieen{???\ClassError{eitidypl}{Brak streszczenia po angielsku}\@ehc}

\def\tytulen#1{\gdef\@tytulen{#1}}
\def\@tytulen{???\ClassError{eitidypl}{Brak tytulu po angielsku}\@ehc}

\def\slowakluczowe#1{\gdef\@slowakluczowe{#1}}
\def\@slowakluczowe{???\ClassError{eitidypl}{Brak slow kluczowych}\@ehc}

\def\slowakluczoween#1{\gdef\@slowakluczoween{#1}}
\def\@slowakluczoween{???\ClassError{eitidypl}{Brak slow kluczowych po angielsku}\@ehc}

\def\instytut#1{\gdef\@instytut{#1}}
\def\@instytut{???\ClassError{eitidypl}{Brak instytutu}\@ehc}

\def\typ#1{\gdef\@typ{#1}}
\def\@typ{???\ClassError{eitidypl}{Brak typu pracy}\@ehc}

\def\specjalnosc#1{\gdef\@specjalnosc{#1}}
\def\@specjalnosc{???\ClassError{eitidypl}{Brak specjalnosci}\@ehc}
