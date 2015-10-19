\LoadClass[a4paper,10pt]{article}
\usepackage[default]{opensans}
\usepackage{graphicx}% For the logo
\usepackage{textcomp}% To get the right (c) symbol

\usepackage{fancyhdr}

% Every page but the first:
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\fancyfoot[C]{%
  \fontsize{7pt}{8pt}% 7
  ThoughtWorks.com%
}

% On the first page:
\fancypagestyle{plain}{%
  \fancyfoot[C]{%
    \fontsize{7pt}{8pt}% 7
    \includegraphics[scale=0.078]{logo.png}\\[1em]%
    \textcopyright{} \the\year{} ThoughtWorks, Ltd. Confidential --- do not distribute%
  }
}
\thispagestyle{plain}


\def\topheading#1{\goodbreak\vspace{50pt}{\fontsize{20pt}{24pt}\bf\MakeUppercase{#1}}\medskip} % 20
\def\midheading#1{\goodbreak\bigskip{\fontsize{16pt}{19pt}\it #1}\medskip}                     % 16
\def\lowheading#1{\goodbreak\bigskip{\fontsize{14pt}{17pt}\bf #1}\smallskip}                   % 14
\def\dates#1{{\it#1}\medskip}


\parindent 0pt
\parskip   5pt
