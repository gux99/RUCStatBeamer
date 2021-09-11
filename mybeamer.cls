%--------------------------------------
\ProvidesClass{mybeamer}[Beamer designed by Gu]
\NeedsTeXFormat{LaTeX2e}
%--------------------------------------

%--------------------------------------
\newif\ifChinese
\newif\ifEnglish
% \def\@Sy{false}
%--------------------------------------

%--------------------------------------
% \DeclareOption{zh}{\Chinesetrue\Englishfalse}
% \DeclareOption{en}{\Chinesefalse\Englishtrue}
\DeclareOption{noSy}{\def\@Sy{false}}
\DeclareOption*{
    \PassOptionsToClass{\CurrentOption}{ctexbeamer}
}
\ProcessOptions\relax
\LoadClass{ctexbeamer}
%--------------------------------------

%--------------------------------------


\mode<presentation> {
    \usetheme{Boadilla}
    % \usetheme{CambridgeUS}
}

\RequirePackage{graphicx} 
\RequirePackage{booktabs} 
\RequirePackage{bookmark}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathrsfs}
\RequirePackage{ctex}
\RequirePackage{caption}
\RequirePackage{color}
\RequirePackage{bm}
\RequirePackage{float}
\RequirePackage{tikz}
\RequirePackage{wallpaper}
\RequirePackage{fontspec}
\RequirePackage{subfigure}
\RequirePackage{colortbl}
\RequirePackage{arydshln}
\RequirePackage{lmodern}    % 使用Latin Modern字体族

% -------------------------------------------------------------------------------------------------
\definecolor{ltblue}{RGB}{33,130,191}
\definecolor{dpblue}{RGB}{3,103,166}

% -------------------------------------------------------------------------------------------------
% 设置字体（未完善）

\ifdef{\@Sy}{
    \newcommand{\song}{\rmfamily\songti}
    \newcommand{\hei}{\sffamily\heiti}
}
{
    \setCJKmainfont[
    BoldFont = 思源宋体 SemiBold,
    ItalicFont = KaiTi]
    {思源宋体 Medium}

    \setsansfont[BoldFont = 思源黑体 Medium]{思源黑体 Normal}

    \setCJKsansfont[
    BoldFont = 思源黑体 Medium,
    ItalicFont = KaiTi
    ]
    {思源黑体 Normal}

    % 思源宋体
    \newfontfamily\sysong{思源宋体}
    \setCJKfamilyfont{sysong}{思源宋体}
    \newcommand{\song}{\sysong\CJKfamily{sysong}}

    % 思源黑体
    \newfontfamily\syhei{思源黑体}
    \setCJKfamilyfont{syhei}{思源黑体}
    \newcommand{\hei}{\syhei\CJKfamily{syhei}}
}


\setbeamerfont{title}{family=\song,size=\LARGE,series=\bfseries}
\setbeamerfont{frametitle}{family=\song,size=\LARGE,series=\bfseries}
\setbeamerfont{framesubtitle}{family=\song,size=\large,series=\bfseries}
\setbeamerfont{block title}{family=\song}
\setbeamerfont{block body}{family=\hei}

% 公式使用非衬线字体
\usefonttheme[onlymath]{serif}
% -------------------------------------------------------------------------------------------------

% -------------------------------------------------------------------------------------------------
\setbeamersize{text margin left=0.8cm}
\setbeamersize{text margin right=0.8cm}

% 调整内部一些元素的格式
\setbeamertemplate{caption}[numbered]
\setbeamertemplate{bibliography item}[text]
\setbeamertemplate{enumerate items}[default]
\setbeamertemplate{itemize item}[square]
\setbeamertemplate{blocks}[default]

\setbeamertemplate{section in toc}[sections numbered]

% 调整frametitle部分的格式
\setbeamertemplate{frametitle}{
    \leavevmode%
    \begin{beamercolorbox}[sep=0.3cm,left,wd=\paperwidth]{frametitle}
        \usebeamerfont{frametitle}%
        \vbox{}\vskip-1ex%
        \strut\insertframetitle\par%
        {%
          \ifx\insertframesubtitle\@empty%
          \else%
          {\usebeamerfont{framesubtitle}\usebeamercolor[fg]{framesubtitle}\strut$\blacksquare$\insertframesubtitle\par}%
          \fi
        }%
        \vskip-1ex%
        \if@tempswa\else\vskip-.3cm\fi% set inside beamercolorbox... evil here...
      \end{beamercolorbox}%
}
% --------------------------------------------------------------------------------------------------

% --------------------------------------------------------------------------------------------------
\setbeamercolor{structure}{fg = dpblue}

\setbeamercolor{block body}{bg=white}
\setbeamercolor{block title}{bg=white}
% --------------------------------------------------------------------------------------------------


% 增加一个目录页
\newcommand{\setToc}[1]{
    \begin{frame}
		\frametitle{#1}
		\tableofcontents
	\end{frame}
}

% 在每个section前增加导航页Highlight当前section
\newcommand{\addSectionPage}[1]{
    \AtBeginSection[]
    {
        \begin{frame}
            \frametitle{#1}
            \tableofcontents[currentsection]
        \end{frame}
    }
}

% 在每个Part前加入转场页
\newcommand{\addPartPage}{
    \AtBeginPart
    {
        \begin{frame}
            \centering
            \usebeamercolor[fg]{structure}\song{\bfseries\Huge{Part\ \Roman{part}.\ \insertpart}}
        \end{frame}
    }
}


%---------------------------------------------------------------------------------------------------