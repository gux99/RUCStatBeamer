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
% 若报字体相关的错误，请使用下面注释内的代码代替对应的未注释代码

\ifdef{\@Sy}{
    \newcommand{\song}{\rmfamily\songti}
    \newcommand{\hei}{\sffamily\heiti}
}
{
    \setCJKmainfont[
    BoldFont = Source Han Serif SC SemiBold,
    ItalicFont = KaiTi]
    {Source Han Serif SC Medium}

    % \setCJKmainfont[
    % BoldFont = Source Han Serif CN SemiBold,
    % ItalicFont = KaiTi]
    % {Source Han Serif CN Medium}

    \setsansfont[BoldFont = Source Han Sans SC Medium]{Source Han Sans SC Normal}

    % \setsansfont[BoldFont = Source Han Sans CN Medium]{Source Han Sans CN Normal}

    \setCJKsansfont[
    BoldFont = Source Han Sans SC Medium,
    ItalicFont = KaiTi
    ]
    {Source Han Sans SC Normal}

    % \setCJKsansfont[
    % BoldFont = Source Han Sans CN Medium,
    % ItalicFont = KaiTi
    % ]
    % {Source Han Sans CN Normal}

    % 思源宋体
    \newfontfamily\sysong{Source Han Serif SC}
    \setCJKfamilyfont{sysong}{Source Han Serif SC}
    \newcommand{\song}{\sysong\CJKfamily{sysong}}

    % \newfontfamily\sysong{Source Han Serif CN}
    % \setCJKfamilyfont{sysong}{Source Han Serif CN}
    % \newcommand{\song}{\sysong\CJKfamily{sysong}}

    % 思源黑体
    \newfontfamily\syhei{Source Han Sans SC}
    \setCJKfamilyfont{syhei}{Source Han Sans SC}
    \newcommand{\hei}{\syhei\CJKfamily{syhei}}

    % \newfontfamily\syhei{Source Han Sans CN}
    % \setCJKfamilyfont{syhei}{Source Han Sans CN}
    % \newcommand{\hei}{\syhei\CJKfamily{syhei}}
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