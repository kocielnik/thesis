\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eitidypl}[2017/01/20 v0.2 Praca dyplomowa EiTI Nowe Wymogi by Mikolaj Kowalski cmosqt@gmail.com based on Jakub Schmidtke: sjakub@gmail.com]
% for ref: https://en.wikibooks.org/wiki/LaTeX/Internationalization#Polish

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CONFIG
\RequirePackage{ifthen}
\newboolean{strict}
\newboolean{draft}
\setboolean{strict}{false}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@baseclass{report}
\PassOptionsToClass{11pt,twoside,a4paper}{\@baseclass} %report
%\PassOptionsToClass{11pt,twoside,a4paper,sfheadings}{\@baseclass} %mwrep

\LoadClass[11pt]{\@baseclass} %report
%\LoadClass[withmarginpar,11pt]{\@baseclass} %mwrep
%\usepackage{draftwatermark}
%\SetWatermarkText{\textsc{draft}}
%\SetWatermarkScale{1}
%\SetWatermarkLightness{0.9}
%\SetWatermarkColor[rgb]{0.8,0,0}



%inputenc jest niedozwolony w lualatex
%\usepackage[utf7]{inputenc}
%\usepackage[T0,OT3]{fontenc}
%\usepackage[T0]{fontenc}

%babel
%%\usepackage[polish]{babel}
%%\usepackage{polski}
% or polyglossia
\usepackage{polyglossia}
\setmainlanguage{polish}
\setotherlanguage{english}

\RequirePackage{hyphenat}
\RequirePackage{hyperref}
\RequirePackage{url}


%lualatex only
%http://tex.stackexchange.com/questions/99699/lualatex-use-or-dont-use-classical-font-packages
\usepackage{fontspec}

\RequirePackage[defaultsans]{opensans}

%\renewcommand{\familydefault}{\sfdefault}

\DeclareRobustCommand\ebseries{\fontseries{eb}\selectfont}
\DeclareRobustCommand\sbseries{\fontseries{sb}\selectfont}
\DeclareRobustCommand\ltseries{\fontseries{l}\selectfont}
\DeclareRobustCommand\clseries{\fontseries{cl}\selectfont}

\DeclareTextFontCommand{\texteb}{\ebseries}
\DeclareTextFontCommand{\textsb}{\sbseries}
\DeclareTextFontCommand{\textlt}{\ltseries}
\DeclareTextFontCommand{\textcl}{\clseries}

\newfontfamily{\os}{Open Sans}
\newfontfamily{\osl}[UprightFont={* Light}]{Open Sans}
\newfontfamily{\osi}[ItalicFont={* Italic}]{Open Sans}
\newfontfamily{\osb}[BoldFont={* Bold}]{Open Sans}
\newfontfamily{\osbi}[BoldItalicFont={* Bold Italic}]{Open Sans}



%polishstyle
\renewcommand\thechapter{ \arabic{chapter}.}
\renewcommand\thesection{\arabic{chapter}.\arabic{section}.}
\renewcommand\thesubsection{\arabic{chapter}.\arabic{section}.\arabic{subsection}.}
\renewcommand\thesubsubsection{\arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.}

%rozdzialy 1 poziomu od nowej strony
%rozdzialy 1 poziomu 14pt - \LARGE -17.28
%rozdzialy 2 poziomu 13pt - \Large -14.4
%rozdzialy 3 poziomu 12pt - \large -12
%tekst 11pt
%podpisy pod tabelami,rysunkami 9pt - \footnotesize 9pt
% interlinia 1.15 - setspace, linespread
%http://tex.stackexchange.com/questions/30073/why-is-the-linespread-factor-as-it-is


\usepackage{titlesec}
\ifthenelse{\boolean{strict}}{

\titleformat{\chapter}[hang] %display is default
  {\osb\LARGE}
	{\chaptertitlename \thechapter}{17pt}{\LARGE}
%\titlespacing*{\chapter}
%  {0pt}{50pt}{40pt}
\titleformat{\section}[hang]
  {\osb\Large}
	{\thesection}{1em}{\Large}
\titleformat{\subsection}[hang]
  {\osb\large}
	{\thesubsection}{1em}{\large}
\titleformat{\subsubsection}[hang]
  {\osb\large}
	{\thesubsubsection}{1em}{\large}
}{ %else
\titleformat{\chapter}[hang] %display is default
  {\bfseries\LARGE}
	{\chaptertitlename \thechapter}{17pt}{\LARGE}
%\titlespacing*{\chapter}
%  {0pt}{50pt}{40pt}
\titleformat{\section}[hang]
  {\bfseries\Large}
	{\thesection}{1em}{\Large}
\titleformat{\subsection}[hang]
  {\bfseries\large}
	{\thesubsection}{1em}{\large}
\titleformat{\subsubsection}[hang]
  {\large}
	{\thesubsubsection}{1em}{\large}

}

\RequirePackage{tocloft}
\renewcommand{\cfttoctitlefont}{\bfseries\LARGE}
\renewcommand{\cftloftitlefont}{\bfseries\LARGE}
\renewcommand{\cftlottitlefont}{\bfseries\LARGE}


% automatic detection for luatex
%\PassOptionsToPackage{final}{graphicx}
%\RequirePackage{graphicx}
\graphicspath{{images/}}


%impnattypo requires xcolor
%\RequirePackage[]{xcolor}
\PassOptionsToPackage{luatex,dvipsnames,table,hyperref}{xcolor}






\usepackage{fancyhdr}
\fancyhf{} % clear all header and footers
\fancyfoot[LE,RO]{\thepage}
%\setlength{\headheight}{12pt}
\renewcommand{\headrulewidth}{0pt} % remove the header rule
%redefine style at chapter
%http://tex.stackexchange.com/questions/19738/why-doesnt-pagestyleempty-work-on-the-first-page-of-a-chapter
%\makeatletter
  \let\ps@plain\ps@fancy
%\makeatother

% na oprawe (1.0cm - 0.7cm)*2 = 0.6cm
% na oprawe (1.1cm - 0.7cm)*2 = 0.8cm
%  oddsidemargin lewy margines na nieparzystych stronach
% evensidemargin lewy margines na parzystych stronach
%\def\oprawa{1.05cm}
%\addtolength{\oddsidemargin}{\oprawa}
%\addtolength{\evensidemargin}{-\oprawa}
%\usepackage[left=25mm, right=20mm, top=25mm, bottom=30mm]{geometry}

%for final without comments use below
%\usepackage[bindingoffset=10mm, inner=20mm, top=25mm, bottom=25mm]{geometry}
\usepackage[bindingoffset=10mm, inner=20mm, top=25mm, bottom=25mm,includehead]{geometry}

% Ponizej moze kontrowersyjne ustawienie, ale bardziej mi sie podoba
% brak wciec w pierwszych liniach paragrafu, za to wieksze
% odstepy w pionie miedzy paragrafami.
% Troche nie po polsku, ale wiecej ``powietrza'' jest w pracy.
%\parskip=1em
%\parindent=0mm
%\intextsep=10mm

\renewcommand\maketitle{
	\begin{titlepage}
  \thispagestyle{empty}
	\noindent
	\begin{center}
	\includegraphics{pw.jpg}
	\vspace{10mm}\\
			{\osl \@jednostka}\\
	\vspace{10mm}
	\includegraphics{front-page-title.jpg}

			{\osl na kierunku \@kierunek}\\
			{\osl w specjalności \@specjalnosc}\\
	\vspace{10mm}

		{\osl \Large \@tytul}\\
	\vspace{20mm}
%			\scriptsize Rok akademicki \@rokak\\
	%	\B{PRACA DYPLOMOWA \MakeUppercase{\@typ}}\\[25mm]
		{\osl \huge \@autor}\\%[10mm]
		{\osl Numer albumu \@nralbumu}\\
	\vspace{20mm}
			{\osl promotor}\\
			{\osl \@opiekun}
	\vfill
	{\osl Warszawa, \@rokegz}\\
	\end{center}
	\end{titlepage}
	\setcounter{footnote}{0}
}

\newcommand\makebio{
  \pagenumbering{roman}
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

\newcommand\makededykacja{
\begin{titlepage}
	\noindent
	\vspace{15cm}
	\flushright
	\begin{minipage}{11cm}
			Serdecznie dziękuję XyZ.\\

			Pragnę także ...\\
		\end{minipage}
\end{titlepage}
}

\def\jednostka#1{\gdef\@jednostka{#1}}
\def\@jednostka{???\ClassError{eitidypl}{Brak jednostki}\@ehc}

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
\newcommand{\getautor}{\@autor}

\def\nralbumu#1{\gdef\@nralbumu{#1}}
\def\@nralbumu{???\ClassError{eitidypl}{Brak autora}\@ehc}

\def\tytul#1{\gdef\@tytul{#1}}
\def\@tytul{???\ClassError{eitidypl}{Brak tytulu}\@ehc}
\newcommand{\gettytul}{\@tytul}

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
\newcommand{\getslowakluczowe}{\@slowakluczowe}

\def\slowakluczoween#1{\gdef\@slowakluczoween{#1}}
\def\@slowakluczoween{???\ClassError{eitidypl}{Brak slow kluczowych po angielsku}\@ehc}

\def\instytut#1{\gdef\@instytut{#1}}
\def\@instytut{???\ClassError{eitidypl}{Brak instytutu}\@ehc}

\def\typ#1{\gdef\@typ{#1}}
\def\@typ{???\ClassError{eitidypl}{Brak typu pracy}\@ehc}

\def\specjalnosc#1{\gdef\@specjalnosc{#1}}
\def\@specjalnosc{???\ClassError{eitidypl}{Brak specjalnosci}\@ehc}


\ProcessOptions\relax
