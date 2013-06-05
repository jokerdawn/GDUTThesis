\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gdutthesis}

\newif\ifisttf\isttftrue
\newif\ifistwoside\istwosidefalse
\DeclareOption{twoside}{\istwosidetrue}
\DeclareOption{ttf}{\isttftrue}
\DeclareOption{otf}{\isttffalse}
\newif\ifisws\iswsfalse
\DeclareOption{ws}{\iswstrue}
\DeclareOption*{\PackageWarning{gdutthesis}{Unknown Option '\CurrentOption'}}
\ProcessOptions\relax
\RequirePackage{ifthen,calc}

\ifistwoside
  \LoadClass[a4paper,12pt,openright,twoside]{book}
\else
  \LoadClass[a4paper,12pt,oneside]{book}
  \fi
  
\RequirePackage[includefoot]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage[center]{titlesec}
\RequirePackage{titletoc}
\RequirePackage{graphicx}
\RequirePackage[config]{subfig}
\RequirePackage{float}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{tabularx}
\RequirePackage[neverdecrease]{paralist}
\RequirePackage{xcolor}
\RequirePackage{amsmath,amssymb,bm}
\RequirePackage[varg]{txfonts}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage[CJKnumber,no-math,BoldFont,SlantFont]{xeCJK}
\RequirePackage{indentfirst}
\RequirePackage[numbers,sort&compress,square]{natbib}
\RequirePackage[CJKbookmarks=true,pdfborder=0 0 1]{hyperref}

\defaultfontfeatures{Mapping=tex-text} %Using the tex-text mapping is also equivalent to writing Ligatures=TeX. 
%The use of the latter syntax is recommended for better compatibility with LuaTEX documents.
%http://mirror.math.ku.edu/tex-archive/macros/latex/contrib/fontspec/fontspec.pdf

\xeCJKsetcharclass{"0}{"2E7F}{0}
\xeCJKsetcharclass{"2E80}{"FFFF}{1}

\newcommand\installTTF{%
  \setmainfont{Times New Roman}
  \setsansfont{Arial}
  \setmonofont{Courier New}
  \ifisws
    \setCJKmainfont[BoldFont={SimHei},ItalicFont={KaiTi}]{SimSun}
    \setCJKmonofont{KaiTi} % Pluto use LiSu Thu use Kaiti, orig is SimSun
  \else
    \setCJKmainfont[BoldFont={SimHei},ItalicFont={KaiTi_GB2312}]{SimSun}
    \setCJKmonofont{KaiTi_GB2312} % Pluto use LiSu Thu use Kaiti, orig is SimSun
  \fi
  \setCJKsansfont{SimHei}
  \setCJKfamilyfont{song}{SimSun}
  \setCJKfamilyfont{hei}{SimHei}
}

\newcommand\installOTF{%
  \setmainfont{Times New Roman} % could be changed to "Times New Roman PS Std"
  \setsansfont{Arial}
  \setmonofont{Courier New}
  \setCJKmainfont[BoldFont={Adobe Heiti Std},ItalicFont={Adobe Kaiti Std}]{Adobe Song Std}
  \setCJKsansfont{Adobe Heiti Std}
  \setCJKmonofont{Adobe Kaiti Std}
  \setCJKfamilyfont{song}{Adobe Song Std}
  \setCJKfamilyfont{hei}{Adobe Heiti Std}
}

\ifisttf
  \installTTF
\else
  \installOTF
\fi

\newcommand{\song}{\CJKfamily{song}}    % 宋体
\newcommand{\hei}{\CJKfamily{hei}}      % 黑体
\def\songti{\song}
\def\heiti{\hei}

\newlength\thu@linespace %自定义基线大小 原命令为\baselineskip 或 \lineskip

%\newcommand{\thu@choosefont}[2]{%
%    \setlength{\thu@linespace}{#2*\real{#1}}  %#1默认为\baselinestretch 即字号大小乘与N倍行距 
%    \fontsize{#2}{\thu@linespace}\selectfont}

%在Word中，五号（10.5pt）的宋体字，行距为13.5pt，行距为字体大小的1.286倍，而黑体一样。Adobe song STD的字体磅数与行距大小
%比为1：1.523，而Adobe Heiti STD的是，1：1.619。至于Times New Roman为1：1.18。混合排版的话以最大为基准排。
%再多嘴一句，假如你需要高仿Word精确排版，请不断尝试。一个词形容，贵圈真乱。

%需要精确修改的话，可以使用在换字体的时候修改命令A处#1的值，或直接在xiaochu后加个[系数]

%附上一个以Lineskip为基准的选择字体命令，这样符合使用Word者的习惯，1.5倍行距则\renewcommand{\baselinestretch}{1.5} 
%http://blog.he96.com/2011/09/tex.html
\newcommand{\thu@choosefont}[2]{\fontsize{#2}{#1\baselineskip}\selectfont} %命令A
    
\def\thu@define@fontsize#1#2{%
    \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \thu@choosefont{##1}{#2}}}

\thu@define@fontsize{chuhao}{42bp}
\thu@define@fontsize{xiaochu}{36bp}
\thu@define@fontsize{yihao}{26bp}
\thu@define@fontsize{xiaoyi}{24bp}
\thu@define@fontsize{erhao}{22bp}
\thu@define@fontsize{xiaoer}{18bp}
\thu@define@fontsize{sanhao}{16bp}
\thu@define@fontsize{xiaosan}{15bp}
\thu@define@fontsize{sihao}{14bp}
\thu@define@fontsize{banxiaosi}{13bp}
\thu@define@fontsize{xiaosi}{12bp}
\thu@define@fontsize{dawu}{11bp}
\thu@define@fontsize{wuhao}{10.5bp}
\thu@define@fontsize{xiaowu}{9bp}
\thu@define@fontsize{liuhao}{7.5bp}
\thu@define@fontsize{xiaoliu}{6.5bp}
\thu@define@fontsize{qihao}{5.5bp}
\thu@define@fontsize{bahao}{5bp}

\renewcommand{\baselinestretch}{1.5}

\renewcommand{\tabularxcolumn}[1]{m{#1}}

\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}} 

\renewcommand\contentsname{目\hspace{5em}录}
\newcommand\ackname{致\hspace{1em}谢}
\newcommand\equationname{公式}
\renewcommand\bibname{参\hspace{1em}考\hspace{1em}文\hspace{1em}献}
\renewcommand\figurename{图}
\renewcommand\tablename{表}
\renewcommand\appendixname{附录}
\def\CJK@today{\heiti{\the\year 年 \the\month 月}}
\newcommand\zhtoday{\CJK@today}
\newcommand\entoday{\today{}}
\geometry{top=28mm,bottom=15mm,left=30mm,right=20mm,nohead}
\geometry{footskip=10mm}
 
\newcommand\dlmu[2][6.5cm]{\hskip1pt\underline{\hb@xt@#1{\hss#2\hss}}\hskip3pt}

\fancypagestyle{plain}{\renewcommand{\headrulewidth}{0pt}\fancyhf{}}

\fancypagestyle{mainpage}{\fancyhf{}\fancyfoot[ER,OR]{\thepage}}

\fancypagestyle{appendixpage}{\fancyhf{}\fancyfoot[ER,OR]{\thepage}}

\fancypagestyle{emptypage}{\fancyhf{}\fancyfoot[ER,OR]{\thepage}}

\renewcommand\frontmatter{%
    \if@openright\cleardoublepage\else\clearpage\fi
  \clearpage
    \@mainmatterfalse
	\fancyhf{}
    \pagestyle{plain}
}

\renewcommand\mainmatter{%
    \if@openright\cleardoublepage\else\clearpage\fi
	\clearpage
    \@mainmattertrue
    \pagenumbering{arabic}
    \normalsize % normal, 正文开始
    \def\@tabular{\wuhao[0.85]\old@tabular} % 之后表格字体使用5号
    \pagestyle{mainpage}
  }
\renewcommand\backmatter{%
    \if@openright\cleardoublepage\else\clearpage\fi
	\clearpage	
    \pagestyle{appendixpage}
  }
  
\newenvironment{ack}{%
  \thispagestyle{emptypage}
  \chapter*{\ackname}%
  \addcontentsline{toc}{chapter}{致谢}%
  \xiaosi[1]%
  \@afterheading
}

\newcounter{appx}[chapter]
\renewcommand{\theappx}{\Alph{appx}}
\newcommand{\appx}[1]{\refstepcounter{appx}%
\begin{center}
\heiti \bfseries \sanhao{\par{附录}\textbf{\theappx}\quad#1}
\end{center}
\vspace{0.8em}}

\newcounter{appxtab}[appx]
\renewcommand{\theappxtab}{\theappx\arabic{appxtab}}
\newcommand{\appxtab}{\refstepcounter{appxtab}\centering \heiti \bfseries {\par{表\hspace{0.2em}}\theappxtab}\quad}

\newcounter{appxfig}[appx]
\renewcommand{\theappxfig}{\theappx\arabic{appxfig}}
\newcommand{\appxfig}{\refstepcounter{appxfig}\centering \song{\par{图\hspace{0.2em}}\theappxfig\quad}}

\newcommand{\appxtoc}[1]{\appx{#1}\par\addcontentsline{toc}{chapter}{附录\theappx}}

\newenvironment{appxchp}{%
\@afterheading%
\clearpage}{}

\renewcommand\cleardoublepage{\clearpage\if@openright \ifodd\c@page
  \else
  \newpage{}
  \thispagestyle{empty}
  \vspace*{\fill}
  \begin{center}
  \end{center}
  \vspace*{\fill}
  \clearpage\fi\fi%
}

\newcommand\cabstractname{摘\hspace{2em}要}
\newcommand\ckeywordsname{{\heiti \sihao \textbf{关键词}}}
\newcommand\ckeywords[1]{\xiaosi \songti \ckeywordsname: #1}

\newcommand\eabstractname{Abstract}
\newcommand\ekeywordsname{\xiaosi \textbf{KEY WORDS}}
\newcommand\ekeywords[1]{{\xiaosi \ekeywordsname: #1}}

\newenvironment{cabstract}{%
  \titleformat*{\chapter}{\xiaosan \heiti \filcenter \bfseries}
  \chapter*{\cabstractname}
  \xiaosi[1]
  \@afterheading}
{\par\vspace{1em}\par}

\newenvironment{eabstract}{%
  \titleformat*{\chapter}{\sihao \filcenter \bfseries}
  \chapter*{\eabstractname}
  \xiaosi[1]
  \@afterheading}
{\par\vspace{1em}\par}

\titlecontents{chapter}[0pt]{\vspace{6bp} \heiti \xiaosi[1]}
    {\thecontentslabel\quad}{}
    {\titlerule*{.}\contentspage}
\titlecontents{section}[1.5em]{\songti \xiaosi[1]}
    {\thecontentslabel\quad}{}
    {\titlerule*{.}\contentspage}
\titlecontents{subsection}[3em]{\songti \xiaosi[1]}
    {\thecontentslabel\quad}{}
    {\titlerule*{.}\contentspage}


\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                     \clearpage
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\gdut@chapter\@schapter}
					

\def\gdut@chapter[#1]#2{
  \ifnum \c@secnumdepth >\m@ne
    \if@openright\cleardoublepage\else\clearpage\fi
	\clearpage
    \phantomsection %指引到标签\label所在的位置，http://zh.wikibooks.org/wiki/LaTeX/%E6%A0%87%E8%AE%B0%E4%B8%8E%E5%BC%95%E7%94%A8
    \if@mainmatter
      \refstepcounter{chapter}%
      \addcontentsline{toc}{chapter}%
        {\protect\numberline{\thechapter}#1}%
    \else
      \addcontentsline{toc}{chapter}{#1}%
    \fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \if@twocolumn
    \@topnewpage[\@makechapterhead{#2}]%
  \else
    \@makechapterhead{#2}%
    \@afterheading
  \fi
}

\newcommand{\sectionbreak}{\addpenalty{-300}\vspace*{0pt}}

\setlength{\topskip}{0pt}
\setcounter{secnumdepth}{3} % 数字到subsection
\titleformat{\chapter}{\filcenter \heiti \bfseries \sanhao}{\thechapter}{1.2em}{}
\titleformat{\section}{\heiti \bfseries\xiaosi}{\thesection}{0.2em}{}
\titleformat{\subsection}{\heiti \xiaosi}{\thesubsection}{1em}{}

\titlespacing{\chapter}{0pt}{0pt}{1em}
\titlespacing{\section}{0pt}{0.5em}{0.5em}
\titlespacing{\subsection}{0pt}{0.5em}{0.5em}

\renewcommand\normalsize{\@setfontsize\normalsize{12bp}{12.87bp}%
\setlength\abovedisplayskip{10bp \@plus 2bp \@minus 2bp}%
\setlength\abovedisplayshortskip{10bp \@plus 2bp \@minus 2bp}%
\setlength\belowdisplayskip{\abovedisplayskip}%
\setlength\belowdisplayshortskip{\abovedisplayshortskip}%
}

\setlength{\parindent}{2.5em}
\setlength{\parskip}{0bp \@plus .5bp \@minus .5bp}

\renewenvironment{thebibliography}[1]{%
  \thispagestyle{emptypage}
  \chapter*{\bibname}%
  \addcontentsline{toc}{chapter}{参考文献}
  \list{\@biblabel{\@arabic\c@enumiv}}%
  {\renewcommand{\makelabel}[1]{##1\hfill}
    \setlength{\labelsep}{1ex}
    \setlength{\itemindent}{0pt}
    \setlength{\leftmargin}{\labelwidth+\labelsep}
    \addtolength{\itemsep}{-0.2em}
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy\frenchspacing
  \clubpenalty4000%
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \interlinepenalty4000%
  \sfcode`\.\@m
}
{\def\@noitemerr
  {\@latex@warning{Empty `thebibliography' environment}}%
  \endlist\frenchspacing}

\aboverulesep=0pt
\belowrulesep=0pt
\heavyrulewidth=0.10em

\newcommand{\tabref}[1]{{表~\ref{tab:#1}}}
\newcommand{\figref}[1]{{图~\ref{fig:#1}}}

\newcommand{\figcaption}{\def\@captype{figure}\caption}
\newcommand{\tabcaption}{\def\@captype{table}\caption}
  
\setlength{\floatsep}{8bp \@plus 2bp \@minus 1bp}
\setlength{\intextsep}{8bp \@plus 2bp \@minus 1bp}
\setlength{\textfloatsep}{8bp \@plus 2bp \@minus 1bp}
\setlength{\@fptop}{0bp \@plus1.0fil}
\setlength{\@fpsep}{10bp \@plus2.0fil}
\setlength{\@fpbot}{0bp \@plus1.0fil}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.80}

\let\old@tabular\@tabular

\DeclareCaptionLabelFormat{tabularlabel}{{{\wuhao[0.75]} \heiti #1~\rmfamily #2}}
\DeclareCaptionLabelFormat{figurelabel}{{{\wuhao[0.75]} \song #1~\rmfamily #2}}
\DeclareCaptionLabelSeparator{floatsong}{\hspace{1em}}
\DeclareCaptionFont{tabularcap}{{\wuhao[0.75]}\bfseries \heiti}
\DeclareCaptionFont{figurecap}{{\wuhao[0.75]}\song}
\captionsetup[table]{position=top,belowskip=-0.2em,aboveskip=0.1em,labelformat=tabularlabel,labelsep=floatsong,font=tabularcap}
\captionsetup[figure]{position=bottom,belowskip=0.1em,aboveskip=-0.2em,labelformat=figurelabel,labelsep=floatsong,font=figurecap}
\captionsetup[subfloat]{justification=centering}
\renewcommand{\thesubfigure}{\alph{subfigure}}
\renewcommand{\thesubtable}{\alph{subtable}}

\renewtheoremstyle{nonumberplain}%
{\item[\hspace*{2em} \theorem@headerfont ##1\ \theorem@separator]}%
{\item[\hspace*{2em} \theorem@headerfont ##1\ (##3)\theorem@separator]}
\theoremstyle{nonumberplain}
\theorembodyfont{\rmfamily}
\theoremheaderfont{\sffamily}
\theoremsymbol{\ensuremath{\blacksquare}}
\theoremseparator{:\,}
\newtheorem{proof}{证明}[chapter]
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]

\renewtheoremstyle{plain}%
{\item[\hspace*{2em} \theorem@headerfont ##1\ ##2\theorem@separator]}%
{\item[\hspace*{2em} \theorem@headerfont ##1\ ##2\ (##3)\theorem@separator]}
\theoremstyle{plain}
\theorembodyfont{\kai}
\theoremheaderfont{\hei}
\theoremsymbol{}
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{conjecture}{猜想}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{exercise}{练习}[section]
\newtheorem{example}{例}[section]
\newtheorem{problem}{问题}[section]
\newtheorem{remark}{注释}[section]

\renewenvironment{split}{%
  \if@display%
    \ifinner%
      \@xp\@xp\@xp\split@aligned%
    \else%
      \ifst@rred \else \global\@eqnswtrue \fi%
    \fi%
  \fi%
  \collect@body\gather@split%
}{%
  \crcr%
  \egroup%
  \egroup%
  \iftagsleft@ \@xp\lendsplit@ \else \@xp\rendsplit@ \fi%
}

\endinput
