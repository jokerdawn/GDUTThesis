%% Old File `scnuthesis.cls` belongs to Joseph Pan <cs.wzpan@gmail.com>
%%
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3a
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3a or later is part of all distributions of LaTeX
%% version 2004/10/01 or later.
%% 
%% To produce the documentation run the original source files ending with `.dtx'
%% through LaTeX.
%% 
%% Any Suggestions : Contact me <jdse88@gmail.com>
%% Thanks Joseph Pan!
%% Thanks the thuthesis class!
%% Thanks the original NUDT paper class!
%% 
%------------------------------------------------------------------------
%声明
%------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gdutthesis}

\newif\ifistwoside\istwosidefalse
\DeclareOption{twoside}{\istwosidetrue}

\newif\ifisttf\isttftrue
\DeclareOption{ttf}{\isttftrue}
\DeclareOption{otf}{\isttffalse}

\newif\ifistranslation\istranslationtrue
\DeclareOption{en}{\istranslationtrue}
\DeclareOption{cn}{\istranslationfalse}

\DeclareOption*{\PackageWarning{gdutthesis}{Unknown Option '\CurrentOption'}}
\ProcessOptions\relax

\RequirePackage{ifthen,calc}

\ifistwoside
	\LoadClass[a4paper,12pt,openright,twoside]{book}
\else
	\LoadClass[a4paper,12pt,openany,oneside]{book}
\fi

%------------------------------------------------------------------------
%宏包
%------------------------------------------------------------------------  
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
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem} %宏包兼容
\RequirePackage[CJKnumber,no-math,BoldFont,SlantFont]{xeCJK}
\RequirePackage{indentfirst}
\RequirePackage[numbers,sort&compress,square]{natbib}
\RequirePackage[CJKbookmarks=true,pdfborder=0 0 1]{hyperref}

%------------------------------------------------------------------------
%其他
%------------------------------------------------------------------------

\renewcommand{\tabularxcolumn}[1]{m{#1}} %表格左右居中对齐

\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}} 

%------------------------------------------------------------------------
%字体与字号
%------------------------------------------------------------------------
\defaultfontfeatures{Mapping=tex-text} %Using the tex-text mapping is also equivalent to writing Ligatures=TeX. 
%The use of the latter syntax is recommended for better compatibility with LuaTEX documents.
%http://mirror.math.ku.edu/tex-archive/macros/latex/contrib/fontspec/fontspec.pdf
%You can also define a command for em-dash specially.

\xeCJKsetcharclass{"0}{"2E7F}{0}
\xeCJKsetcharclass{"2E80}{"FFFF}{1} %Address of Unicode

\newcommand\installTTF{%
	\setmainfont{Times New Roman}
	\setsansfont{Arial}
	\setmonofont{Courier New}
	\setCJKmainfont{SimSun}
	\setCJKsansfont{SimHei}
	\setCJKfamilyfont{song}{SimSun}
	\setCJKfamilyfont{hei}{SimHei}
}

\newcommand\installOTF{%
	\setmainfont{Times New Roman} % could be changed to "Times New Roman PS Std"
	\setsansfont{Arial}
	\setmonofont{Courier New} 
	\setCJKmainfont{Adobe Song Std}
	\setCJKsansfont{Adobe Heiti Std}
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

\newcommand{\chuhao}{\fontsize{42bp}{\baselineskip}\selectfont}
\newcommand{\xiaochu}{\fontsize{36bp}{\baselineskip}\selectfont}
\newcommand{\yihao}{\fontsize{26bp}{\baselineskip}\selectfont}
\newcommand{\xiaoyi}{\fontsize{24bp}{\baselineskip}\selectfont}
\newcommand{\erhao}{\fontsize{22bp}{\baselineskip}\selectfont}
\newcommand{\xiaoer}{\fontsize{18bp}{\baselineskip}\selectfont}
\newcommand{\sanhao}{\fontsize{16bp}{\baselineskip}\selectfont}
\newcommand{\xiaosan}{\fontsize{15bp}{\baselineskip}\selectfont}
\newcommand{\sihao}{\fontsize{14bp}{\baselineskip}\selectfont}
\newcommand{\xiaosi}{\fontsize{12bp}{\baselineskip}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5bp}{\baselineskip}\selectfont}
\newcommand{\xiaowu}{\fontsize{9bp}{\baselineskip}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5bp}{\baselineskip}\selectfont}
\newcommand{\xiaoliu}{\fontsize{6.5bp}{\baselineskip}\selectfont}
\newcommand{\qihao}{\fontsize{5.5bp}{\baselineskip}\selectfont}
\newcommand{\bahao}{\fontsize{5.0bp}{\baselineskip}\selectfont}

\renewcommand{\baselinestretch}{1.25}  % 1.5行距，计算公式 “行距/1.2=倍数”

%------------------------------------------------------------------------
%中文元素
%------------------------------------------------------------------------
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

%------------------------------------------------------------------------
%页边距与页面样式
%------------------------------------------------------------------------
\geometry{top=28mm,bottom=15mm,left=30mm,right=20mm,nohead}
\geometry{footskip=10mm}
 
\newcommand\dlmu[2][6.5cm]{\hskip1pt\underline{\hb@xt@#1{\hss#2\hss}}\hskip3pt} %设置下划线

\ifistwoside
	\fancypagestyle{plain}{\renewcommand{\headrulewidth}{0pt}\fancyhf{}}
	\fancypagestyle{mainpage}{\fancyhf{}\fancyfoot[EL,OR]{\xiaowu \thepage}}
	\fancypagestyle{backpage}{\fancyhf{}\fancyfoot[EL,OR]{\xiaowu \thepage}}
	\fancypagestyle{emptypage}{\fancyhf{}\fancyfoot[EL,OR]{\xiaowu \thepage}}
\else
	\fancypagestyle{plain}{\renewcommand{\headrulewidth}{0pt}\fancyhf{}}
	\fancypagestyle{mainpage}{\fancyhf{}\fancyfoot[ER,OR]{\xiaowu \thepage}}
	\fancypagestyle{backpage}{\fancyhf{}\fancyfoot[ER,OR]{\xiaowu \thepage}}
	\fancypagestyle{emptypage}{\fancyhf{}\fancyfoot[ER,OR]{\xiaowu \thepage}}
\fi

\renewcommand\frontmatter{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\@mainmatterfalse
	\fancyhf{}
	\pagestyle{plain}
}

\renewcommand\mainmatter{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\@mainmattertrue
	\pagenumbering{arabic}
	\normalsize 
	\def\@tabular{\wuhao\old@tabular}
	\pagestyle{mainpage}
}

\renewcommand\backmatter{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\pagestyle{backpage}
}
	
\newenvironment{ack}{%
	\thispagestyle{emptypage}
	\chapter*{\ackname}%
	\addcontentsline{toc}{chapter}{致谢}%
	\xiaosi%
	\@afterheading
}

%------------------------------------------------------------------------
%附录
%------------------------------------------------------------------------
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

\newcommand{\appxtle}[1]{\appx{#1}\par\addcontentsline{toc}{chapter}{附录\theappx}}

\newenvironment{appxchp}{\clearpage\@afterheading}{}

%------------------------------------------------------------------------
%单面打印设置
%------------------------------------------------------------------------
\renewcommand\cleardoublepage{\clearpage\if@openright\ifodd\c@page
	\else
	\newpage{}
	\thispagestyle{empty}
	\vspace*{\fill}
	\begin{center}
	\end{center}
	\vspace*{\fill}
	\clearpage\fi\fi%
}

%------------------------------------------------------------------------
%摘要
%------------------------------------------------------------------------
\newcommand\cabstractname{摘\hspace{2em}要}
\newcommand\ckeywordsname{{\heiti \sihao \textbf{关键词}}}
\newcommand\ckeywords[1]{\xiaosi \songti \ckeywordsname: #1}

\newcommand\eabstractname{Abstract}
\newcommand\ekeywordsname{\sihao \textbf{KEY WORDS}}
\newcommand\ekeywords[1]{{\xiaosi \ekeywordsname: #1}}

\newenvironment{cabstract}{%
	\titleformat*{\chapter}{\xiaosan \heiti \filcenter \bfseries}
	\chapter*{\cabstractname}
	\xiaosi
	\@afterheading}
{\par\vspace{1em}\par}

\newenvironment{eabstract}{%
	\titleformat*{\chapter}{\sihao \filcenter \bfseries}
	\chapter*{\eabstractname}
	\xiaosi
	\@afterheading}
{\par\vspace{1em}\par}

\titlecontents{chapter}[0pt]{\vspace{6bp} \heiti \xiaosi}
	{\thecontentslabel\quad}{}
	{\titlerule*{.}\contentspage}
\titlecontents{section}[1.5em]{\songti \xiaosi}
	{\thecontentslabel\quad}{}
	{\titlerule*{.}\contentspage}
\titlecontents{subsection}[3em]{\songti \xiaosi}
	{\thecontentslabel\quad}{}
	{\titlerule*{.}\contentspage}

%------------------------------------------------------------------------
%标题与目录设置
%------------------------------------------------------------------------
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
						\global\@topnum\z@
						\@afterindentfalse
						\secdef\gdut@chapter\@schapter}

\def\gdut@chapter[#1]#2{
	\ifnum \c@secnumdepth >\m@ne
		\if@openright\cleardoublepage\else\clearpage\fi
		\phantomsection %指引到标签\label所在的位置
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
	\@makechapterhead{#2}%
}

\newcommand{\sectionbreak}{\addpenalty{-300}\vspace*{0pt}}

\setlength{\topskip}{0pt}
\setcounter{secnumdepth}{3} % 数字到subsection
\titleformat{\chapter}{\filcenter \sanhao \heiti \bfseries }{\thechapter}{1.2em}{}
\titleformat{\section}{\heiti \bfseries\xiaosi}{\thesection}{0.2em}{}
\titleformat{\subsection}{\heiti \xiaosi}{\thesubsection}{1em}{}

\titlespacing{\chapter}{0pt}{0pt}{1em}
\titlespacing{\section}{0pt}{0.5em}{0.5em}
\titlespacing{\subsection}{0pt}{0.5em}{0.5em}

\renewcommand\normalsize{\@setfontsize\normalsize{12bp}{\baselineskip}%
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

%------------------------------------------------------------------------
%表格
%------------------------------------------------------------------------
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

\let\old@tabular\@tabular %

\DeclareCaptionLabelFormat{tabularlabel}{{{\wuhao} \heiti #1~\rmfamily #2}}
\DeclareCaptionLabelFormat{figurelabel}{{{\wuhao} \song #1~\rmfamily #2}}
\DeclareCaptionLabelSeparator{floatsong}{\hspace{1em}}
\DeclareCaptionFont{tabularcap}{{\wuhao}\bfseries \heiti}
\DeclareCaptionFont{figurecap}{{\wuhao}\song}
\captionsetup[table]{position=top,belowskip=-0.2em,aboveskip=0.1em,labelformat=tabularlabel,labelsep=floatsong,font=tabularcap}
\captionsetup[figure]{position=bottom,belowskip=0.1em,aboveskip=-0.2em,labelformat=figurelabel,labelsep=floatsong,font=figurecap}
\captionsetup[subfloat]{justification=centering}
\renewcommand{\thesubfigure}{\alph{subfigure}}
\renewcommand{\thesubtable}{\alph{subtable}}

\newcommand{\Ucaption}[2]{\caption{#1}\raisebox{10.5pt}[0pt]{\hspace*{0.6\linewidth} \heiti \bfseries #2}} %10.5pt当前五号字体大小

%------------------------------------------------------------------------
%全局脚注
%------------------------------------------------------------------------

%\ifthenelse{\value{footnote}>1}{\renewcommand{\thefootnote}{注：\arabic{footnote}.}}{\renewcommand{\thefootnote}{\hspace{2em}\arabic{footnote}.}}

%\def\blfootnote{\xdef\@thefnmark{}\@footnotetext}

%------------------------------------------------------------------------
%定理环境
%http://mirror.bjtu.edu.cn/CTAN/macros/latex/required/amslatex/amscls/doc/amsthdoc.pdf
%------------------------------------------------------------------------
 
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
\theorembodyfont{\song}
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

%------------------------------------------------------------------------
%封面
%------------------------------------------------------------------------
\def\serialno#1{\def\@serialno{#1}} % 学号
\def\title#1{\def\@title{#1}} % 中文题目
\def\author#1{\def\@author{#1}} % 中文作者名
\def\supervisor#1{\def\@supervisor{#1}} % 导师
\def\college#1{\def\@college{#1}} % 学院
\def\major#1{\def\@major{#1}} %专业
\def\majorfield#1{\def\@majorfield{#1}} %专业方向
\def\grade#1{\def\@grade{#1}} %年级，入学年份
\def\class#1{\def\@class{#1}} %班

\ifistranslation
	\newcommand{\gduttranslation}{1}
\else
	\newcommand{\gduttranslation}{0}
\fi

\newcommand{\iftrans}[2]{\ifthenelse{\gduttranslation=0}{#1}{#2}}

\endinput
%%
%% End of file `gdutthesis.cls'.
