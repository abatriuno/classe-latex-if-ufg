%::::::::::::::::::::::::::::::::::::::::::::::::::
%:::       UNIVERSIDADE FEDERAL DE GOIAS        :::       Copyright(C) 2015 Alexandre Barbosa de Almeida
%:::            INSTITUTO DE FISICA             :::
%::::::::::::::::::::::::::::::::::::::::::::::::::   This work may be distributed and/or modified under the
%::: Classe LaTeX para modelos de:              :::   conditions of the LaTeX Project Public License, either
%:::                                            :::   version 1.3 of this license or (at your option) any later
%:::    TCC, MONOGRAFIA, DISSERTACAO e TESE     :::   version. The latest version of this license is in
%:::                                            :::
%::: Autores:                                   :::            http://www.latex-project.org/lppl.txt
%::: (1) Alexandre Barbosa de Almeida           :::
%:::     E-mail: abatriuno@hotmail.com          :::   and version 1.3 or later is part of all distributions of
%::: (2) Salviano de Araujo Leao                :::   LaTeX version 2005/12/01 or later.
%:::     E-mail: salviano@if.ufg.br             :::   This work has the LPPL maintenance status `maintained'.
%:::............................................:::   The Current Maintainer of this work is Alexandre Barbosa.
%::: v1.0                            19/04/2015 :::
%::::::::::::::::::::::::::::::::::::::::::::::::::

%==================================================================================
%                         if-ufg   CRIACAO DA CLASSE
%==================================================================================
\newcommand{\@class@name}{if-ufg}                     % Definicao do nome da classe.
\newcommand{\@class@author}{Alexandre Barbosa}        % Autor da classe.
\newcommand{\@class@release}{19/04/2015}              % Data de lancamento da classe.
\newcommand{\@class@version}{1.0}                     % Versao da classe.

\NeedsTeXFormat{LaTeX2e}[2011/06/27]
\typeout{}\typeout{}
\typeout{\space\space\space\space\space\space\space\space Instituto de Fisica - Universidade Federal de Goias}
\typeout{===================================================================}
\ProvidesClass{\@class@name}
[\@class@release\space v\@class@version. Author: \@class@author.]
\typeout{Classe LaTeX if-ufg: Formatacao de TCC, Monografia, Dissertacao e Tese.}
\typeout{===================================================================}
\typeout{}\typeout{}

%==================================================================================
%                         if-ufg   VARIAVEIS DA CLASSE
%==================================================================================
% Pacote etoolbox fornece operacoes logicas entre numeros, strings, macros, alem de
% estruturas condicionais (if), de repeticao (for), etc.:
%----------------------------------------------------------------------------------
\RequirePackage{etoolbox}

\RequirePackage{ifthen}                % Oferece opcoes de operacoes logicas.

% Declaracao de variaveis logicas (booleanas) usando o pacote etoolbox:
\newbool{>dissertacao}        \global\booltrue{>dissertacao}              % Default
\newbool{>quali-msc}
\newbool{>quali-doc}
\newbool{>tese}
\newbool{>monografia}
\newbool{>tcc}
\newbool{>link}               \global\booltrue{>link}                     % Default
\newbool{>frente}             \global\booltrue{>frente}                   % Default
\newbool{>frenteVerso}
\newbool{>modelo}
\newbool{>abnt-alf}
\newbool{>abnt-num}
\newbool{>paginacao}

%==================================================================================
%                          if-ufg   OPCOES DA CLASSE
%==================================================================================
% Declaracao de opcoes (options) presentes em \documentclass[options]{style}:
%----------------------------------------------------------------------------------
\DeclareOption{tese}{%
    \global\booltrue{>tese}
    \global\boolfalse{>dissertacao}
}
\DeclareOption{dissertacao}{%
    \global\booltrue{>dissertacao}
}
\DeclareOption{monografia}{%
    \global\booltrue{>monografia}
    \global\boolfalse{>dissertacao}
}
\DeclareOption{tcc}{%
    \global\booltrue{>tcc}
    \global\boolfalse{>dissertacao}
}
\DeclareOption{quali-msc}{%
    \global\booltrue{>quali-msc}
    \global\boolfalse{>dissertacao}
}
\DeclareOption{quali-doc}{%
    \global\booltrue{>quali-doc}
    \global\boolfalse{>dissertacao}
}
\DeclareOption{frente}{%
    \global\booltrue{>frente}
    \global\boolfalse{>frenteVerso}
}
\DeclareOption{frenteVerso}{%
    \global\boolfalse{>frente}
    \global\booltrue{>frenteVerso}
}
\DeclareOption{abnt-alf}{%
    \global\booltrue{>abnt-alf}
}
\DeclareOption{abnt-num}{%
    \global\booltrue{>abnt-num}
}
\ProcessOptions\relax              % Finaliza o processamento das opcoes da classe.

%==================================================================================
%                       if-ufg   TIPO DE DOCUMMENT CLASS
%==================================================================================
% A classe if-ufg herda os atributos da classe report:
%----------------------------------------------------------------------------------
\ifbool{>frenteVerso}{%
    \LoadClass[a4paper,twoside,openright,12pt]{report}
}{\LoadClass[a4paper,12pt]{report}}

%==================================================================================
%                  if-ufg   CARREGA ALGUNS PACOTES ESSENCIAIS
%==================================================================================
% Opcoes que serao passadas aos pacotes quando forem carregados:
%----------------------------------------------------------------------------------
\PassOptionsToPackage{ruled,algo2e,algoruled,vlined,portuguese}{algorithm2e}

% Carregando os pacotes:
%----------------------------------------------------------------------------------
\RequirePackage[brazil]{babel}         % Hifenizacao das palavras em portugues do Brasil.
\RequirePackage[utf8]{inputenc}        % Codificacao do texto inserido.
\RequirePackage[T1]{fontenc}           % Codificacao das fontes de texto.
\RequirePackage{import}                % Pacote para gerenciar caminhos relativos.
\RequirePackage{lmodern}               % Fontes de texto do tipo Latin Modern.
\RequirePackage{amsfonts}              % Fontes de texto para equacoes matematicas.
\RequirePackage[titles]{tocloft}       % Formatacao do sumario, lista de figuras e tabelas.
\RequirePackage{titlesec}              % Estilo de titulos de capitulos, secoes, etc.
\RequirePackage{appendix}              % Formatacao dos apendices.
\RequirePackage{calc}                  % Permite operacoes matematicas entre macros.
\RequirePackage{setspace}              % Fornece tipos de espacamentos entre as linhas.
\RequirePackage{indentfirst}           % Identacao automatica das primeiras linhas.
\RequirePackage{geometry}              % Define a geometria (layout) do documento.
\RequirePackage{fancyhdr}              % Customizacao de cabecalhos e rodapes.
\RequirePackage{ifpdf}                 % Verifica se o pdfTeX esta em uso para gerar o PDF.
\RequirePackage{xstring}               % Permite operacoes logicas com strings.
% \RequirePackage[normalem]{ulem}        % Permite o uso de underlines.
\RequirePackage{amsmath}               % Pacotes matematicos da distribuicao AMS-LaTeX.
\RequirePackage{amssymb}               % Pacote de simbolos matematicos da distribuicao AMS-LaTeX.
\RequirePackage[table]{xcolor}         % Customizacao do uso de cores.
\RequirePackage{graphicx}              % Gerencia a inclusao de figuras e graficos em geral.
\RequirePackage{listings}              % Pacote para gerenciar a impressao de codigos de programas
\RequirePackage{tikz}                  % Poderoso ambiente de criacao de desenhos 2D e 3D.
\RequirePackage{float}                 % Interface para objetos floats.
\RequirePackage{caption}               % Formatacao do estilo das legendas.
\RequirePackage{chngcntr}              % Gerencia contadores.
% \RequirePackage{pdflscape}           % Pagina no modo paisagem com suporte a PDF rotate.
\RequirePackage{lscape}                % Pagina no modo paisagem.
\RequirePackage{algorithm2e}           % Ambiente para escrita de algoritmos (pseudo-codigos).
\RequirePackage{lastpage}              % Referencia a numeracao de todas as paginas ate a ultima.
\ifbool{>abnt-alf}{%
    \RequirePackage[hyphens]{url}      % Auxilia na impressao correta de URLs.

}{\ifbool{>abnt-num}{%
        \RequirePackage[hyphens]{url}

    }{}
}

% Pacote hyperref gerencia o modo de referencia cruzada:
%----------------------------------------------------------------------------------
\ifpdf%
    \RequirePackage[pdftex]{hyperref}
    \pdfadjustspacing=1                % Forca a compilacao com pdfLaTeX a ter o mesmo espacamento
\else%                                   entre os caracteres como feito na compilacao com LaTeX.
    \RequirePackage[dvips,breaklinks,pagebackref]{hyperref}
\fi

% Pacote abntex2cite para o estilo de citacoes bibliograficas da ABNT.
% Necessario carregar depois do pacote hyperref:
%----------------------------------------------------------------------------------
\ifbool{>abnt-alf}{%
    \RequirePackage[alf,abnt-emphasize=bf,abnt-etal-list=3,%
                    abnt-repeated-author-omit=yes]{abntex2cite}
    \setboolean{ABNTbackref}{true}                    
}{}
\ifbool{>abnt-num}{%
    \RequirePackage{cite}              % Pacote de citacoes. Neste caso, precisa ser carregado
                                       % antes do pacote abntex2cite.
    \RequirePackage[num,abnt-emphasize=bf,abnt-etal-list=3,%
                    abnt-repeated-author-omit=yes,compress]{abntex2cite}
    \citebrackets[]
    \renewcommand{\@biblabel}[1]{%
        \ifthenelse{\equal{#1}{}}{}{{\hspace*{4pt} [#1] \hspace{\biblabelsep}}}
    }
}

\RequirePackage[brazilian,hyperpageref]{backref}   % Faz referencia reversa em citacoes bibliograficas.

%==================================================================================
%                   if-ufg   DEFINICOES DE COMANDOS DA CLASSE
%==================================================================================
% Redefinicao do comando \cleardoublepage com a inclusao de \thispagestyle{empty},
% necessario para que as paginas em branco nao contenham cabecalhos e rodapes:
%----------------------------------------------------------------------------------
\renewcommand{\cleardoublepage}{%
    \clearpage
    \if@twoside%
        \ifodd\c@page %
        \else%
            \thispagestyle{empty}
            \hbox{}\newpage
            \if@twocolumn%
                \hbox{}\newpage
    \fi \fi \fi
}

% Configuracoes do pacote backref:
%----------------------------------------------------------------------------------
\AtBeginDocument{%
    \renewcommand{\backrefpagesname}{Citado na(s) página(s):~}
    \renewcommand{\backref}{}
    \renewcommand*{\backrefalt}[4]{%
        \ifcase #1 %
            Nenhuma cita\c{c}\~ao no texto.%
        \or
            Citado na p\'agina #2.%
        \else
            Citado #1 vezes nas p\'aginas #2.%
        \fi
    }
}

% Habilita ou desabilita os links ao longo do documento. Uma alternativa para a 
% opcao ``draft'' do pacote hyperref, pois este ultimo desabilita tambem os links
% no bookmarks, o que nao eh desejavel. A primeira solucao encontrada foi fazer
% com que o comando \ref{} se comporte como \ref*{}. No sumario, eh possivel
% configurar os links com a opcao [linktoc=all] com os argumentos all ou none
%\newcommand{\linksmode}[1]{%
%    \IfStrEqCase{#1}{%
%        {on}{\hypersetup{linktoc=all}}
%        {off}{\hypersetup{linktoc=none}
%        \AtBeginDocument{\let\ref=\@refstar}
%        }}
%        [\ClassError{\@classname}{Only ``on'' or ``off'' are valid arguments on }{}]
%}

%\newcommand{\linkscolormode}[1]{%
%    \IfStrEqCase{#1}{%
%        {on}{\hypersetup{colorlinks=true}}
%        {off}{\hypersetup{hidelinks,colorlinks=false}}}
%        [\ClassError{\@classname}{Only ``on'' or ``off'' are valid arguments on }{}]
%}


% Definicao do comando \paginacao{x} para controlar a numeracao das paginas.
% EM FASE DE TESTES, NAO ALTERE!
%----------------------------------------------------------------------------------
\def\paginacao#1{%
    \IfStrEqCase{#1}{%
        {arabic}{\def\page@style{arabic}\def\page@type{empty}}
        {roman}{\def\page@style{roman}\def\page@type{plain}\global\booltrue{>paginacao}}        
        {Roman}{\def\page@style{Roman}\def\page@type{plain}\global\booltrue{>paginacao}}}
    [\ClassError{\@classname}{Only ``arabic'', ``roman'' or ``Roman'' are valid arguments on }{}]  
}
\paginacao{arabic}                                                        % Default

\AtBeginDocument{%
    \IfStrEqCase{\page@style}{%
        {arabic}{\pagenumbering{arabic}}
        {roman}{\pagenumbering{roman}}  
        {Roman}{\pagenumbering{Roman}}}[]
}

% Definicao do comando \colorspace{x} para definir o espaco de cores:
%----------------------------------------------------------------------------------
\def\colorspace#1{%
    \IfStrEqCase{#1}{%
        {rgb}{\selectcolormodel{rgb}\definecolor{black}{rgb}{0,0,0}\AtBeginDocument{\color{black}}}
        {cmyk}{\selectcolormodel{cmyk}\definecolor{black}{cmyk}{0,0,0,1}\AtBeginDocument{\color{black}}}}
    [\ClassError{\@classname}{Only ``rgb'' or ``cmyk'' are valid arguments on }{}]  
}
\colorspace{rgb}                                                          % Default

% Definicao do comando \imprimir{x} para habilitar ou desabilitar
% as cores dos links:
%----------------------------------------------------------------------------------
\def\imprimir#1{%
    \IfStrEqCase{#1}{%
        {off}{\hypersetup{colorlinks=true}}
        {on}{\hypersetup{hidelinks,colorlinks=false}}}
        [\ClassError{\@classname}{Only ``on'' or ``off'' are valid arguments on }{}]
}
\imprimir{off}                                                            % Default

% Imprime a marca d'água MODELO na capa do documento:
%----------------------------------------------------------------------------------
\newcommand{\printmodelo}{%
    \global\booltrue{>modelo}
}

% Criacao de ambiente para paginas em modo paisagem:
%----------------------------------------------------------------------------------
\newenvironment{paisagem}{%
    \newgeometry{bottom=2cm}
    \begin{landscape}
    \noindent
}{\end{landscape}\restoregeometry}

% Definicao do comando \info@pos{x}{x}{x}{x}:
%----------------------------------------------------------------------------------
\newcommand*{\info@pos}[4]{%
    \begin{#1}\begin{minipage}[top]{#2}\linespread{#3}#4\end{minipage}\end{#1}
}

% Emite uma caixa de alerta vermelha indicando ausencia de informacoes obrigatorias:
%----------------------------------------------------------------------------------
\newcommand{\@alerta}[1]{%
   \colorbox{red}{#1}
}

% Definicao do comando \autor{x}{x}{x}:
%----------------------------------------------------------------------------------
\def\autor#1#2#3{%
    \def\autor@nome{#1}
    \def\autor@citacao{#2}
    \IfStrEqCase{#3}{%
        {M}{\def\autor@sexo{M}}
        {F}{\def\autor@sexo{F}}}
        [\ClassError{\@classname}{Only ``M'' or ``F'' are valid arguments on }{}]
}
\autor{}{}{M}
\apptocmd{\autor}{%
    \ifdefstring{\autor@nome}{}{%
        \def\autor@nome{\@alerta{NOME DO AUTOR}}
    }{}
}{}{}
\apptocmd{\autor}{%
    \ifdefstring{\autor@citacao}{}{%
        \def\autor@citacao{\@alerta{CITACAO, N.A.}}
    }{}
}{}{}

% Definicao do comando \universidade{x}{x}:
%----------------------------------------------------------------------------------
\def\universidade#1#2{%
    \def\universidade@nome{#1}
    \def\universidade@sigla{#2}
}
\universidade{Universidade Federal de Goi\'as}{UFG}                       % Default
\apptocmd{\universidade}{%
    \ifdefstring{\universidade@nome}{}{%
        \def\universidade@nome{\@alerta{NOME DA UNIVERSIDADE}}
    }{}
}{}{}

% Definicao do comando \faculdade{x}{x}:
%----------------------------------------------------------------------------------
\def\faculdade#1#2{%
    \def\faculdade@nome{#1}
    \def\faculdade@depto{#2}
}
\faculdade{Instituto de F\'isica}{}                                       % Default
\apptocmd{\faculdade}{%
    \ifdefstring{\faculdade@nome}{}{%
        \def\faculdade@nome{\@alerta{NOME DA FACULDADE}}
    }{}
}{}{}

% Definicao do comando \habilitacao{x}:
%----------------------------------------------------------------------------------
\def\habilitacao#1{%
    \def\@habilitacao{#1}
}
\habilitacao{Bacharelado}                                                 % Default

% Definicao do comando \titulo{x}{x}:
%----------------------------------------------------------------------------------
\def\titulo#1#2{%
    \def\titulo@titulo{#1}
    \def\titulo@subtitulo{#2}
}
\titulo{\@alerta{T\'ITULO DO TRABALHO}}{}                                 % Default
\apptocmd{\titulo}{%
    \ifdefstring{\titulo@titulo}{}{%
        \def\titulo@titulo{\@alerta{T\'ITULO DO TRABALHO}}
    }{}
}{}{}

% Definicao do comando \posgrad{x}:
%----------------------------------------------------------------------------------
\def\posgrad#1{\def\@posgrad{#1}}
\posgrad{F\'isica}                                                        % Default
\apptocmd{\posgrad}{%
    \ifdefstring{\@posgrad}{}{%
        \def\@posgrad{\@alerta{NOME DA P\'OS}}
    }{}
}{}{}

% Definicao do comando \pesquisa{x}:
%----------------------------------------------------------------------------------
\def\pesquisa#1{\def\@pesquisa{#1}}
\pesquisa{\@alerta{\'AREA DE PESQUISA}}                                   % Default
\apptocmd{\pesquisa}{%
    \ifdefstring{\@pesquisa}{}{%
        \def\@pesquisa{\@alerta{\'AREA DE PESQUISA}}
    }{}
}{}{}

% Definicao do comando \data{x}{x}{x}:
%----------------------------------------------------------------------------------
\def\data#1#2#3{%
    \def\data@dia{#1}
    \def\data@mes@set{#2}
    \def\data@ano{#3}
}
\data{\@alerta{DIA}}{13}{\@alerta{ANO}}                                   % Default

% Identifica o mes de acordo com o seu numero:
%----------------------------------------------------------------------------------
\def\data@mes{%
    \ifcase\data@mes@set
        \or janeiro
        \or fevereiro
        \or mar\c{c}o
        \or abril
        \or maio
        \or junho
        \or julho
        \or agosto
        \or setembro
        \or outubro
        \or novembro
        \or dezembro
        \or \@alerta{MES} 
    \fi
}

\apptocmd{\data}{%
    \ifdefstring{\data@dia}{}{%
        \def\data@dia{\@alerta{DIA}}
    }{}
}{}{}
\apptocmd{\data}{%
    \ifdefstring{\data@mes@set}{}{%
        \def\data@mes{\@alerta{MES}}
    }{}
}{}{}
\apptocmd{\data}{%
    \ifdefstring{\data@ano}{}{%
        \def\data@ano{\@alerta{ANO}}
    }{}
}{}{}

% Definicao do comando \cidade{x}:
%----------------------------------------------------------------------------------
\def\cidade#1{\def\@cidade{#1}}
\cidade{Goi\^ania}                                                        % Default

% Definicao do comando \orientador{x}{x}{x}:
%----------------------------------------------------------------------------------
\def\orientador#1#2#3{%
    \def\orientador@nome{#1}
    \def\orientador@citacao{#2}
    \IfStrEqCase{#3}{%
        {M}{\def\orientador@sexo{M}}
        {F}{\def\orientador@sexo{F}}}
        [\ClassError{\@classname}{Only ``M'' or ``F'' are valid arguments on }{}]
}
\orientador{}{}{M}                                                        % Default
\apptocmd{\orientador}{%
    \ifdefstring{\orientador@nome}{}{%
        \def\orientador@nome{\@alerta{NOME DO ORIENTADOR}}
    }{}
}{}{}
\apptocmd{\orientador}{%
    \ifdefstring{\orientador@citacao}{}{%
        \def\orientador@citacao{\@alerta{CITACAO, N.O.}}
    }{}
}{}{}

% Definicao do comando \orientadorfacul{x}{x}:
%----------------------------------------------------------------------------------
\def\orientadorfacul#1#2{%
    \def\orientador@facul{#1}
    \def\orientador@depto{#2}
}
\orientadorfacul{}{}                                                      % Default
\apptocmd{\orientadorfacul}{%
    \ifdefstring{\orientador@facul}{}{%
        \def\orientador@facul{\@alerta{FACULDADE DO ORIENTADOR}}
    }{}
}{}{}

% Definicao do comando \coorientador{x}{x}{x}:
%----------------------------------------------------------------------------------
\def\coorientador#1#2#3{%
    \def\coorientador@nome{#1}
    \def\coorientador@citacao{#2}
    \IfStrEqCase{#3}{%
        {M}{\def\coorientador@sexo{M}}
        {F}{\def\coorientador@sexo{F}}}
        [\ClassError{\@classname}{Only ``M'' or ``F'' are valid arguments on }{}]
}
\coorientador{}{}{M}                                                      % Default

% Definicao do comando \coorientadorfacul{x}{x}:
%----------------------------------------------------------------------------------
\def\coorientadorfacul#1#2{%
    \def\coorientador@facul{#1}
    \def\coorientador@depto{#2}
}
\coorientadorfacul{}{}                                                    % Default

% Definicao do ambiente \begin{citacao}...\end{citacao} (ABNT NBR 10520/2002 - 5.3):
%----------------------------------------------------------------------------------
\newenvironment{citacao}%
{\begin{spacing}{1.}%
\small
\begin{list}{}{%
    \setlength{\listparindent}{0cm}%
    \setlength{\itemindent}{\listparindent}%
    \setlength{\rightmargin}{0cm}%
    \setlength{\leftmargin}{4cm}%
    \setlength{\parsep}{0pt}}%
\item\relax}%
{\end{list}\end{spacing}}

%==================================================================================
%                        if-ufg   CONFIGURACAO DO PDF
%==================================================================================
% Configuracoes do arquivo .pdf gerado:
%----------------------------------------------------------------------------------
\hypersetup{%
    plainpages=false,  
    bookmarksopen=false,         % Mostra o bookmarks para navegar pelo documento.
    bookmarksnumbered=true,      % Inclui a numeracao dos capitulos, secoes, etc. no bookmarks.
    pdfstartview=FitH,           % Configura o formato de visualizacao das paginas. 
    hypertexnames=false,         % Tenta adivinhar nomes para os links.
    naturalnames=true,           % Utiliza os nomes computador pelo LaTeX para os links.
}

\ifbool{>link}{%
    \hypersetup{
        linkcolor=blue,          % Seleciona a cor dos links.
        citecolor=blue,          % Seleciona a cor das citacoes.
        urlcolor=blue,           % Seleciona a cor dos links das URLs.
        filecolor=blue,          % Seleciona a cor dos links para os arquivos locais.
    }
}{}

% Pre-textuais nao sao enumerados (ABNT: NBR 14724/2011 - 5.3):
%----------------------------------------------------------------------------------
\AtBeginDocument{%
    \pagenumbering{gobble}                % Retira a numeracao das paginas no bookmark.
    \hypersetup{pageanchor=false}         % Desabilita o anchor das paginas para evitar
    \apptocmd{\sumario}{%                 % problemas com o pacote backref.
        \hypersetup{pageanchor=true}      % Habilita o anchor logo apos o sumario.
        \pagenumbering{arabic}            % Reseta a contagem das paginas para 1 para o 
    }{}{}                                 % primeiro capitulo apos o sumario.
}

%==================================================================================
%                               if-ufg   CAPA
%==================================================================================
% ABNT: NBR 14724/2011
%----------------------------------------------------------------------------------
\newcommand{\capa}[1]{%
    \thispagestyle{empty}                   % Retira o cabecalho e rodape desta pagina.

% Adiciona uma entrada ao bookmarks do PDF gerado:
%----------------------------------------------------------------------------------    
    \ifpdf
        \pdfbookmark[0]{Capa}{pretexto1}
    \fi
  
    \hypersetup{%
        pdftitle={\titulo@titulo},          % Configura o campo Title nos metadados do pdf.
        pdfcreator={\autor@nome},           % Configura o campo Creator nos metadados do pdf.
        pdfauthor={\autor@nome},            % Configura o campo Author nos metadados do pdf.
        pdfsubject={\@pesquisa}             % Configura o campo Subject nos metadados do pdf.
    }
    \singlespacing                          % Configura o espacamento entre as linhas.

% Desenha a marca d'agua MODELO:
%----------------------------------------------------------------------------------    
    \ifbool{>modelo}{%
        \begin{tikzpicture}[remember picture,overlay]
        \node [rotate=60,scale=10,text opacity=0.2]
    at (current page.center) {{\fontsize{1cm}{15}\selectfont Modelo}};
        \end{tikzpicture}
    }{}

% Verifica se imprime o logo colorido ou em preto e branco:
%----------------------------------------------------------------------------------    
    \ifstrequal{#1}{logotipo}{%
        \definecolor{logocolor}{RGB}{255,0,0}
        \vspace*{-50pt}
        \logo@if
    }{\ifstrequal{#1}{logotipo=black}{%
        \definecolor{logocolor}{RGB}{0,0,0}
        \vspace*{-50pt}
        \logo@if
    }{\ifstrequal{#1}{}{%
        \info@pos{center}{\textwidth}{1}{\centering\Large \scshape \universidade@nome \normalsize \upshape}
        \vspace*{-0.6cm}
        \info@pos{center}{\textwidth}{1}{\centering\Large \scshape \faculdade@nome \normalsize \upshape}
    }{\ClassError{\@classname}{logotipo, logotipo=black or an empty argument}}
    }}

% Insere as demais informacoes da capa:
%----------------------------------------------------------------------------------    
    \ifdefstring{\faculdade@depto}{}{}{
        \vspace*{0pt}
        \info@pos{center}{\textwidth}{1}{\centering\large \scshape \faculdade@depto\relax \normalsize \upshape}}
    \vspace*{\stretch{3}}
    \info@pos{center}{\textwidth}{1}{\centering\large \scshape \autor@nome \normalsize \upshape}
    \vspace*{\stretch{8}}
    \info@pos{center}{\textwidth}{1.8}{\centering\huge \textbf{\titulo@titulo} \normalsize}
    \vspace*{\stretch{0.1}}
    \ifdefstring{\titulo@subtitulo}{}{}{%
        \info@pos{center}{\textwidth}{1.3}{\centering\Large \titulo@subtitulo\relax \normalsize}}
    \vspace*{\stretch{9}}
    \info@pos{center}{\textwidth}{1}{\centering\@cidade \\ \data@ano}
    \onehalfspacing              % Muda novamente o espacamento entre as linhas.
    \normalfont                  % Recupera a fonte normal do texto.
    \cleardoublepage             % Se necessario, salta uma pagina em branco para comecar
                                 % um novo conteúdo em uma pagina impar.
}

%==================================================================================
%               if-ufg   AUTORIZACAO PARA PUBLICACAO NA INTERNET
%==================================================================================
\newcommand{\publicacao}{%
    \thispagestyle{\page@type}
    \ifpdf
        \pdfbookmark[0]{Publica\c{c}\~ao}{pretexto2}
    \fi

% Calcula automaticamente o tamanho do traco horizontal de acordo com a largura dos nomes,
% selecionando a largura maior dentre os nomes do Autor, Orientador e Coorientador:
%----------------------------------------------------------------------------------    
    \newlength{\autor@size}
    \newlength{\orientador@size}
    \newlength{\coorientador@size}
    \newlength{\publicacao@size}
    \setlength{\autor@size}{\widthof{\autor@nome -- Autor}}
    \ifdefstring{\orientador@sexo}{M}{%
        \setlength{\orientador@size}{\widthof{\orientador@nome\ -- Orientador}}
    }{\setlength{\orientador@size}{\widthof{\orientador@nome\ -- Orientadora}}}

    \ifdefstring{\coorientador@sexo}{M}{%
        \setlength{\coorientador@size}{\widthof{\coorientador@nome\ -- Coorientador}}
    }{\setlength{\coorientador@size}{\widthof{\coorientador@nome\ -- Coorientadora}}}
    \setlength{\publicacao@size}{\maxof{\autor@size}{\orientador@size}}
    \setlength{\publicacao@size}{\maxof{\publicacao@size}{\coorientador@size}}

% Insere as demais informacoes desta pagina:
%----------------------------------------------------------------------------------    
    \singlespacing
    \info@pos{center}{\textwidth}{1}{\centering\Large \scshape \universidade@nome \normalsize \upshape}
    \vspace{-0.4cm} 
    \info@pos{center}{\textwidth}{1}{\centering\Large \scshape \faculdade@nome \normalsize \upshape}
    \ifdefstring{\faculdade@depto}{}{%
        \info@pos{center}{\textwidth}{1}{\centering\Large \scshape \faculdade@depto\relax \normalsize \upshape}
    }{}
    \singlespacing
    \vspace*{30pt}
    \info@pos{center}{\textwidth}{1.2}{\centering\Large \bfseries  Autoriza\c{c}\~ao para Publica\c{c}\~ao de\ %
    \ifbool{>tese}{Tese}{%
        \ifbool{>dissertacao}{Disserta\c{c}\~ao}{%
            \ifbool{>monografia}{Monografia}{%
                \ifbool{>tcc}{Trabalho de Conclus\~ao de Curso}{%
                    \ifbool{>quali-msc}{Trabalho de Qualifica\c{c}\~ao de Mestrado}{%
                        \ifbool{>quali-doc}{Trabalho de \\ Qualifica\c{c}\~ao de Doutorado}{}%
    }}}}} em \ifbool{>tese}{\\}{}Formato Eletr\^onico}
    \vspace*{30pt}
    \par
    Na qualidade de titular dos direitos de autor, \textbf{AUTORIZO} o
    \faculdade@nome\ da \universidade@nome\ (\universidade@sigla) a reproduzir, inclusive em outro formato
    ou m\'{i}dia e atrav\'es de armazenamento permanente ou tempor\'ario, bem como a publicar
    na rede mundial de computadores (\textit{Internet}) e na biblioteca virtual da \universidade@sigla,
    entendendo-se os termos ``reproduzir'' e ``publicar'' conforme defini\c c\~oes dos
    incisos VI e I, respectivamente, do artigo 5\textordmasculine\ da Lei
    n\textordmasculine\ 9610/98 de 10/02/1998, a obra abaixo especificada, sem
    que me seja devido pagamento a t\'{i}tulo de direitos autorais, desde que a reprodu\c c\~ao
    e/ou publica\c c\~ao tenham a finalidade exclusiva de uso por quem a consulta, e a
    t\'{i}tulo de divulga\c c\~ao da produ\c c\~ao acad\^emica gerada pela Universidade, a partir
    desta data.
    \vspace*{15pt}
    \par
    \noindent\textbf{T\'{i}tulo:} \titulo@titulo\
    \ifdefstring{\titulo@subtitulo}{}{}{-- \titulo@subtitulo}
    \vspace*{15pt}
    \par
    \ifdefstring{\autor@sexo}{M}{%
        \noindent\textbf{Autor:} \autor@nome
    }{\noindent\textbf{Autora:} \autor@nome}
    \vspace*{40pt}
    \par
    \@cidade, \data@dia\ de \data@mes de \data@ano.
    \vspace*{60pt}
    \par
    \ifdefstring{\autor@sexo}{M}{%
        \begin{flushright}
            \rule{\publicacao@size}{0.5pt}\\ \small \autor@nome\ -- Autor
        \end{flushright}
    }{%
        \begin{flushright}    
            \rule{\publicacao@size}{0.5pt}\\ \small \autor@nome\ -- Autora
        \end{flushright}
    }
    \vspace*{30pt}
    \par
    \ifdefstring{\orientador@sexo}{M}{%
        \begin{flushright}
            \rule{\publicacao@size}{0.5pt}\\ \small \orientador@nome\ -- Orientador
        \end{flushright}
    }{%
        \begin{flushright}
            \rule{\publicacao@size}{0.5pt}\\ \small \orientador@nome\ -- Orientadora
        \end{flushright}
    }
    \vspace*{30pt}
    \par
    \ifdefstring{\coorientador@nome}{}{%
    }{%
        \ifdefstring{\coorientador@sexo}{M}{%
            \begin{flushright}
                \rule{\publicacao@size}{0.5pt}\\ \small \coorientador@nome\ -- Coorientador
            \end{flushright}
        }{%
            \begin{flushright}
                \rule{\publicacao@size}{0.5pt}\\ \small \coorientador@nome\ -- Coorientadora
            \end{flushright}
        }
    }
    \onehalfspacing
    \normalfont
    \cleardoublepage
}

%==================================================================================
%                          if-ufg   FOLHA DE ROSTO
%==================================================================================
% ABNT: NBR 14724/2011
%----------------------------------------------------------------------------------
\newcommand{\folhaderosto}{%
    \thispagestyle{\page@type}
    \ifpdf
        \pdfbookmark[0]{Folha de Rosto}{pretexto3}
    \fi
    \singlespacing%
    \info@pos{center}{\textwidth}{1}{\centering\Large \scshape \autor@nome \normalsize \upshape}%
    \vspace*{\stretch{6}}%
    \info@pos{center}{\textwidth}{1.7}{\centering\huge \textbf{\titulo@titulo\relax} \normalsize}%
    \vspace*{\stretch{0.1}}%
    \ifdefstring{\titulo@subtitulo}{}{}{
        \info@pos{center}{\textwidth}{1.2}{\centering\Large \titulo@subtitulo \normalsize \relax}
    }
    \vspace*{\stretch{4}}%
    \par
    \info@pos{flushright}{9.2cm}{1}{%
        \ifbool{>tese}{%
            Tese apresentada ao Programa de P\'os--Gradua\c c\~ao %
            do \faculdade@nome\ da \universidade@nome, como requisito %
            para obten\c c\~ao do grau de Doutor em \@posgrad.
        }{\ifbool{>dissertacao}{%
            Disserta\c{c}\~{a}o apresentada ao Programa de Pós--Gradua\c c\~ao %
            do \faculdade@nome\ da \universidade@nome, como requisito parcial para %
            obten\c c\~ao do t\'itulo de Mestre em \@posgrad.
        }{\ifbool{>monografia}{%
            Monografia apresentada ao Programa de P\'os - Gradua\c c\~ao %
            do \faculdade@nome\ da \universidade@nome, como requisito para\ %
            obten\c c\~ao do grau de \@habilitacao\ em \@posgrad.
        }{\ifbool{>tcc}{%
            Trabalho de Conclus\~ao de Curso apresentado \`a Coordena\c c\~ao do Curso de \@posgrad\ do\ %
            \faculdade@nome\ da\ \universidade@nome, como requisito para obten\c c\~ao do\ %
            Certificado de Especializa\c{c}\~ao em \@posgrad.
        }{\ifbool{>quali-msc}{%
            Trabalho de Qualifica\c{c}\~{a}o de Mestrado apresentado ao Programa de Pós--Gradua\c c\~ao %
            do \faculdade@nome\ da \universidade@nome, como requisito parcial para %
            obten\c c\~ao do t\'itulo de Mestre em \@posgrad.
        }{\ifbool{>quali-doc}{%
            Trabalho de Qualifica\c{c}\~{a}o de Doutorado apresentado ao Programa de Pós--Gradua\c c\~ao %
            do \faculdade@nome\ da \universidade@nome, como requisito parcial para %
            obten\c c\~ao do grau de Doutor em \@posgrad.
        }{}
        }}}}}%
    }%
    \vspace*{\stretch{.8}}%
    \par
    \info@pos{flushright}{9.2cm}{1}{\textbf{\'Area de pesquisa:} \@pesquisa}
    \vspace*{\stretch{-0.8}}%
    \par%    
    \ifdefstring{\orientador@sexo}{M}{%
        \info@pos{flushright}{9.2cm}{1}{\textbf{Orientador:} \orientador@nome}
    }{\info@pos{flushright}{9.2cm}{1}{\textbf{Orientadora:} \orientador@nome}}
    \vspace*{\stretch{-0.85}}
    \ifdefstring{\coorientador@nome}{}{%
    }{%
        \ifdefstring{\coorientador@sexo}{M}{%
            \info@pos{flushright}{9.2cm}{1}{\textbf{Coorientador:} \coorientador@nome}
        }{%
            \info@pos{flushright}{9.2cm}{1}{\textbf{Coorientadora:} \coorientador@nome}
        }
    }
    \par
    \vspace*{\stretch{6}}
    \par
    \info@pos{center}{\textwidth}{1}{\centering\@cidade \\ \data@ano}
    \onehalfspacing
    \normalfont
    \cleardoublepage
}

%==================================================================================
%                 if-ufg   CLASSIFICAÇÃO DECIMAL UNIVERSAL (CDU)
%==================================================================================
% ABNT: NBR 14724/2011
%----------------------------------------------------------------------------------
\newcommand{\cdu}[1]{
    \thispagestyle{\page@type}
    \ifpdf
        \pdfbookmark[0]{CDU}{cdu}
    \fi
    \newlength{\@parindentlength}
    \setlength{\@parindentlength}{\parindent}
    \vspace*{\stretch{1}}
    \hfill
    \parbox{0.9\textwidth}{
    \singlespacing 
    \noindent
    \hrulefill
    \vspace{10pt}
    \par
    \indent
    \autor@nome
    \par
    \hspace{\@parindentlength}\titulo@titulo\ifdefstring{\titulo@subtitulo}{}{}{~-- \titulo@subtitulo}\ / \autor@nome\ -- \@cidade, \data@dia\ de \data@mes de \data@ano.
    \par
    \hspace{\@parindentlength}
    \pageref{LastPage} p.
    \vspace{10pt}
    \par
    \ifdefstring{\orientador@sexo}{M}{%
        \hspace{\@parindentlength}Orientador: \orientador@nome.
    }{ \hspace{\@parindentlength}Orientadora: \orientador@nome.}
    \vspace{10pt}
    \par
    \hspace{\@parindentlength}\ifbool{>tese}{Tese}{%
        \ifbool{>dissertacao}{Disserta\c{c}\~ao}{%
            \ifbool{>monografia}{Monografia}{%
                \ifbool{>tcc}{Trabalho de Conclus\~ao de Curso}{%
                    \ifbool{>quali-msc}{Trabalho de Qualifica\c{c}\~ao de Mestrado}{
                        \ifbool{>quali-doc}{Trabalho de Qualifica\c{c}\~ao de Doutorado}{}                    
    }}}}} -- \universidade@nome .
    \par
    \hspace{\@parindentlength}\faculdade@nome, \data@dia\ de \data@mes de \data@ano.
    \par
    \hspace{\@parindentlength}#1 I.\universidade@nome. II. \faculdade@nome
    \vspace{10pt}
    \par
    \hfill CDU: 11:111:111.1
    \par
    \hrulefill
    }
    \onehalfspacing
    \normalfont
    \cleardoublepage
}

%==================================================================================
%                        if-ufg   TERMO DE APROVACAO
%==================================================================================
% ABNT: NBR 14724/2011
%----------------------------------------------------------------------------------
% O pacote etoolbox fornece a opcao de criacao de listas. Entao para a formacao da
% banca foi usada a opcao de criar uma lista contendo o nome do membro e instituicao
% de origem.
%----------------------------------------------------------------------------------
\newcommand{\@bancaLista}{}
\def\bancavskip#1{\def\@bancavskip{\\[#1]}}    \bancavskip{0pt}  % Default
\def\bancahrule#1{\def\@bancaLine{#1}}        \bancahrule{10cm} % Default

\def\banca{\@ifstar\@@banca\@banca}
\def\@banca#1{\forcsvlist{\listadd\@bancaLista}{#1\@bancavskip}}
\def\@@banca{\@banca{\textbf{\orientador@nome\ } \\ \orientador@facul\ -- \universidade@nome\ \\ Presidente da Banca }}

\newcommand{\aprovacao}{%
    \thispagestyle{\page@type}
    \ifpdf%
        \pdfbookmark[0]{Aprova\c{c}\~ao}{pretexto4}
    \fi
    \singlespacing
    \par
    \info@pos{center}{\textwidth}{1}{\centering\Large \scshape \autor@nome \normalsize \upshape}
    \vspace*{\stretch{2}}
    \par
    \info@pos{center}{\textwidth}{1.7}{\centering\huge \textbf{\titulo@titulo\relax} \normalsize}
    \vspace*{\stretch{0.1}}%    
    \ifdefstring{\titulo@subtitulo}{}{}{%
        \info@pos{center}{\textwidth}{1.2}{\centering\Large \titulo@subtitulo\relax \normalsize}
    }
    \vspace*{\stretch{1.0}}
    \par
    \begin{center}
        \parbox{11cm}{%
        \ifbool{>tese}{%
            Tese defendida no Programa de P\'os--Gradua\c c\~ao %
            do \faculdade@nome\ da \universidade@nome\ como requisito parcial %
            para obten\c c\~ao do grau de Doutor em \@posgrad, aprovada em %
            \data@dia\ de \data@mes de \data@ano, pela Banca Examinadora constitu\'{i}da pelos professores:%
        }{\ifbool{>dissertacao}{%
            Disserta\c{c}\~{a}o defendida no Programa de P\'os--Gradua\c c\~ao %
            do \faculdade@nome\ da \universidade@nome\ como requisito parcial %
            para obten\c c\~ao do t\'itulo de Mestre em \@posgrad, aprovada em %
            \data@dia\ de \data@mes de \data@ano, pela Banca Examinadora constitu\'{i}da pelos professores:%
        }{\ifbool{>monografia}{%
            Monografia apresentada no Programa de P\'os--Gradua\c c\~ao %
            do \faculdade@nome\ da \universidade@nome\ como requisito parcial %
            para obten\c c\~ao do grau de \@habilitacao\ em \@posgrad, aprovada em %
            \data@dia\ de \data@mes de \data@ano, pela Banca Examinadora constitu\'{i}da pelos professores:%
        }{\ifbool{>tcc}{%
            Trabalho de Conclus\~ao de Curso apresentado \`a Coordena\c c\~ao do Curso de \@posgrad\ do\ %
            \faculdade@nome\ da\ \universidade@nome, como requisito parcial para obten\c c\~ao do\ %
            Certificado de Especializa\c{c}\~ao em \@posgrad, aprovada em \data@dia\ de \data@mes de \data@ano, %
            pela Banca Examinadora constitu\'{i}da pelos professores:%
        }{\ifbool{>quali-msc}{%
            Trabalho de Qualifica\c{c}\~{a}o de Mestrado apresentado ao Programa de P\'os--Gradua\c c\~ao %
            do \faculdade@nome\ da \universidade@nome\ como requisito parcial %
            para obten\c c\~ao do t\'itulo de Mestre em \@posgrad, aprovada em %
            \data@dia\ de \data@mes de \data@ano, pela Banca Examinadora constitu\'{i}da pelos professores:%
        }{\ifbool{>quali-doc}{%
            Trabalho de Qualifica\c{c}\~{a}o de Doutorado apresentado ao Programa de P\'os--Gradua\c c\~ao %
            do \faculdade@nome\ da \universidade@nome\ como requisito parcial %
            para obten\c c\~ao do grau de Doutor em \@posgrad, aprovada em %
            \data@dia\ de \data@mes de \data@ano, pela Banca Examinadora constitu\'{i}da pelos professores:%
        }{}
        }}}}}%
    }
    \end{center}
    \vspace*{\stretch{1.5}}
    \par
    \info@pos{center}{\textwidth}{1.7}{\centering
        \forlistloop{\rule{\@bancaLine}{0.5pt} \\}{\@bancaLista}
    }
    \onehalfspacing
    \normalfont
    \cleardoublepage
}

%==================================================================================
%                        if-ufg   DIREITOS AUTORAIS
%==================================================================================
\newenvironment{perfil}{%
    \ifpdf%
        \pdfbookmark[0]{Direitos Autorais}{pretexto5}
    \fi
    \thispagestyle{\page@type}
    \singlespacing\sf
    \info@pos{flushright}{12cm}{1}{\normalfont \normalsize \copyright\ \textbf{\data@ano\ \autor@nome}. \\ Todos os direitos reservados. \'{E} proibida
    a reprodu\c{c}\~{a}o total ou parcial do trabalho sem autoriza\c{c}\~{a}o da
    universidade, do(a) autor(a) e do orientador(a).}
    \vspace*{\stretch{2}}
    \par
    \info@pos{flushright}{13cm}{1}{\sf \textbf{\autor@nome}}
    \vspace*{\stretch{0.05}}
    \par
    \hfill\begin{minipage}[top]{13.0cm}\sf\normalfont
}{\end{minipage}\cleardoublepage\onehalfspacing\normalfont}

%==================================================================================
%                          if-ufg   DEDICATORIA
%==================================================================================
% ABNT: NBR 14724/2011
%----------------------------------------------------------------------------------
\newenvironment{dedicatoria}{%
    \ifpdf%
        \pdfbookmark[0]{Dedicat\'oria}{pretexto6}
    \fi
    \thispagestyle{\page@type}
    \sf\normalfont
    \vspace*{\stretch{1}}
    \begin{flushright}
}{\end{flushright} \cleardoublepage\onehalfspacing\normalfont}

%==================================================================================
%                         if-ufg   AGRADECIMENTOS
%==================================================================================
% ABNT: NBR 14724/2011
%----------------------------------------------------------------------------------
\newenvironment{agradecimentos}{%
    \ifpdf%
        \pdfbookmark[0]{Agradecimentos}{pretexto7}
    \fi
    % \thispagestyle{\page@type}
    \normalfont
    \chapter*{Agradecimentos}
}{\thispagestyle{\page@type}\cleardoublepage\onehalfspacing\normalfont}

%==================================================================================
%                           if-ufg   EPIGRAFE
%==================================================================================
% ABNT: NBR 14724/2011
%----------------------------------------------------------------------------------
\newcommand{\@epigrafeAutor}[1]{\def\@@epigrafeAutor{#1}}
\newenvironment{epigrafe}[1]{%
    \ifpdf%
        \pdfbookmark[0]{Ep\'igrafe}{pretexto10}
    \fi
    \thispagestyle{\page@type}
    \singlespacing\normalfont
    \vspace*{\stretch{1}}
    \par
    \@epigrafeAutor{\ \\ \textbf{-- \footnotesize #1}}
    \begin{flushright}
}{\end{flushright}\raggedleft \@@epigrafeAutor \cleardoublepage\onehalfspacing\normalfont}

%==================================================================================
%                           if-ufg   RESUMO
%==================================================================================
% ABNT: NBR 6028/2003
%----------------------------------------------------------------------------------
\newcommand{\@palavraschaves}[1]{\def\@@palavraschaves{#1}}
\newcommand{\resumo@lang}[1]{\def\resumo@lang@set{#1}}
\newenvironment{resumo}[2]{%
    % \thispagestyle{\page@type}
    \normalfont
    \@palavraschaves{#2}
    \IfStrEqCase{#1}{%
        {pt}{\ifpdf%
                \pdfbookmark[0]{Resumo}{pretexto8}
            \fi
            \resumo@lang{pt}
            \chapter*{Resumo}
            \begin{minipage}{13.5cm}
            \autor@citacao\
            \textbf{\titulo@titulo}%
            \ifdefstring{\titulo@subtitulo}{}{.}{~-- \titulo@subtitulo.}
            \@cidade, \data@ano.
            \pageref{LastPage} p.~%
            \ifbool{>tese}{%
                Tese (Doutorado em \@posgrad) --
            }{ \ifbool{>dissertacao}{%
                Disserta\c{c}\~{a}o (Mestrado em \@posgrad) --
            }{\ifbool{>monografia}{%
                Monografia --
            }{\ifbool{>tcc}{%
                Relat\'{o}rio de Gradua\c{c}\~{a}o --
            }{\ifbool{>quali-msc}{%
                Trabalho de Qualifica\c{c}\~{a}o (Mestrado em \@posgrad) --
            }{\ifbool{>quali-doc}{%
                Trabalho de Qualifica\c{c}\~{a}o (Doutorado em \@posgrad) --%
            }{}
            }}}}}\ifdefstring{\faculdade@depto}{}{}{\faculdade@depto ,~}%
            \ifdefstring{\faculdade@nome}{}{}{\faculdade@nome},\ %
            \universidade@nome.}
        {en}{\ifpdf%
                \pdfbookmark[0]{Abstract}{pretexto9}
            \fi
            \resumo@lang{en}
            \chapter*{Abstract}
            \begin{minipage}{13.5cm}
            \autor@citacao\
            \textbf{\titulo@titulo}%
            \ifdefstring{\titulo@subtitulo}{}{.}{~-- \titulo@subtitulo.}            
            \@cidade, \data@ano.
            \pageref{LastPage} p.~%
            \ifbool{>tese}{%
                Doctoral Dissertation.
            }{ \ifbool{>dissertacao}{%
                Master Thesis.
            }{\ifbool{>monografia}{%
                Monograph.
            }{\ifbool{>tcc}{%
                Completion of course work.
            }{\ifbool{>quali-msc}{%
                Master Qualifying Work.
            }{\ifbool{>quali-doc}{%
                Doctoral Qualifying Work.
            }{}
            }}}}}\ifdefstring{\faculdade@depto}{}{}{\faculdade@depto ,~}%
            \ifdefstring{\faculdade@nome}{}{}{\faculdade@nome},\ %
            \universidade@nome.}}
        [\ClassError{\@classname}{Only ``pt'' and ``en'' are valid arguments on}{}]
    \singlespacing
    \end{minipage}
    \onehalfspacing
    \vspace*{\stretch{1}}
    \par
}{%
    \par\vspace{20pt}\noindent
    \ifdefstring{\resumo@lang@set}{pt}{%
        \textbf{Palavras\,-\,chave:}
    }{%
        \ifdefstring{\resumo@lang@set}{en}{%
            \textbf{Keywords:}%
        }{}
    }%
    \normalfont \normalsize \@@palavraschaves
    \vspace*{\stretch{4}}
    \par
    \thispagestyle{\page@type}\cleardoublepage\onehalfspacing\normalfont
}

%==================================================================================
%                         if-ufg   LISTA DE FIGURAS
%==================================================================================
% ABNT: NBR 14724/2011
%----------------------------------------------------------------------------------
\newcommand{\listadefiguras}{%
    \ifpdf%
        \pdfbookmark[0]{\listfigurename}{figuras}
    \fi
    \begingroup%
        \renewcommand{\numberline}[1]{\hb@xt@\@tempdima{\bfseries Figura ##1:\hfil}}
        \renewcommand{\l@figure}[2]{%
            \@dottedtocline{1}{0pt}{85pt}{##1}{##2}
        }
        \listoffigures
    \endgroup
    \thispagestyle{\page@type}\cleardoublepage
}

%==================================================================================
%                         if-ufg   LISTA DE TABELAS
%==================================================================================
% ABNT: NBR 14724/2011
%----------------------------------------------------------------------------------
\newcommand{\listadetabelas}{%
    \ifpdf%
        \pdfbookmark[0]{\listtablename}{tabelas}
    \fi
    \begingroup%
        \renewcommand{\numberline}[1]{\hb@xt@\@tempdima{\bfseries Tabela ##1:~\hfil}}
        \renewcommand{\l@table}[2]{%
            \@dottedtocline{1}{0pt}{85pt}{##1}{##2}
        }
        \listoftables
    \endgroup
    \thispagestyle{\page@type}\cleardoublepage
}

% Aumenta o espacamento dentro da celula da tabela:
%----------------------------------------------------------------------------------
\renewcommand{\arraystretch}{1.5}

%==================================================================================
%                        if-ufg   LISTA DE ALGORITMOS
%==================================================================================
% Configuracao do estilo dos algoritmos do pacote algorithm2e:

\SetAlgoCaptionSeparator{~--~}
\newlength\algocaplen
\renewcommand{\algocf@captiontext}[2]{%
    \algocf@captionlayout{%
        \settowidth{\algocaplen}{#1\algocf@capseparator~}\hspace{-5pt}\parbox[t][][t]{\the\algocaplen}{\vskip-8.2pt#1\algocf@capseparator}\hspace{-5pt}\parbox[t][][t]{0.785\textwidth}{#2}
    }%
}
\newenvironment{algoritmo}{%
\begin{algorithm2e}
}{\end{algorithm2e}}

\newcommand{\listadealgoritmos}{%
    \ifpdf%
        \pdfbookmark[0]{Lista de Algoritmos}{algoritmos}
    \fi
    \begingroup%
        \renewcommand{\numberline}[1]{\hb@xt@\@tempdima{\bfseries Algoritmo ##1:\hfil}}
        \renewcommand{\l@algocf}[2]{\@dottedtocline{1}{0pt}{102pt}{##1}{##2}}
        \renewcommand{\TitleOfAlgo}{Algoritmo}
        \listofalgorithmes
    \endgroup
    \thispagestyle{\page@type}\cleardoublepage
}

%==================================================================================
%                     if-ufg   CODIGOS E LISTA DE CODIGOS
%==================================================================================
% Configuracao do estilo dos codigos do pacote listings:

\usetikzlibrary{shadows.blur}
\definecolor{verde}{HTML}{00FF00}
\DeclareCaptionFont{codigo@cor}{\color{white}}
\DeclareCaptionLabelSeparator{hifen}{\textcolor{white}{~--~}}
\newlength\caplenh
\DeclareCaptionFormat{listing}{%
\begin{tikzpicture}
    \node[rectangle,rounded corners=2pt,inner sep=1.7pt,inner ysep=2pt,inner xsep=10pt,fill=black!70,align=left,text width=0.955\textwidth]{%
    \settowidth{\caplenh}{#1#2}\hspace{-5pt}\parbox[t][][t]{\the\caplenh}{\vskip2pt#1#2}\parbox[t][][t]{0.85\textwidth}{#3}
    };
\end{tikzpicture}
\hrulefill
}
\captionsetup[lstlisting]{format=listing,labelfont=codigo@cor,textfont=codigo@cor,singlelinecheck=false,font={bf,footnotesize},labelsep=hifen,skip=-10pt}
\AtBeginEnvironment{paisagem}{\captionsetup[lstlisting]{skip=3pt}}

\renewcommand{\lstlistingname}{C\'odigo}
\renewcommand{\lstlistlistingname}{\sf Lista de C\'{o}digos de Programas}
\newcommand{\listadecodigos}{%
    \ifpdf%
        \pdfbookmark[0]{Lista de C\'odigos}{codigos}
    \fi
    \begingroup%
        \renewcommand{\numberline}[1]{\hb@xt@\@tempdima{\bfseries C\'odigo ##1:\hfil}}
        \renewcommand{\l@lstlisting}[2]{\@dottedtocline{1}{0pt}{85pt}{##1}{##2}}
        \lstlistoflistings
    \endgroup
    \thispagestyle{\page@type}\cleardoublepage
}

% Definicao do comando \importarcodigo{x}{x}{x}:
%----------------------------------------------------------------------------------
\newcommand{\importarcodigo}[3]{%
    \singlespacing
    \vskip-15pt    
    \raggedbottom 
    \lstinputlisting[style=codeStyle,#1,caption=#2]{#3}
    \onehalfspacing
}

% Configuracoes do listings:
%----------------------------------------------------------------------------------
\definecolor{Code}{rgb}{0,0,0}
\definecolor{Decorators}{rgb}{0.5,0.5,0.5}
\definecolor{Numbers}{rgb}{0.5,0,0}
\definecolor{MatchingBrackets}{rgb}{0.25,0.5,0.5}
\definecolor{Keywords}{rgb}{0,0,1}
\definecolor{self}{rgb}{0,0,0}
\definecolor{Strings}{rgb}{0,0.63,0}
\definecolor{Comments}{rgb}{0,0.63,1}
\definecolor{Backquotes}{rgb}{0,0,0}
\definecolor{Classname}{rgb}{0,0,0}
\definecolor{FunctionName}{rgb}{0,0,0}
\definecolor{Operators}{rgb}{0,0,0}
\definecolor{Background}{rgb}{0.975,0.975,0.975}

\lstdefinestyle{codeStyle}{%
    literate=
    {á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1 {ù}{{\`u}}1
    {Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
    {à}{{\`a}}1 {è}{{\'e}}1 {ì}{{\`i}}1 {ò}{{\`o}}1 {ò}{{\`o}}1
    {À}{{\`A}}1 {È}{{\'E}}1 {Ì}{{\`I}}1 {Ò}{{\`O}}1 {Ò}{{\`O}}1
    {ä}{{\"a}}1 {ë}{{\"e}}1 {ï}{{\"i}}1 {ö}{{\"o}}1 {ü}{{\"u}}1
    {Ä}{{\"A}}1 {Ë}{{\"E}}1 {Ï}{{\"I}}1 {Ö}{{\"O}}1 {Ü}{{\"U}}1
    {â}{{\^a}}1 {ê}{{\^e}}1 {î}{{\^i}}1 {ô}{{\^o}}1 {û}{{\^u}}1
    {Â}{{\^A}}1 {Ê}{{\^E}}1 {Î}{{\^I}}1 {Ô}{{\^O}}1 {Û}{{\^U}}1
    {ã}{{\~a}}1 {Ã}{{\~A}}1 {õ}{{\~o}}1 {Õ}{{\˜O}}1    
    {œ}{{\oe}}1 {Œ}{{\OE}}1 {æ}{{\ae}}1 {Æ}{{\AE}}1 {ß}{{\ss}}1
    {ç}{{\c c}}1 {Ç}{{\c C}}1 {ø}{{\o}}1 {å}{{\r a}}1 {Å}{{\r A}}1
    {€}{{\EUR}}1 {£}{{\pounds}}1,
    % inputencoding=latin1,
    upquote=true,
    % extendchars=true,
    breaklines=true,
    breakautoindent=true,
    linewidth=\linewidth,
    numbers=left,
    numberstyle=\footnotesize,
    numbersep=1em,
    xleftmargin=1em,
    framextopmargin=5pt,
    framexbottommargin=5pt,
    showspaces=false,
    showtabs=false,
    showstringspaces=false,
    frame=l,
    frameround=tttt,
    aboveskip=20pt,
    belowskip=20pt,
    tabsize=4,
    basicstyle=\ttfamily\small,
    backgroundcolor=\color{gray!5},
    commentstyle=\color{Comments}\slshape,
    stringstyle=\color{Strings},
    morecomment=[s][\color{Strings}]{"""}{"""},
    morecomment=[s][\color{Strings}]{"}{"},
    morecomment=[s][\color{Strings}]{'''}{'''},
    morekeywords={import,from,class,def,for,while,if,is,in,elif,else,not,and,or,print,break,continue,return,True,False,None,access,as,,del,except,exec,finally,global,import,lambda,pass,print,raise,try,assert,void},
    keywordstyle={\color{Keywords}\bfseries},
    keywords=[2]{@,@rm,@echo,rm,echo,pdflatex,bibtex,shell,grep,ifeq,endif,pwd},
    keywordstyle=[2]\color{Keywords},       
    morekeywords={[3]@invariant},
    keywordstyle={[3]\color{Decorators}\slshape},
    rulecolor=\color{red}
}

% Ciracao do ambiente \begin{codigo}...\end{codigo}:
%----------------------------------------------------------------------------------
\lstnewenvironment{codigo}[2]{
    \vskip-15pt
    \singlespacing
    \lstset{style=codeStyle, #1, caption=#2}
}{\vskip-5pt \onehalfspacing}

%==================================================================================
%                            if-ufg   SUMARIO
%==================================================================================
% ABNT: NBR 14724/2011
%----------------------------------------------------------------------------------
% \renewcommand\contentsname{Sumário} % Muda o nome do Sumario

\renewcommand{\cftdot}{.}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\setlength{\cftbeforesubsecskip}{0pt}
\renewcommand{\cftchapindent}{0pt}
\renewcommand{\cftsecindent}{46pt}
\renewcommand{\cftsubsecindent}{73pt}
\renewcommand{\cftsubsubsecindent}{106pt}
% \renewcommand{\cftsubsecnumwidth}{10pt}
% \renewcommand{\cftsubsecnumwidth}{10pt}
% \renewcommand\thesubsection{\thesection.\arabic{subsection}}
% \renewcommand\thesubsection{\alph{subsection}}
\renewcommand{\thesection}{\thechapter.\arabic{section}}
\renewcommand\cfttoctitlefont{\large \sf \bfseries}
\renewcommand\cftloftitlefont{\large \sf \bfseries}
\renewcommand\cftlottitlefont{\large \sf \bfseries}
\renewcommand{\cftchapfont}{\sf \bfseries}
\renewcommand{\cftsecfont}{\sf\small}
\renewcommand{\cftsubsecfont}{\sf\footnotesize}
\renewcommand{\cftsubsubsecfont}{\sf\footnotesize}
\renewcommand{\cftfigfont}{\sf}
\renewcommand{\cfttabfont}{\sf}

\setcounter{tocdepth}{3}        % Muda o numero de subniveis no ToC
\setcounter{secnumdepth}{3}
% \setcounter{lofdepth}{2}      % Muda o numero de subniveis no LoF
% \setcounter{lotdepth}{2}      % Muda o numero de subniveis no LoT

\newcommand{\sumario}{%
    \ifpdf%
        \pdfbookmark[0]{Sumário}{sumario}
    \fi
%    \ps@empty                              % Verificar indice com mais de 3 paginas
    \pagestyle{\page@type}
    \newlength\mylen
    \renewcommand\cftchappresnum{\bfseries \@chapapp~}
    \settowidth\mylen{\bfseries\cftchappresnum\cftchapaftersnum}
    \addtolength\cftchapnumwidth{\mylen}
    \renewcommand\cftchapaftersnum{:}
    \tableofcontents
    \addtocontents{toc}{\protect\thispagestyle{\page@type}}    
    % \pagestyle{\page@type}
    \clearpage
    \cleardoublepage
    \pagestyle{fancy}
    \ifbool{>paginacao}{%
        \pagenumbering{arabic}
        \setcounter{page}{1}  
    }{}
}

% Previne espacos entre figuras de capitulos diferentes no ToC:
%----------------------------------------------------------------------------------
\AtBeginDocument{%
    \newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
    \addtocontents{lof}{\protect\noaddvspace}
}

%==================================================================================
%                     if-ufg   REFERENCIAS BIBLIOGRAFICAS
%==================================================================================
% ABNT: NBR 6023/2000 e NBR 10520/2002
%----------------------------------------------------------------------------------
\renewenvironment{thebibliography}[1]{%
    \cleardoublepage
    \ifpdf%
        \pdfbookmark[0]{REFER\^ENCIAS}{referencias}
    \fi
    \chapter*{\vspace{4pt} \bibname\ \vspace{8pt}}
    \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
    \list{\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \@openbib@code
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}
    }%
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \sfcode`\.\@m
}{%
    \def\@noitemerr 
    {\@latex@warning{Empty `thebibliography' environment}}
    \endlist
}

\pretocmd{\bibliography}{%
    \gdef\@chapapp{\bibname}%
    \gdef\thechapter{}
}{}{}

%==================================================================================
%                             if-ufg   APENDICES
%==================================================================================
% ABNT: NBR 14724/2011
%----------------------------------------------------------------------------------
\newenvironment{apendices}{%
    \cleardoublepage
    \begingroup
    \addtocontents{toc}{%
        \protect\renewcommand{\protect\cftchappresnum}{\protect\appendixname\protect\space}%
        \protect\renewcommand{\protect\cftchapnumwidth}{2.8cm}
    }
    \let\ps@plain\ps@empty
    \renewcommand{\appendixtocname}{APÊNDICES}
    \renewcommand{\appendixpagename}{APÊNDICES}
    \addtocontents{toc}{\protect\renewcommand{\protect\cftchapleader}{\protect\cftdotfill{\protect\@M}}
%     \protect\cftpagenumbersoff{chapter}
    }
    \addtocontents{toc}{\protect\addvspace{30\p@}}
    \addappheadtotoc
    \addtocontents{toc}{\protect\renewcommand{\protect\cftchapleader}{\protect\cftdotfill{\protect\cftdotsep}}
%     \protect\cftpagenumberson{chapter}
    }
    \appendixpage
    \appendix
    \ifbool{>frenteVerso}%
    {\fancyhead[RE]{\sf\small \@chapapp\ \thechapter}%
    \fancyhead[LE]{\thepage}}%
    {}
    \fancyhead[RO]{\thepage}
    \fancyhead[LO]{\sf\small\rightmark}
%     \fancyhead[LO]{\sf{\fontsize{9pt}{15} \selectfont Instituto de F\'isica - UFG}}

}{\endgroup}

%==================================================================================
%                               if-ufg   ANEXOS
%==================================================================================
% ABNT: NBR 14724/2011
%----------------------------------------------------------------------------------
\newcommand{\anexo@pagename}{ANEXOS}
\newcommand{\anexo@tocname}{ANEXOS}
\newcommand{\anexo@name}{Anexo}
\newcommand{\anexo@page}{%
    \cleardoublepage
    \thispagestyle{empty}
    \hbox{}\vfil
    \markboth{}{}
    {\centering
    \interlinepenalty \@M
    \normalfont
    \Huge \bfseries \anexo@pagename\par}
    \vfil\newpage
    \if@twoside
        \if@openright
            \thispagestyle{empty}
            \null
            \newpage
        \fi
    \fi
    \cleardoublepage
}
\newcommand{\@anexo}{%
    \par
    \if@chapter@pp
        \setcounter{chapter}{0}%
        \setcounter{section}{0}%
        \gdef\@chapapp{\anexo@name}%
        \gdef\thechapter{\@arabic\c@chapter}
    \else
        \setcounter{section}{0}%
        \setcounter{subsection}{0}%
        \gdef\thesection{\@arabic\c@section}
    \fi
}
\newenvironment{anexos}{%
    \cleardoublepage
    \begingroup
    \addtocontents{toc}{%
        \protect\renewcommand{\protect\cftchappresnum}{\protect\anexo@name\protect\space}%
        \protect\renewcommand{\protect\cftchapnumwidth}{2.2cm}
    }
    \let\ps@plain\ps@empty
    \renewcommand{\appendixtocname}{\anexo@tocname}
    \renewcommand{\appendixpagename}{\anexo@pagename}
    \addtocontents{toc}{\protect\renewcommand{\protect\cftchapleader}{\protect\cftdotfill{\protect\@M}}
%     \protect\cftpagenumbersoff{chapter}
    }
    \addtocontents{toc}{\protect\addvspace{30\p@}}
    \addappheadtotoc
    \addtocontents{toc}{\protect\renewcommand{\protect\cftchapleader}{\protect\cftdotfill{\protect\cftdotsep}}
%     \protect\cftpagenumberson{chapter}
    }
    \anexo@page
    \@anexo
    \ifbool{>frenteVerso}%
    {\fancyhead[RE]{\sf\small \@chapapp\ \thechapter}
    \fancyhead[LE]{\thepage}}
    {}
    \fancyhead[RO]{\thepage}
    \fancyhead[LO]{\sf\small\rightmark}
%     \fancyhead[LO]{\sf{\fontsize{9pt}{15} \selectfont Instituto de F\'isica - UFG}}
}{\endgroup}

%==================================================================================
%                               if-ufg   LEGENDAS
%==================================================================================
\abovecaptionskip=10pt             % Distancia entre o caption e a figura ou tabela

% Numeracao progressiva das figuras, tabelas e lstlistings (ABNT: NBR 14724/2011 - 5.4):
%----------------------------------------------------------------------------------
\AtBeginDocument{%
    \counterwithout{figure}{chapter}
    \counterwithout{figure}{section}
    \counterwithout{table}{chapter}
    \counterwithout{table}{section}
    \counterwithout{lstlisting}{chapter}
    \counterwithout{lstlisting}{section}   
}

% Formatacao das legendas para figuras (ABNT: NBR 14724/2011 - 5.8):
%----------------------------------------------------------------------------------
\AtBeginDocument{%
    \captionsetup[figure]{%
        format=hang,
        font=small,
        labelseparator=endash,
        justification=justified,
        singlelinecheck=true,
        position=top % Aparentemente nao funciona. Solucao: pacote float.        
    }
}

% Formatacao das legendas para tabelas (ABNT: NBR 14724/2011 - 5.9):
%----------------------------------------------------------------------------------
\AtBeginDocument{%
    \captionsetup[table]{%
        format=hang,
        font=small,
        labelseparator=colon,
        justification=RaggedRight,
        singlelinecheck=false,
        position=top % Aparentemente nao funciona. Solucao: pacote float.
    }
}

% Define o comando \fonte para figuras e tabelas:
%----------------------------------------------------------------------------------
\newcommand{\fonte}[2][Fonte]{%
    \par
    \vskip 5pt
    \begingroup
        \@parboxrestore
        \if@minipage
            \@setminipage
        \fi
        \captionsetup{labelseparator=colon}
    \@makecaption{#1}{\ignorespaces #2}
    \vskip-10pt
\endgroup
}

%==================================================================================
%                          if-ufg   LAYOUT DAS PAGINAS
%==================================================================================
% Fonte e tamanho da fonte (ABNT: NBR 14724/2011 - 5.2):
%----------------------------------------------------------------------------------
\fontsize{12pt}{15pt} \fontfamily{lmr} \selectfont
\onehalfspacing

% Cabecalhos e rodapes (ABNT: NBR 14724/2011 - 5.2.1):
%----------------------------------------------------------------------------------

\fancyhf{}               % Deleta as configuracoes atuais dos cabecalhos e rodapes.
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0.5pt}
\renewcommand{\headwidth}{\textwidth}
\renewcommand\@makefntext[1]{\hangindent=1.2em\leftskip=0.4em\hskip-0.4em\@makefnmark\hskip1.2em\relax#1}

\ifbool{>frenteVerso}{%
    \fancyhead[RE]{\sf\small\nouppercase\leftmark}
    \fancyhead[LE]{\thepage}
    \fancyhead[LO]{\sf\small\nouppercase\rightmark}
    \fancyhead[RO]{\thepage}
    \fancyfoot[RO]{\logo@if@footer\raisebox{0 em}{\sf\small\faculdade@nome\ -- \universidade@sigla}}
    \fancyfoot[LE]{\logo@if@footer\raisebox{0 em}{\sf\small\faculdade@nome\ -- \universidade@sigla}}
}{}

\ifbool{>frente}{%
    \fancyhead[R]{\thepage}
    \fancyhead[L]{%
        \ifodd \c@page
            \sf\small\nouppercase\leftmark
        \else%
            \sf\small\nouppercase\rightmark
        \fi
    }
    \fancyfoot[R]{\logo@if@footer\sf\small\faculdade@nome\ -- \universidade@sigla}
}{}

% Geometria do documento (ABNT: NBR 14724/2011 - 5.1):
%----------------------------------------------------------------------------------
\geometry{a4paper,left=3cm,right=2cm,top=3cm,bottom=2cm}

\setlength{\voffset}{-1in}
\addtolength{\voffset}{79.7pt}              % Distancia de 2cm para a numeracao das paginas
\setlength{\headheight}{15pt}
\setlength{\headsep}{28.35pt}
\setlength{\parindent}{1.5cm}               % Paragrafo comecando a 1,25cm da margem
\setlength{\skip\footins}{\baselineskip}

% Caixa na qual aparecem os numeros dos capitulos:
%----------------------------------------------------------------------------------
\newcommand*{\@caixa}[1]{%
    \begin{tikzpicture}
        \node[rectangle,inner sep=1.7pt,inner ysep=0.5pt,inner xsep=0.5pt,fill=black,text=white]{#1};
    \end{tikzpicture}
}

% Formatacao dos capitulos:
%----------------------------------------------------------------------------------
\titleformat{\chapter}[display]
{\normalfont\filright\sffamily}
{\hspace*{-5pt}\raggedright~\rotatebox{90}{\MakeUppercase{\@chapapp}}~\scalebox{7}[6.5]{\@caixa{\thechapter}}\hspace*{-20pt}}
{-2pt}
{\normalfont\titlerule[1pt]\vspace{-2pt}\Huge\scshape\centering}%
[\vspace{-30pt}\rule{\linewidth}{1pt}\vspace{0cm}\thispagestyle{empty}]

% Controle de linhas:
%----------------------------------------------------------------------------------
\onehalfspacing
\frenchspacing
\emergencystretch=20pt
\pretolerance=500
\tolerance=2500

% Controle de orfas e viuvas:
%----------------------------------------------------------------------------------
\widowpenalty10000                               % Controle de vivuas.       
\clubpenalty10000                                % Controle de orfas.   
\setlength\parfillskip{0pt plus .9\textwidth}
\setlength\emergencystretch{.1\textwidth}

% Controle de floats:
%----------------------------------------------------------------------------------
\floatstyle{plaintop}
\restylefloat{figure}
\restylefloat{table}
\restylefloat{algocf}
\renewcommand\floatpagefraction{.7}
\renewcommand\topfraction{.7}
\renewcommand\bottomfraction{.7}
\renewcommand\textfraction{.3}
\setcounter{totalnumber}{10}
\setcounter{topnumber}{10}
\setcounter{bottomnumber}{10}
\setlength{\textfloatsep}{15pt}             % Distancia acima e abaixo entre os floats e o texto.
\setlength{\floatsep}{15pt}                 % Distancia entre dois floats.
\setlength{\intextsep}{15pt}                % Distancia entre os floats inseridos na pagina do texto e o texto.

%==================================================================================
%                              if-ufg   LOGOTIPO
%==================================================================================
\newcommand{\logo@if@footer}{%
\begin{tikzpicture}[y=0.80pt,x=0.80pt,yscale=-1, scale=.1, inner sep=0pt, outer sep=0pt]
  \path[fill=black] (401.6096,373.3583) .. controls (373.0771,375.7018) and
    (329.8152,378.3666) .. (309.1848,383.6844) -- (309.1848,434.7218) --
    (279.8996,434.7218) -- (279.8996,391.1285) -- (255.7243,391.1285) --
    (255.7243,434.7218) -- (158.2492,434.7218) .. controls (173.9209,425.4655) and
    (189.2863,415.8400) .. (207.8241,408.8046) .. controls (205.2701,408.6963) and
    (199.4287,407.1886) .. (195.3627,408.1090) .. controls (251.7548,381.6892) and
    (313.0754,361.0722) .. (401.6096,350.3375) -- cycle(309.0237,347.5611) ..
    controls (356.2945,328.4511) and (406.2831,314.7310) .. (458.2492,307.2451) --
    (458.2492,329.3824) .. controls (411.0279,332.8577) and (362.1603,341.7138) ..
    (309.0237,357.6750) -- cycle(267.8476,349.6671) .. controls
    (274.4794,349.6671) and (279.8879,355.0748) .. (279.8879,361.7066) .. controls
    (279.8879,368.3375) and (274.4794,373.7451) .. (267.8476,373.7451) .. controls
    (261.2175,373.7451) and (255.8082,368.3375) .. (255.8082,361.7066) .. controls
    (255.8082,355.0748) and (261.2175,349.6671) .. (267.8476,349.6671) -- cycle;
\end{tikzpicture}
}

\newcommand{\logo@if}{%
    \begin{center}
    \resizebox{11cm}{!}{%
    \begin{tikzpicture}[y=0.80pt,x=0.80pt,yscale=-1, inner sep=0pt, outer sep=0pt]
        \path[fill=logocolor] (9.2284,248.6848) .. controls (-1.2829,249.5483) and
        (-17.2201,250.5301) .. (-24.8199,252.4886) -- (-24.8199,271.2900) --
        (-35.6084,271.2900) -- (-35.6084,255.2302) -- (-44.5144,255.2302) --
        (-44.5144,271.2900) -- (-80.4232,271.2900) .. controls (-74.6501,267.8800) and
        (-68.9893,264.3331) .. (-62.1600,261.7427) .. controls (-63.1012,261.7022) and
        (-65.2532,261.1470) .. (-66.7503,261.4867) .. controls (-45.9769,251.7535) and
        (-23.3870,244.1596) .. (9.2284,240.2055) -- (9.2284,248.6848) --
        cycle(-24.8791,239.1823) .. controls (-7.4658,232.1418) and (10.9503,227.0877)
        .. (30.0939,224.3300) -- (30.0939,232.4857) .. controls (12.6976,233.7657) and
        (-5.3037,237.0279) .. (-24.8791,242.9083) -- (-24.8791,239.1823) --
        cycle(-40.0483,239.9579) .. controls (-37.6049,239.9579) and
        (-35.6126,241.9502) .. (-35.6126,244.3928) .. controls (-35.6126,246.8354) and
        (-37.6049,248.8276) .. (-40.0483,248.8276) .. controls (-42.4909,248.8276) and
        (-44.4831,246.8354) .. (-44.4831,244.3928) .. controls (-44.4831,241.9502) and
        (-42.4909,239.9579) .. (-40.0483,239.9579) -- cycle(54.8434,234.8582) --
        (54.8434,224.5885) -- (56.7021,224.5885) -- (56.7021,235.0086) .. controls
        (56.7021,235.6828) and (56.8534,236.1770) .. (57.1542,236.4981) .. controls
        (57.4549,236.8149) and (57.9137,236.9755) .. (58.5356,236.9755) .. controls
        (59.1574,236.9755) and (59.6153,236.8149) .. (59.9127,236.4981) .. controls
        (60.2110,236.1770) and (60.3580,235.6828) .. (60.3580,235.0086) --
        (60.3580,224.5885) -- (62.2269,224.5885) -- (62.2269,234.8582) .. controls
        (62.2269,236.2125) and (61.9320,237.2011) .. (61.3398,237.8229) .. controls
        (60.7475,238.4481) and (59.8147,238.7590) .. (58.5356,238.7590) .. controls
        (57.2555,238.7590) and (56.3228,238.4481) .. (55.7305,237.8229) .. controls
        (55.1382,237.2011) and (54.8434,236.2125) .. (54.8434,234.8582) --
        cycle(64.4498,238.5858) -- (64.4498,229.1796) -- (66.1548,229.1796) --
        (66.1548,230.1192) .. controls (66.3838,229.7753) and (66.6651,229.5168) ..
        (66.9955,229.3435) .. controls (67.3225,229.1703) and (67.7060,229.0850) ..
        (68.1412,229.0850) .. controls (68.8314,229.0850) and (69.3451,229.2776) ..
        (69.6797,229.6612) .. controls (70.0160,230.0440) and (70.1833,230.6295) ..
        (70.1833,231.4152) -- (70.1833,238.5858) -- (68.4487,238.5858) --
        (68.4487,232.2694) .. controls (68.4487,231.6307) and (68.3667,231.1956) ..
        (68.2003,230.9632) .. controls (68.0330,230.7342) and (67.7449,230.6193) ..
        (67.3360,230.6193) .. controls (66.9532,230.6193) and (66.6617,230.7409) ..
        (66.4649,230.9801) .. controls (66.2722,231.2184) and (66.1742,231.5758) ..
        (66.1742,232.0472) -- (66.1742,238.5858) -- (64.4498,238.5858) --
        cycle(72.0615,226.3721) .. controls (72.0615,226.0578) and (72.1662,225.7925)
        .. (72.3791,225.5762) .. controls (72.5887,225.3573) and (72.8506,225.2492) ..
        (73.1649,225.2492) .. controls (73.4724,225.2492) and (73.7310,225.3573) ..
        (73.9405,225.5762) .. controls (74.1526,225.7925) and (74.2582,226.0578) ..
        (74.2582,226.3721) .. controls (74.2582,226.6796) and (74.1500,226.9381) ..
        (73.9371,227.1536) .. controls (73.7208,227.3665) and (73.4657,227.4746) ..
        (73.1649,227.4746) .. controls (72.8506,227.4746) and (72.5887,227.3698) ..
        (72.3791,227.1570) .. controls (72.1662,226.9474) and (72.0615,226.6855) ..
        (72.0615,226.3721) -- cycle(72.3039,238.5858) -- (72.3039,229.1796) --
        (74.0284,229.1796) -- (74.0284,238.5858) -- (72.3039,238.5858) --
        cycle(75.3050,229.1796) -- (77.0987,229.1796) -- (78.0771,234.0893) ..
        controls (78.1362,234.3766) and (78.1852,234.7010) .. (78.2309,235.0609) ..
        controls (78.2765,235.4242) and (78.3162,235.8171) .. (78.3551,236.2455) ..
        controls (78.4142,235.7284) and (78.4666,235.2899) .. (78.5122,234.9334) ..
        controls (78.5612,234.5734) and (78.6068,234.2980) .. (78.6533,234.1087) --
        (79.6123,229.1796) -- (81.3958,229.1796) -- (79.0453,238.5858) --
        (77.6648,238.5858) -- (75.3050,229.1796) -- cycle(83.7911,232.8515) --
        (86.4263,232.8515) -- (86.4263,232.6124) .. controls (86.4263,231.8368) and
        (86.3241,231.2809) .. (86.1188,230.9336) .. controls (85.9160,230.5906) and
        (85.5848,230.4166) .. (85.1336,230.4166) .. controls (84.6918,230.4166) and
        (84.3580,230.6227) .. (84.1316,231.0359) .. controls (83.9060,231.4473) and
        (83.7911,232.0531) .. (83.7911,232.8515) -- cycle(88.0004,235.4403) --
        (88.0004,235.5652) .. controls (88.0004,236.5563) and (87.7520,237.3353) ..
        (87.2509,237.9047) .. controls (86.7533,238.4742) and (86.0723,238.7589) ..
        (85.2088,238.7589) .. controls (84.1553,238.7589) and (83.3822,238.3661) ..
        (82.8947,237.5837) .. controls (82.4072,236.8021) and (82.1622,235.5483) ..
        (82.1622,233.8298) .. controls (82.1622,232.2135) and (82.4072,231.0028) ..
        (82.8947,230.2044) .. controls (83.3822,229.4051) and (84.1223,229.0063) ..
        (85.1134,229.0063) .. controls (86.1678,229.0063) and (86.9299,229.3696) ..
        (87.3946,230.0962) .. controls (87.8627,230.8195) and (88.0950,232.0074) ..
        (88.0950,233.6566) -- (88.0950,234.2033) -- (83.7911,234.2033) --
        (83.7911,234.4812) .. controls (83.7911,235.4664) and (83.9026,236.1803) ..
        (84.1257,236.6256) .. controls (84.3513,237.0700) and (84.7044,237.2930) ..
        (85.1886,237.2930) .. controls (85.5781,237.2930) and (85.8763,237.1393) ..
        (86.0757,236.8309) .. controls (86.2785,236.5233) and (86.3866,236.0654) ..
        (86.4061,235.4503) -- (88.0004,235.4413) -- cycle(89.7839,238.5858) --
        (89.7839,229.1796) -- (91.4501,229.1796) -- (91.4501,230.5509) .. controls
        (91.6883,230.0541) and (91.9900,229.6773) .. (92.3626,229.4255) .. controls
        (92.7326,229.1703) and (93.1872,229.0326) .. (93.7245,229.0064) --
        (93.7245,230.8289) -- (93.4364,230.8289) .. controls (92.7656,230.8289) and
        (92.2713,230.9961) .. (91.9604,231.3333) .. controls (91.6461,231.6670) and
        (91.4889,232.1942) .. (91.4889,232.9107) -- (91.4889,238.5858) --
        (89.7839,238.5858) -- cycle(94.5491,236.6020) .. controls (94.7916,236.8116)
        and (95.0333,236.9721) .. (95.2724,237.0768) .. controls (95.5115,237.1816)
        and (95.7565,237.2340) .. (96.0057,237.2340) .. controls (96.3690,237.2340)
        and (96.6664,237.1259) .. (96.8988,236.9071) .. controls (97.1278,236.6908)
        and (97.2427,236.4128) .. (97.2427,236.0723) .. controls (97.2427,235.6693)
        and (96.9250,235.1691) .. (96.2930,234.5667) .. controls (96.2119,234.4847)
        and (96.1460,234.4265) .. (96.1037,234.3867) .. controls (95.4887,233.8046)
        and (95.0764,233.3230) .. (94.8668,232.9369) .. controls (94.6539,232.5542)
        and (94.5491,232.1317) .. (94.5491,231.6738) .. controls (94.5491,230.8787)
        and (94.7916,230.2332) .. (95.2791,229.7364) .. controls (95.7633,229.2354)
        and (96.3952,228.9870) .. (97.1675,228.9870) .. controls (97.4226,228.9870)
        and (97.6744,229.0191) .. (97.9203,229.0815) .. controls (98.1653,229.1466)
        and (98.4111,229.2421) .. (98.6536,229.3696) -- (98.6536,231.1430) .. controls
        (98.4669,230.9276) and (98.2641,230.7671) .. (98.0445,230.6657) .. controls
        (97.8248,230.5643) and (97.5696,230.5119) .. (97.2815,230.5119) .. controls
        (96.9613,230.5119) and (96.6994,230.6132) .. (96.4899,230.8194) .. controls
        (96.2837,231.0222) and (96.1789,231.2807) .. (96.1789,231.5950) .. controls
        (96.1789,232.0107) and (96.4831,232.4948) .. (97.0889,233.0516) .. controls
        (97.2097,233.1621) and (97.3018,233.2442) .. (97.3567,233.3034) .. controls
        (97.9262,233.8272) and (98.3224,234.2978) .. (98.5421,234.7203) .. controls
        (98.7609,235.1427) and (98.8725,235.6142) .. (98.8725,236.1304) .. controls
        (98.8725,236.9297) and (98.6300,237.5676) .. (98.1425,238.0458) .. controls
        (97.6583,238.5198) and (97.0103,238.7589) .. (96.1984,238.7589) .. controls
        (95.9365,238.7589) and (95.6686,238.7293) .. (95.3932,238.6734) .. controls
        (95.1186,238.6150) and (94.8372,238.5298) .. (94.5491,238.4123) --
        (94.5491,236.6017) -- cycle(100.2243,226.3720) .. controls (100.2243,226.0578)
        and (100.3290,225.7924) .. (100.5420,225.5762) .. controls (100.7515,225.3573)
        and (101.0134,225.2492) .. (101.3269,225.2492) .. controls (101.6353,225.2492)
        and (101.8938,225.3573) .. (102.1025,225.5762) .. controls (102.3154,225.7924)
        and (102.4202,226.0578) .. (102.4202,226.3720) .. controls (102.4202,226.6796)
        and (102.3129,226.9381) .. (102.0999,227.1536) .. controls (101.8837,227.3665)
        and (101.6285,227.4746) .. (101.3269,227.4746) .. controls (101.0134,227.4746)
        and (100.7515,227.3698) .. (100.5420,227.1570) .. controls (100.3290,226.9474)
        and (100.2243,226.6855) .. (100.2243,226.3720) -- cycle(100.4668,238.5858) --
        (100.4668,229.1796) -- (102.1912,229.1796) -- (102.1912,238.5858) --
        (100.4668,238.5858) -- cycle(105.7296,233.8958) .. controls
        (105.7296,235.1006) and (105.8276,235.9413) .. (106.0270,236.4254) .. controls
        (106.2239,236.9070) and (106.5568,237.1487) .. (107.0248,237.1487) .. controls
        (107.4895,237.1487) and (107.8241,236.9070) .. (108.0235,236.4254) .. controls
        (108.2195,235.9413) and (108.3209,235.1006) .. (108.3209,233.8958) .. controls
        (108.3209,232.6885) and (108.2195,231.8436) .. (108.0235,231.3594) .. controls
        (107.8241,230.8787) and (107.4895,230.6362) .. (107.0248,230.6362) .. controls
        (106.5568,230.6362) and (106.2239,230.8787) .. (106.0270,231.3594) .. controls
        (105.8276,231.8436) and (105.7296,232.6885) .. (105.7296,233.8958) --
        cycle(108.2626,238.5858) -- (108.2626,237.6657) .. controls
        (108.0269,238.0426) and (107.7548,238.3205) .. (107.4507,238.4937) .. controls
        (107.1499,238.6703) and (106.7992,238.7590) .. (106.4005,238.7590) .. controls
        (105.5725,238.7590) and (104.9599,238.3628) .. (104.5704,237.5745) .. controls
        (104.1809,236.7854) and (103.9849,235.5586) .. (103.9849,233.8958) .. controls
        (103.9849,232.2297) and (104.1809,230.9995) .. (104.5704,230.2104) .. controls
        (104.9599,229.4221) and (105.5725,229.0258) .. (106.4005,229.0258) .. controls
        (106.8060,229.0258) and (107.1592,229.1113) .. (107.4608,229.2844) .. controls
        (107.7650,229.4576) and (108.0336,229.7296) .. (108.2626,230.0997) --
        (108.2626,223.7242) -- (109.9870,223.7242) -- (109.9870,238.5858) --
        (108.2626,238.5858) -- cycle(115.9435,238.5858) -- (115.9435,237.6657) ..
        controls (115.7078,238.0426) and (115.4357,238.3205) .. (115.1316,238.4937) ..
        controls (114.8308,238.6703) and (114.4802,238.7590) .. (114.0814,238.7590) ..
        controls (113.2889,238.7590) and (112.6907,238.3467) .. (112.2818,237.5221) ..
        controls (111.8720,236.6975) and (111.6658,235.4800) .. (111.6658,233.8696) ..
        controls (111.6658,232.2694) and (111.8686,231.0612) .. (112.2750,230.2400) ..
        controls (112.6805,229.4187) and (113.2830,229.0064) .. (114.0814,229.0064) ..
        controls (114.4869,229.0064) and (114.8401,229.0919) .. (115.1417,229.2650) ..
        controls (115.4459,229.4382) and (115.7146,229.7102) .. (115.9435,230.0794) --
        (115.9435,229.1796) -- (117.6680,229.1796) -- (117.6680,238.5858) --
        (115.9435,238.5858) -- cycle(113.4105,233.8696) .. controls
        (113.4105,235.0711) and (113.5119,235.9185) .. (113.7113,236.4094) .. controls
        (113.9141,236.9036) and (114.2453,237.1487) .. (114.7066,237.1487) .. controls
        (115.1679,237.1487) and (115.4983,236.9003) .. (115.6977,236.4060) .. controls
        (115.9004,235.9084) and (116.0027,235.0643) .. (116.0027,233.8696) .. controls
        (116.0027,232.6657) and (115.9004,231.8242) .. (115.7044,231.3400) .. controls
        (115.5050,230.8584) and (115.1713,230.6168) .. (114.7066,230.6168) .. controls
        (114.2385,230.6168) and (113.9048,230.8584) .. (113.7079,231.3400) .. controls
        (113.5085,231.8242) and (113.4105,232.6657) .. (113.4105,233.8696) --
        cycle(121.0915,233.8957) .. controls (121.0915,235.1006) and
        (121.1895,235.9412) .. (121.3897,236.4253) .. controls (121.5857,236.9069) and
        (121.9195,237.1486) .. (122.3875,237.1486) .. controls (122.8522,237.1486) and
        (123.1860,236.9069) .. (123.3862,236.4253) .. controls (123.5822,235.9412) and
        (123.6836,235.1006) .. (123.6836,233.8957) .. controls (123.6836,232.6884) and
        (123.5822,231.8435) .. (123.3862,231.3594) .. controls (123.1860,230.8786) and
        (122.8522,230.6361) .. (122.3875,230.6361) .. controls (121.9195,230.6361) and
        (121.5857,230.8786) .. (121.3897,231.3594) .. controls (121.1895,231.8435) and
        (121.0915,232.6884) .. (121.0915,233.8957) -- cycle(123.6253,238.5857) --
        (123.6253,237.6656) .. controls (123.3896,238.0425) and (123.1175,238.3204) ..
        (122.8134,238.4936) .. controls (122.5117,238.6702) and (122.1619,238.7589) ..
        (121.7631,238.7589) .. controls (120.9352,238.7589) and (120.3226,238.3627) ..
        (119.9331,237.5744) .. controls (119.5436,236.7853) and (119.3468,235.5585) ..
        (119.3468,233.8957) .. controls (119.3468,232.2296) and (119.5436,230.9994) ..
        (119.9331,230.2103) .. controls (120.3226,229.4220) and (120.9352,229.0258) ..
        (121.7631,229.0258) .. controls (122.1687,229.0258) and (122.5219,229.1113) ..
        (122.8226,229.2843) .. controls (123.1277,229.4575) and (123.3955,229.7296) ..
        (123.6253,230.0996) -- (123.6253,223.7241) -- (125.3497,223.7241) --
        (125.3497,238.5857) -- (123.6253,238.5857) -- cycle(128.5536,232.8514) --
        (131.1879,232.8514) -- (131.1879,232.6123) .. controls (131.1879,231.8367) and
        (131.0865,231.2808) .. (130.8804,230.9335) .. controls (130.6776,230.5905) and
        (130.3473,230.4165) .. (129.8953,230.4165) .. controls (129.4534,230.4165) and
        (129.1196,230.6226) .. (128.8941,231.0358) .. controls (128.6685,231.4472) and
        (128.5536,232.0530) .. (128.5536,232.8514) -- cycle(132.7620,235.4402) --
        (132.7620,235.5651) .. controls (132.7620,236.5562) and (132.5136,237.3352) ..
        (132.0126,237.9046) .. controls (131.5158,238.4741) and (130.8348,238.7588) ..
        (129.9704,238.7588) .. controls (128.9169,238.7588) and (128.1446,238.3660) ..
        (127.6571,237.5836) .. controls (127.1688,236.8020) and (126.9238,235.5482) ..
        (126.9238,233.8297) .. controls (126.9238,232.2134) and (127.1688,231.0027) ..
        (127.6571,230.2043) .. controls (128.1446,229.4050) and (128.8839,229.0062) ..
        (129.8758,229.0062) .. controls (130.9294,229.0062) and (131.6923,229.3695) ..
        (132.1570,230.0961) .. controls (132.6251,230.8194) and (132.8575,232.0073) ..
        (132.8575,233.6565) -- (132.8575,234.2032) -- (128.5536,234.2032) --
        (128.5536,234.4811) .. controls (128.5536,235.4663) and (128.6651,236.1802) ..
        (128.8873,236.6255) .. controls (129.1137,237.0699) and (129.4669,237.2930) ..
        (129.9510,237.2930) .. controls (130.3405,237.2930) and (130.6388,237.1392) ..
        (130.8382,236.8308) .. controls (131.0409,236.5232) and (131.1491,236.0653) ..
        (131.1685,235.4502) -- (132.7620,235.4412) -- cycle(138.4870,238.5857) --
        (138.4870,224.5884) -- (144.2204,224.5884) -- (144.2204,226.2765) --
        (140.3745,226.2765) -- (140.3745,230.4562) -- (143.9027,230.4562) --
        (143.9027,232.1248) -- (140.3745,232.1248) -- (140.3745,238.5857) --
        (138.4870,238.5857) -- cycle(146.9824,232.8514) -- (149.6176,232.8514) --
        (149.6176,232.6123) .. controls (149.6176,231.8367) and (149.5154,231.2808) ..
        (149.3101,230.9335) .. controls (149.1064,230.5905) and (148.7761,230.4165) ..
        (148.3241,230.4165) .. controls (147.8822,230.4165) and (147.5485,230.6226) ..
        (147.3229,231.0358) .. controls (147.0973,231.4472) and (146.9824,232.0530) ..
        (146.9824,232.8514) -- cycle(151.1916,235.4402) -- (151.1916,235.5651) ..
        controls (151.1916,236.5562) and (150.9424,237.3352) .. (150.4422,237.9047) ..
        controls (149.9446,238.4741) and (149.2636,238.7588) .. (148.3993,238.7588) ..
        controls (147.3457,238.7588) and (146.5735,238.3660) .. (146.0859,237.5836) ..
        controls (145.5984,236.8020) and (145.3526,235.5482) .. (145.3526,233.8297) ..
        controls (145.3526,232.2134) and (145.5984,231.0027) .. (146.0859,230.2043) ..
        controls (146.5735,229.4050) and (147.3136,229.0062) .. (148.3046,229.0062) ..
        controls (149.3591,229.0062) and (150.1212,229.3695) .. (150.5858,230.0961) ..
        controls (151.0539,230.8194) and (151.2863,232.0073) .. (151.2863,233.6565) --
        (151.2863,234.2032) -- (146.9824,234.2032) -- (146.9824,234.4811) .. controls
        (146.9824,235.4663) and (147.0939,236.1802) .. (147.3161,236.6255) .. controls
        (147.5425,237.0699) and (147.8957,237.2930) .. (148.3798,237.2930) .. controls
        (148.7693,237.2930) and (149.0676,237.1392) .. (149.2670,236.8308) .. controls
        (149.4697,236.5232) and (149.5779,236.0653) .. (149.5973,235.4502) --
        (151.1916,235.4412) -- cycle(154.3068,233.8957) .. controls
        (154.3068,235.1006) and (154.4048,235.9412) .. (154.6050,236.4253) .. controls
        (154.8010,236.9069) and (155.1347,237.1486) .. (155.6028,237.1486) .. controls
        (156.0675,237.1486) and (156.4012,236.9069) .. (156.6015,236.4253) .. controls
        (156.7975,235.9412) and (156.8989,235.1006) .. (156.8989,233.8957) .. controls
        (156.8989,232.6884) and (156.7975,231.8435) .. (156.6015,231.3594) .. controls
        (156.4012,230.8786) and (156.0675,230.6361) .. (155.6028,230.6361) .. controls
        (155.1347,230.6361) and (154.8010,230.8786) .. (154.6050,231.3594) .. controls
        (154.4048,231.8435) and (154.3068,232.6884) .. (154.3068,233.8957) --
        cycle(156.8397,238.5857) -- (156.8397,237.6656) .. controls
        (156.6049,238.0425) and (156.3328,238.3204) .. (156.0286,238.4936) .. controls
        (155.7270,238.6702) and (155.3772,238.7589) .. (154.9784,238.7589) .. controls
        (154.1496,238.7589) and (153.5379,238.3627) .. (153.1484,237.5744) .. controls
        (152.7589,236.7853) and (152.5629,235.5585) .. (152.5629,233.8957) .. controls
        (152.5629,232.2296) and (152.7589,230.9994) .. (153.1484,230.2103) .. controls
        (153.5379,229.4220) and (154.1496,229.0258) .. (154.9784,229.0258) .. controls
        (155.3840,229.0258) and (155.7372,229.1113) .. (156.0379,229.2843) .. controls
        (156.3430,229.4575) and (156.6108,229.7296) .. (156.8397,230.0996) --
        (156.8397,223.7241) -- (158.5650,223.7241) -- (158.5650,238.5857) --
        (156.8397,238.5857) -- cycle(161.7689,232.8514) -- (164.4041,232.8514) --
        (164.4041,232.6123) .. controls (164.4041,231.8367) and (164.3018,231.2808) ..
        (164.0965,230.9335) .. controls (163.8929,230.5905) and (163.5626,230.4165) ..
        (163.1106,230.4165) .. controls (162.6687,230.4165) and (162.3358,230.6226) ..
        (162.1094,231.0358) .. controls (161.8838,231.4472) and (161.7689,232.0530) ..
        (161.7689,232.8514) -- cycle(165.9781,235.4402) -- (165.9781,235.5651) ..
        controls (165.9781,236.5562) and (165.7289,237.3352) .. (165.2287,237.9047) ..
        controls (164.7311,238.4741) and (164.0501,238.7588) .. (163.1866,238.7588) ..
        controls (162.1322,238.7588) and (161.3599,238.3660) .. (160.8724,237.5836) ..
        controls (160.3849,236.8021) and (160.1391,235.5482) .. (160.1391,233.8297) ..
        controls (160.1391,232.2135) and (160.3849,231.0027) .. (160.8724,230.2043) ..
        controls (161.3599,229.4050) and (162.1001,229.0062) .. (163.0911,229.0062) ..
        controls (164.1455,229.0062) and (164.9076,229.3695) .. (165.3723,230.0961) ..
        controls (165.8404,230.8194) and (166.0727,232.0073) .. (166.0727,233.6565) --
        (166.0727,234.2032) -- (161.7689,234.2032) -- (161.7689,234.4811) .. controls
        (161.7689,235.4663) and (161.8803,236.1802) .. (162.1034,236.6255) .. controls
        (162.3290,237.0699) and (162.6822,237.2930) .. (163.1663,237.2930) .. controls
        (163.5558,237.2930) and (163.8541,237.1392) .. (164.0534,236.8308) .. controls
        (164.2562,236.5233) and (164.3644,236.0653) .. (164.3838,235.4502) --
        (165.9781,235.4412) -- cycle(167.7617,238.5857) -- (167.7617,229.1795) --
        (169.4270,229.1795) -- (169.4270,230.5508) .. controls (169.6661,230.0540) and
        (169.9677,229.6772) .. (170.3403,229.4254) .. controls (170.7104,229.1702) and
        (171.1649,229.0325) .. (171.7014,229.0063) -- (171.7014,230.8288) --
        (171.4142,230.8288) .. controls (170.7433,230.8288) and (170.2491,230.9960) ..
        (169.9381,231.3332) .. controls (169.6238,231.6669) and (169.4667,232.1941) ..
        (169.4667,232.9106) -- (169.4667,238.5857) -- (167.7617,238.5857) --
        cycle(176.9482,238.5857) -- (176.9482,237.6656) .. controls
        (176.7125,238.0425) and (176.4413,238.3204) .. (176.1371,238.4936) .. controls
        (175.8355,238.6702) and (175.4849,238.7589) .. (175.0861,238.7589) .. controls
        (174.2944,238.7589) and (173.6954,238.3466) .. (173.2864,237.5220) .. controls
        (172.8767,236.6974) and (172.6705,235.4799) .. (172.6705,233.8695) .. controls
        (172.6705,232.2693) and (172.8733,231.0611) .. (173.2797,230.2399) .. controls
        (173.6852,229.4186) and (174.2876,229.0063) .. (175.0861,229.0063) .. controls
        (175.4916,229.0063) and (175.8456,229.0918) .. (176.1464,229.2649) .. controls
        (176.4506,229.4381) and (176.7192,229.7101) .. (176.9482,230.0794) --
        (176.9482,229.1795) -- (178.6735,229.1795) -- (178.6735,238.5857) --
        (176.9482,238.5857) -- cycle(174.4152,233.8695) .. controls
        (174.4152,235.0710) and (174.5165,235.9184) .. (174.7160,236.4093) .. controls
        (174.9188,236.9036) and (175.2500,237.1486) .. (175.7113,237.1486) .. controls
        (176.1726,237.1486) and (176.5038,236.9002) .. (176.7032,236.4059) .. controls
        (176.9060,235.9083) and (177.0073,235.0642) .. (177.0073,233.8695) .. controls
        (177.0073,232.6656) and (176.9060,231.8241) .. (176.7099,231.3399) .. controls
        (176.5097,230.8583) and (176.1760,230.6167) .. (175.7113,230.6167) .. controls
        (175.2432,230.6167) and (174.9095,230.8583) .. (174.7126,231.3399) .. controls
        (174.5132,231.8241) and (174.4152,232.6656) .. (174.4152,233.8695) --
        cycle(180.7646,238.5857) -- (180.7646,223.7241) -- (182.4890,223.7241) --
        (182.4890,238.5857) -- (180.7646,238.5857) -- cycle(189.8134,233.8957) ..
        controls (189.8134,235.1006) and (189.9114,235.9412) .. (190.1117,236.4253) ..
        controls (190.3077,236.9069) and (190.6414,237.1486) .. (191.1095,237.1486) ..
        controls (191.5742,237.1486) and (191.9079,236.9069) .. (192.1081,236.4253) ..
        controls (192.3041,235.9412) and (192.4055,235.1006) .. (192.4055,233.8957) ..
        controls (192.4055,232.6884) and (192.3042,231.8435) .. (192.1081,231.3594) ..
        controls (191.9079,230.8786) and (191.5742,230.6361) .. (191.1095,230.6361) ..
        controls (190.6414,230.6361) and (190.3077,230.8786) .. (190.1117,231.3594) ..
        controls (189.9114,231.8435) and (189.8134,232.6884) .. (189.8134,233.8957) --
        cycle(192.3464,238.5857) -- (192.3464,237.6656) .. controls
        (192.1107,238.0425) and (191.8395,238.3204) .. (191.5353,238.4936) .. controls
        (191.2337,238.6702) and (190.8839,238.7589) .. (190.4842,238.7589) .. controls
        (189.6563,238.7589) and (189.0445,238.3627) .. (188.6551,237.5744) .. controls
        (188.2656,236.7853) and (188.0695,235.5585) .. (188.0695,233.8957) .. controls
        (188.0695,232.2296) and (188.2656,230.9994) .. (188.6551,230.2103) .. controls
        (189.0445,229.4220) and (189.6563,229.0258) .. (190.4842,229.0258) .. controls
        (190.8906,229.0258) and (191.2438,229.1113) .. (191.5446,229.2843) .. controls
        (191.8496,229.4575) and (192.1174,229.7296) .. (192.3464,230.0996) --
        (192.3464,223.7241) -- (194.0717,223.7241) -- (194.0717,238.5857) --
        (192.3464,238.5857) -- cycle(197.2755,232.8514) -- (199.9099,232.8514) --
        (199.9099,232.6123) .. controls (199.9099,231.8367) and (199.8085,231.2808) ..
        (199.6023,230.9335) .. controls (199.3996,230.5905) and (199.0692,230.4165) ..
        (198.6172,230.4165) .. controls (198.1753,230.4165) and (197.8416,230.6226) ..
        (197.6160,231.0358) .. controls (197.3904,231.4472) and (197.2755,232.0530) ..
        (197.2755,232.8514) -- cycle(201.4848,235.4402) -- (201.4848,235.5651) ..
        controls (201.4848,236.5562) and (201.2355,237.3352) .. (200.7353,237.9047) ..
        controls (200.2377,238.4741) and (199.5567,238.7588) .. (198.6924,238.7588) ..
        controls (197.6388,238.7588) and (196.8666,238.3660) .. (196.3791,237.5836) ..
        controls (195.8916,236.8021) and (195.6457,235.5482) .. (195.6457,233.8297) ..
        controls (195.6457,232.2135) and (195.8916,231.0027) .. (196.3791,230.2043) ..
        controls (196.8666,229.4050) and (197.6059,229.0062) .. (198.5978,229.0062) ..
        controls (199.6522,229.0062) and (200.4143,229.3695) .. (200.8790,230.0961) ..
        controls (201.3471,230.8194) and (201.5794,232.0073) .. (201.5794,233.6565) --
        (201.5794,234.2032) -- (197.2755,234.2032) -- (197.2755,234.4811) .. controls
        (197.2755,235.4663) and (197.3870,236.1802) .. (197.6092,236.6255) .. controls
        (197.8357,237.0699) and (198.1888,237.2930) .. (198.6730,237.2930) .. controls
        (199.0625,237.2930) and (199.3607,237.1392) .. (199.5601,236.8308) .. controls
        (199.7629,236.5233) and (199.8710,236.0653) .. (199.8905,235.4502) --
        (201.4848,235.4412) -- cycle(214.8113,231.0679) .. controls
        (214.8273,231.3627) and (214.8442,231.6509) .. (214.8536,231.9322) .. controls
        (214.8643,232.2136) and (214.8672,232.4822) .. (214.8672,232.7374) .. controls
        (214.8672,234.7896) and (214.5334,236.3045) .. (213.8651,237.2863) .. controls
        (213.1977,238.2681) and (212.1703,238.7589) .. (210.7821,238.7589) .. controls
        (209.3517,238.7589) and (208.3150,238.2022) .. (207.6763,237.0903) .. controls
        (207.0384,235.9767) and (206.7173,234.1475) .. (206.7173,231.5951) .. controls
        (206.7173,229.0131) and (207.0384,227.1704) .. (207.6797,226.0644) .. controls
        (208.3243,224.9576) and (209.3787,224.4050) .. (210.8413,224.4050) .. controls
        (211.8754,224.4050) and (212.7102,224.6501) .. (213.3447,225.1376) .. controls
        (213.9767,225.6251) and (214.4118,226.3652) .. (214.6475,227.3571) --
        (212.9780,228.1614) .. controls (212.8445,227.4779) and (212.5986,226.9710) ..
        (212.2488,226.6364) .. controls (211.8982,226.3061) and (211.4335,226.1396) ..
        (210.8573,226.1396) .. controls (210.0394,226.1396) and (209.4632,226.5316) ..
        (209.1295,227.3140) .. controls (208.7924,228.0964) and (208.6259,229.5107) ..
        (208.6259,231.5554) .. controls (208.6259,233.5848) and (208.7924,234.9924) ..
        (209.1295,235.7875) .. controls (209.4632,236.5791) and (210.0394,236.9754) ..
        (210.8573,236.9754) .. controls (211.5873,236.9754) and (212.1339,236.6746) ..
        (212.5040,236.0756) .. controls (212.8707,235.4732) and (213.0532,234.5733) ..
        (213.0532,233.3787) .. controls (213.0532,233.1987) and (213.0532,233.0644) ..
        (213.0502,232.9731) .. controls (213.0462,232.8776) and (213.0395,232.7931) ..
        (213.0334,232.7180) -- (211.0310,232.7180) -- (211.0310,231.0679) --
        (214.8110,231.0679) -- cycle(217.9171,233.8501) .. controls
        (217.9171,235.0017) and (218.0320,235.8432) .. (218.2576,236.3763) .. controls
        (218.4865,236.9095) and (218.8431,237.1781) .. (219.3272,237.1781) .. controls
        (219.8215,237.1781) and (220.1848,236.9095) .. (220.4171,236.3730) .. controls
        (220.6495,235.8365) and (220.7678,234.9949) .. (220.7678,233.8501) .. controls
        (220.7678,232.7112) and (220.6495,231.8731) .. (220.4171,231.3366) .. controls
        (220.1848,230.8000) and (219.8215,230.5314) .. (219.3272,230.5314) .. controls
        (218.8431,230.5314) and (218.4865,230.8000) .. (218.2576,231.3332) .. controls
        (218.0320,231.8663) and (217.9171,232.7044) .. (217.9171,233.8501) --
        cycle(216.1631,233.8701) .. controls (216.1631,232.2826) and
        (216.4343,231.0752) .. (216.9742,230.2472) .. controls (217.5149,229.4192) and
        (218.2965,229.0069) .. (219.3272,229.0069) .. controls (220.3588,229.0069) and
        (221.1404,229.4192) .. (221.6803,230.2472) .. controls (222.2210,231.0752) and
        (222.4922,232.2826) .. (222.4922,233.8701) .. controls (222.4922,235.4670) and
        (222.2210,236.6811) .. (221.6803,237.5125) .. controls (221.1404,238.3438) and
        (220.3588,238.7595) .. (219.3272,238.7595) .. controls (218.2965,238.7595) and
        (217.5149,238.3438) .. (216.9742,237.5125) .. controls (216.4343,236.6811) and
        (216.1631,235.4670) .. (216.1631,233.8701) -- cycle(223.9556,226.3725) ..
        controls (223.9556,226.0582) and (224.0604,225.7929) .. (224.2732,225.5766) ..
        controls (224.4819,225.3578) and (224.7438,225.2497) .. (225.0581,225.2497) ..
        controls (225.3657,225.2497) and (225.6242,225.3579) .. (225.8338,225.5766) ..
        controls (226.0467,225.7929) and (226.1514,226.0582) .. (226.1514,226.3725) ..
        controls (226.1514,226.6801) and (226.0433,226.9386) .. (225.8304,227.1541) ..
        controls (225.6149,227.3670) and (225.3589,227.4751) .. (225.0581,227.4751) ..
        controls (224.7438,227.4751) and (224.4819,227.3703) .. (224.2732,227.1574) ..
        controls (224.0603,226.9479) and (223.9556,226.6860) .. (223.9556,226.3725) --
        cycle(224.1972,238.5863) -- (224.1972,229.1801) -- (225.9225,229.1801) --
        (225.9225,238.5863) -- (224.1972,238.5863) -- cycle(231.9930,238.5863) --
        (231.9930,237.6662) .. controls (231.7573,238.0431) and (231.4861,238.3210) ..
        (231.1819,238.4942) .. controls (230.8803,238.6708) and (230.5305,238.7595) ..
        (230.1309,238.7595) .. controls (229.3392,238.7595) and (228.7402,238.3472) ..
        (228.3312,237.5226) .. controls (227.9223,236.6980) and (227.7162,235.4805) ..
        (227.7162,233.8701) .. controls (227.7162,232.2699) and (227.9189,231.0617) ..
        (228.3245,230.2405) .. controls (228.7300,229.4192) and (229.3324,229.0069) ..
        (230.1309,229.0069) .. controls (230.5373,229.0069) and (230.8904,229.0924) ..
        (231.1912,229.2655) .. controls (231.4954,229.4387) and (231.7641,229.7107) ..
        (231.9930,230.0799) -- (231.9930,229.1801) -- (233.7183,229.1801) --
        (233.7183,238.5863) -- (231.9930,238.5863) -- cycle(229.4600,233.8701) ..
        controls (229.4600,235.0716) and (229.5614,235.9190) .. (229.7617,236.4099) ..
        controls (229.9644,236.9041) and (230.2948,237.1492) .. (230.7561,237.1492) ..
        controls (231.2174,237.1492) and (231.5486,236.9008) .. (231.7480,236.4065) ..
        controls (231.9508,235.9089) and (232.0522,235.0648) .. (232.0522,233.8701) ..
        controls (232.0522,232.6662) and (231.9508,231.8246) .. (231.7547,231.3405) ..
        controls (231.5545,230.8589) and (231.2208,230.6173) .. (230.7561,230.6173) ..
        controls (230.2880,230.6173) and (229.9543,230.8589) .. (229.7583,231.3405) ..
        controls (229.5580,231.8246) and (229.4600,232.6662) .. (229.4600,233.8701) --
        cycle(230.0430,227.9043) -- (231.6137,224.5856) -- (233.3220,224.5856) --
        (231.0510,227.9043) -- (230.0430,227.9043) -- cycle(235.2535,236.6025) ..
        controls (235.4951,236.8120) and (235.7376,236.9726) .. (235.9767,237.0773) ..
        controls (236.2158,237.1821) and (236.4608,237.2345) .. (236.7092,237.2345) ..
        controls (237.0725,237.2345) and (237.3708,237.1263) .. (237.6031,236.9076) ..
        controls (237.8321,236.6913) and (237.9470,236.4133) .. (237.9470,236.0728) ..
        controls (237.9470,235.6698) and (237.6293,235.1696) .. (236.9973,234.5672) ..
        controls (236.9153,234.4852) and (236.8503,234.4270) .. (236.8081,234.3872) ..
        controls (236.1921,233.8051) and (235.7798,233.3235) .. (235.5703,232.9374) ..
        controls (235.3582,232.5546) and (235.2535,232.1322) .. (235.2535,231.6743) ..
        controls (235.2535,230.8792) and (235.4951,230.2337) .. (235.9834,229.7369) ..
        controls (236.4676,229.2359) and (237.0987,228.9875) .. (237.8709,228.9875) ..
        controls (238.1269,228.9875) and (238.3787,229.0196) .. (238.6237,229.0820) ..
        controls (238.8696,229.1471) and (239.1155,229.2426) .. (239.3571,229.3701) --
        (239.3571,231.1435) .. controls (239.1704,230.9281) and (238.9676,230.7676) ..
        (238.7488,230.6662) .. controls (238.5291,230.5648) and (238.2740,230.5124) ..
        (237.9858,230.5124) .. controls (237.6656,230.5124) and (237.4037,230.6137) ..
        (237.1942,230.8199) .. controls (236.9880,231.0227) and (236.8833,231.2812) ..
        (236.8833,231.5955) .. controls (236.8833,232.0112) and (237.1874,232.4953) ..
        (237.7932,233.0521) .. controls (237.9140,233.1628) and (238.0053,233.2447) ..
        (238.0610,233.3039) .. controls (238.6305,233.8277) and (239.0267,234.2983) ..
        (239.2456,234.7208) .. controls (239.4653,235.1432) and (239.5768,235.6147) ..
        (239.5768,236.1309) .. controls (239.5768,236.9302) and (239.3343,237.5681) ..
        (238.8468,238.0463) .. controls (238.3627,238.5203) and (237.7146,238.7594) ..
        (236.9027,238.7594) .. controls (236.6408,238.7594) and (236.3729,238.7298) ..
        (236.0975,238.6739) .. controls (235.8229,238.6155) and (235.5407,238.5303) ..
        (235.2535,238.4128) -- (235.2535,236.6022) -- cycle(55.9341,271.2871) --
        (55.9341,246.4219) -- (59.2884,246.4219) -- (59.2884,271.2871) --
        (55.9341,271.2871) -- cycle(63.4807,271.2871) -- (63.4807,254.5785) --
        (66.5097,254.5785) -- (66.5097,256.2471) .. controls (66.9161,255.6363) and
        (67.4162,255.1766) .. (68.0034,254.8691) .. controls (68.5847,254.5607) and
        (69.2649,254.4095) .. (70.0379,254.4095) .. controls (71.2647,254.4095) and
        (72.1781,254.7525) .. (72.7712,255.4326) .. controls (73.3694,256.1128) and
        (73.6659,257.1537) .. (73.6659,258.5495) -- (73.6659,271.2871) --
        (70.5846,271.2871) -- (70.5846,260.0660) .. controls (70.5846,258.9330) and
        (70.4393,258.1600) .. (70.1427,257.7468) .. controls (69.8461,257.3396) and
        (69.3350,257.1360) .. (68.6084,257.1360) .. controls (67.9282,257.1360) and
        (67.4103,257.3514) .. (67.0614,257.7755) .. controls (66.7184,258.2005) and
        (66.5443,258.8342) .. (66.5443,259.6715) -- (66.5443,271.2871) --
        (63.4807,271.2871) -- cycle(76.4448,267.7639) .. controls (76.8757,268.1365)
        and (77.3057,268.4212) .. (77.7298,268.6071) .. controls (78.1540,268.7929)
        and (78.5908,268.8859) .. (79.0318,268.8859) .. controls (79.6773,268.8859)
        and (80.2062,268.6941) .. (80.6194,268.3046) .. controls (81.0266,267.9210)
        and (81.2294,267.4268) .. (81.2294,266.8218) .. controls (81.2294,266.1070)
        and (80.6658,265.2174) .. (79.5438,264.1477) .. controls (79.3985,264.0023)
        and (79.2819,263.8976) .. (79.2067,263.8284) .. controls (78.1134,262.7934)
        and (77.3809,261.9383) .. (77.0092,261.2523) .. controls (76.6315,260.5721)
        and (76.4448,259.8227) .. (76.4448,259.0082) .. controls (76.4448,257.5956)
        and (76.8757,256.4507) .. (77.7417,255.5670) .. controls (78.6018,254.6773)
        and (79.7238,254.2354) .. (81.0959,254.2354) .. controls (81.5496,254.2354)
        and (81.9974,254.2938) .. (82.4334,254.4036) .. controls (82.8693,254.5202)
        and (83.3053,254.6884) .. (83.7362,254.9157) -- (83.7362,258.0663) .. controls
        (83.4041,257.6827) and (83.0442,257.3980) .. (82.6547,257.2180) .. controls
        (82.2652,257.0372) and (81.8107,256.9442) .. (81.2995,256.9442) .. controls
        (80.7301,256.9442) and (80.2645,257.1250) .. (79.8928,257.4909) .. controls
        (79.5261,257.8517) and (79.3402,258.3104) .. (79.3402,258.8689) .. controls
        (79.3402,259.6073) and (79.8809,260.4674) .. (80.9565,261.4560) .. controls
        (81.1719,261.6536) and (81.3342,261.7990) .. (81.4330,261.9038) .. controls
        (82.4452,262.8340) and (83.1490,263.6713) .. (83.5385,264.4207) .. controls
        (83.9271,265.1710) and (84.1257,266.0083) .. (84.1257,266.9267) .. controls
        (84.1257,268.3452) and (83.6948,269.4791) .. (82.8288,270.3282) .. controls
        (81.9687,271.1714) and (80.8171,271.5955) .. (79.3757,271.5955) .. controls
        (78.9102,271.5955) and (78.4336,271.5431) .. (77.9453,271.4443) .. controls
        (77.4569,271.3395) and (76.9568,271.1883) .. (76.4448,270.9788) --
        (76.4448,267.7640) -- cycle(87.0904,271.2871) -- (87.0904,256.8453) --
        (85.4218,256.8453) -- (85.4218,254.5785) -- (87.0904,254.5785) --
        (87.0904,250.0490) -- (90.1540,250.0490) -- (90.1540,254.5785) --
        (92.4563,254.5785) -- (92.4563,256.8453) -- (90.1540,256.8453) --
        (90.1540,271.2871) -- (87.0904,271.2871) -- cycle(94.1715,249.5902) ..
        controls (94.1715,249.0317) and (94.3573,248.5611) .. (94.7359,248.1775) ..
        controls (95.1076,247.7881) and (95.5731,247.5963) .. (96.1308,247.5963) ..
        controls (96.6774,247.5963) and (97.1370,247.7881) .. (97.5088,248.1775) ..
        controls (97.8865,248.5611) and (98.0732,249.0317) .. (98.0732,249.5902) ..
        controls (98.0732,250.1360) and (97.8814,250.5956) .. (97.5029,250.9792) ..
        controls (97.1193,251.3577) and (96.6656,251.5495) .. (96.1308,251.5495) ..
        controls (95.5731,251.5495) and (95.1076,251.3637) .. (94.7359,250.9851) ..
        controls (94.3573,250.6134) and (94.1715,250.1478) .. (94.1715,249.5902) --
        cycle(94.6024,271.2871) -- (94.6024,254.5785) -- (97.6660,254.5785) --
        (97.6660,271.2871) -- (94.6024,271.2871) -- cycle(101.7181,271.2871) --
        (101.7181,256.8453) -- (100.0494,256.8453) -- (100.0494,254.5785) --
        (101.7181,254.5785) -- (101.7181,250.0490) -- (104.7825,250.0490) --
        (104.7825,254.5785) -- (107.0848,254.5785) -- (107.0848,256.8453) --
        (104.7825,256.8453) -- (104.7825,271.2871) -- (101.7181,271.2871) --
        cycle(109.1252,266.3630) -- (109.1252,254.5785) -- (112.1888,254.5785) --
        (112.1888,266.5371) .. controls (112.1888,267.3051) and (112.3578,267.8914) ..
        (112.7008,268.2877) .. controls (113.0439,268.6882) and (113.5500,268.8859) ..
        (114.2183,268.8859) .. controls (114.8756,268.8859) and (115.3749,268.6881) ..
        (115.7179,268.2877) .. controls (116.0610,267.8914) and (116.2300,267.3051) ..
        (116.2300,266.5371) -- (116.2300,254.5785) -- (119.3459,254.5785) --
        (119.3459,266.3630) .. controls (119.3459,268.2057) and (118.9387,269.5373) ..
        (118.1310,270.3628) .. controls (117.3173,271.1823) and (116.0145,271.5955) ..
        (114.2183,271.5955) .. controls (112.4220,271.5955) and (111.1251,271.1823) ..
        (110.3284,270.3628) .. controls (109.5266,269.5373) and (109.1252,268.2057) ..
        (109.1252,266.3630) -- cycle(123.2823,271.2871) -- (123.2823,256.8453) --
        (121.6136,256.8453) -- (121.6136,254.5785) -- (123.2823,254.5785) --
        (123.2823,250.0490) -- (126.3459,250.0490) -- (126.3459,254.5785) --
        (128.6482,254.5785) -- (128.6482,256.8453) -- (126.3459,256.8453) --
        (126.3459,271.2871) -- (123.2823,271.2871) -- cycle(132.9909,262.8745) ..
        controls (132.9909,264.9208) and (133.1946,266.4154) .. (133.5959,267.3625) ..
        controls (134.0031,268.3105) and (134.6368,268.7870) .. (135.4969,268.7870) ..
        controls (136.3747,268.7870) and (137.0202,268.3105) .. (137.4326,267.3566) ..
        controls (137.8457,266.4036) and (138.0552,264.9098) .. (138.0552,262.8745) ..
        controls (138.0552,260.8518) and (137.8457,259.3631) .. (137.4326,258.4092) ..
        controls (137.0202,257.4562) and (136.3747,256.9796) .. (135.4969,256.9796) ..
        controls (134.6368,256.9796) and (134.0031,257.4562) .. (133.5959,258.4033) ..
        controls (133.1946,259.3513) and (132.9909,260.8400) .. (132.9909,262.8745) --
        cycle(129.8750,262.9092) .. controls (129.8750,260.0897) and
        (130.3574,257.9446) .. (131.3172,256.4736) .. controls (132.2762,255.0026) and
        (133.6660,254.2701) .. (135.4969,254.2701) .. controls (137.3286,254.2701) and
        (138.7176,255.0026) .. (139.6774,256.4736) .. controls (140.6364,257.9446) and
        (141.1197,260.0897) .. (141.1197,262.9092) .. controls (141.1197,265.7463) and
        (140.6364,267.9033) .. (139.6774,269.3802) .. controls (138.7176,270.8571) and
        (137.3286,271.5955) .. (135.4969,271.5955) .. controls (133.6660,271.5955) and
        (132.2762,270.8571) .. (131.3172,269.3802) .. controls (130.3574,267.9033) and
        (129.8750,265.7463) .. (129.8750,262.9092) -- cycle(153.2413,262.9556) ..
        controls (153.2413,265.0957) and (153.4154,266.5894) .. (153.7702,267.4495) ..
        controls (154.1192,268.3046) and (154.7123,268.7346) .. (155.5437,268.7346) ..
        controls (156.3691,268.7346) and (156.9614,268.3046) .. (157.3171,267.4495) ..
        controls (157.6652,266.5894) and (157.8460,265.0957) .. (157.8460,262.9556) ..
        controls (157.8460,260.8104) and (157.6652,259.3107) .. (157.3171,258.4497) ..
        controls (156.9614,257.5956) and (156.3691,257.1655) .. (155.5437,257.1655) ..
        controls (154.7123,257.1655) and (154.1192,257.5956) .. (153.7702,258.4497) ..
        controls (153.4154,259.3107) and (153.2413,260.8104) .. (153.2413,262.9556) --
        cycle(157.7412,271.2871) -- (157.7412,269.6539) .. controls
        (157.3222,270.3222) and (156.8397,270.8164) .. (156.2990,271.1240) .. controls
        (155.7642,271.4383) and (155.1424,271.5954) .. (154.4326,271.5954) .. controls
        (152.9617,271.5954) and (151.8752,270.8916) .. (151.1832,269.4908) .. controls
        (150.4912,268.0891) and (150.1423,265.9093) .. (150.1423,262.9556) .. controls
        (150.1423,259.9967) and (150.4912,257.8110) .. (151.1832,256.4093) .. controls
        (151.8752,255.0085) and (152.9617,254.3047) .. (154.4326,254.3047) .. controls
        (155.1542,254.3047) and (155.7819,254.4559) .. (156.3168,254.7643) .. controls
        (156.8575,255.0727) and (157.3340,255.5551) .. (157.7412,256.2116) --
        (157.7412,244.8867) -- (160.8048,244.8867) -- (160.8048,271.2871) --
        (157.7412,271.2871) -- cycle(166.4969,261.1010) -- (171.1767,261.1010) --
        (171.1767,260.6769) .. controls (171.1767,259.2989) and (170.9968,258.3103) ..
        (170.6301,257.6944) .. controls (170.2702,257.0844) and (169.6830,256.7760) ..
        (168.8803,256.7760) .. controls (168.0954,256.7760) and (167.5023,257.1418) ..
        (167.1010,257.8744) .. controls (166.7005,258.6069) and (166.4969,259.6824) ..
        (166.4969,261.1010) -- cycle(173.9733,265.6998) -- (173.9733,265.9211) ..
        controls (173.9733,267.6827) and (173.5315,269.0658) .. (172.6418,270.0780) ..
        controls (171.7580,271.0893) and (170.5490,271.5954) .. (169.0138,271.5954) ..
        controls (167.1424,271.5954) and (165.7703,270.8976) .. (164.9034,269.5077) ..
        controls (164.0374,268.1187) and (163.6014,265.8924) .. (163.6014,262.8398) ..
        controls (163.6014,259.9672) and (164.0374,257.8169) .. (164.9034,256.3975) ..
        controls (165.7703,254.9798) and (167.0841,254.2700) .. (168.8457,254.2700) ..
        controls (170.7180,254.2700) and (172.0723,254.9156) .. (172.8978,256.2057) ..
        controls (173.7292,257.4908) and (174.1423,259.6013) .. (174.1423,262.5314) --
        (174.1423,263.5022) -- (166.4969,263.5022) -- (166.4969,263.9965) .. controls
        (166.4969,265.7462) and (166.6946,267.0136) .. (167.0900,267.8044) .. controls
        (167.4913,268.5952) and (168.1191,268.9906) .. (168.9792,268.9906) .. controls
        (169.6711,268.9906) and (170.2000,268.7177) .. (170.5549,268.1711) .. controls
        (170.9148,267.6244) and (171.1075,266.8108) .. (171.1421,265.7175) --
        (173.9733,265.6995) -- cycle(184.1416,271.2871) -- (184.1416,246.4218) --
        (194.3277,246.4218) -- (194.3277,249.4212) -- (187.4967,249.4212) --
        (187.4967,256.8453) -- (193.7641,256.8453) -- (193.7641,259.8109) --
        (187.4967,259.8109) -- (187.4967,271.2871) -- (184.1416,271.2871) --
        cycle(197.2586,271.2871) -- (197.2586,254.5784) -- (200.3222,254.5784) --
        (200.3222,271.2871) -- (197.2586,271.2871) -- cycle(196.7643,252.3107) --
        (199.5542,246.4159) -- (202.5890,246.4159) -- (198.5547,252.3107) --
        (196.7643,252.3107) -- cycle(203.2523,267.7638) .. controls
        (203.6823,268.1364) and (204.1124,268.4212) .. (204.5374,268.6071) .. controls
        (204.9615,268.7929) and (205.3975,268.8859) .. (205.8393,268.8859) .. controls
        (206.4849,268.8859) and (207.0138,268.6941) .. (207.4269,268.3046) .. controls
        (207.8333,267.9210) and (208.0369,267.4267) .. (208.0369,266.8218) .. controls
        (208.0369,266.1070) and (207.4734,265.2173) .. (206.3505,264.1477) .. controls
        (206.2060,264.0023) and (206.0894,263.8976) .. (206.0142,263.8283) .. controls
        (204.9209,262.7933) and (204.1884,261.9383) .. (203.8158,261.2523) .. controls
        (203.4382,260.5721) and (203.2523,259.8227) .. (203.2523,259.0082) .. controls
        (203.2523,257.5956) and (203.6823,256.4507) .. (204.5484,255.5670) .. controls
        (205.4093,254.6773) and (206.5313,254.2354) .. (207.9034,254.2354) .. controls
        (208.3563,254.2354) and (208.8041,254.2938) .. (209.2409,254.4036) .. controls
        (209.6769,254.5202) and (210.1128,254.6884) .. (210.5429,254.9156) --
        (210.5429,258.0662) .. controls (210.2117,257.6827) and (209.8509,257.3979) ..
        (209.4614,257.2180) .. controls (209.0719,257.0372) and (208.6182,256.9442) ..
        (208.1070,256.9442) .. controls (207.5367,256.9442) and (207.0721,257.1250) ..
        (206.7003,257.4909) .. controls (206.3336,257.8516) and (206.1477,258.3104) ..
        (206.1477,258.8689) .. controls (206.1477,259.6073) and (206.6885,260.4674) ..
        (207.7640,261.4560) .. controls (207.9786,261.6536) and (208.1417,261.7990) ..
        (208.2405,261.9037) .. controls (209.2519,262.8340) and (209.9557,263.6713) ..
        (210.3452,264.4207) .. controls (210.7347,265.1709) and (210.9324,266.0082) ..
        (210.9324,266.9266) .. controls (210.9324,268.3452) and (210.5023,269.4791) ..
        (209.6355,270.3282) .. controls (208.7754,271.1714) and (207.6246,271.5955) ..
        (206.1824,271.5955) .. controls (205.7177,271.5955) and (205.2403,271.5431) ..
        (204.7520,271.4443) .. controls (204.2636,271.3395) and (203.7635,271.1883) ..
        (203.2523,270.9788) -- (203.2523,267.7640) -- cycle(213.3336,249.5902) ..
        controls (213.3336,249.0317) and (213.5194,248.5611) .. (213.8979,248.1775) ..
        controls (214.2697,247.7880) and (214.7352,247.5962) .. (215.2929,247.5962) ..
        controls (215.8395,247.5962) and (216.2991,247.7880) .. (216.6709,248.1775) ..
        controls (217.0485,248.5611) and (217.2344,249.0317) .. (217.2344,249.5902) ..
        controls (217.2344,250.1360) and (217.0427,250.5956) .. (216.6650,250.9792) ..
        controls (216.2814,251.3577) and (215.8277,251.5495) .. (215.2929,251.5495) ..
        controls (214.7352,251.5495) and (214.2697,251.3637) .. (213.8979,250.9851) ..
        controls (213.5194,250.6134) and (213.3336,250.1478) .. (213.3336,249.5902) --
        cycle(213.7645,271.2871) -- (213.7645,254.5784) -- (216.8280,254.5784) --
        (216.8280,271.2871) -- (213.7645,271.2871) -- cycle(227.2346,271.0192) ..
        controls (226.8045,271.2228) and (226.3863,271.3741) .. (225.9732,271.4788) ..
        controls (225.5659,271.5776) and (225.1477,271.6300) .. (224.7168,271.6300) ..
        controls (223.0372,271.6300) and (221.7926,270.9262) .. (220.9967,269.5254) ..
        controls (220.1941,268.1246) and (219.7928,265.9321) .. (219.7928,262.9555) ..
        controls (219.7928,260.1074) and (220.1941,257.9445) .. (221.0027,256.4735) ..
        controls (221.8104,255.0025) and (222.9907,254.2700) .. (224.5428,254.2700) ..
        controls (225.0193,254.2700) and (225.4789,254.3224) .. (225.9208,254.4330) ..
        controls (226.3686,254.5370) and (226.8045,254.7000) .. (227.2346,254.9155) --
        (227.2346,257.8633) .. controls (226.9499,257.5895) and (226.6710,257.3918) ..
        (226.3973,257.2643) .. controls (226.1303,257.1417) and (225.8447,257.0785) ..
        (225.5482,257.0785) .. controls (224.6653,257.0785) and (224.0020,257.5778) ..
        (223.5661,258.5781) .. controls (223.1301,259.5777) and (222.9096,261.0841) ..
        (222.9096,263.0958) .. controls (222.9096,264.9503) and (223.1242,266.3275) ..
        (223.5483,267.2349) .. controls (223.9733,268.1474) and (224.6188,268.6011) ..
        (225.4789,268.6011) .. controls (225.7873,268.6011) and (226.0830,268.5427) ..
        (226.3745,268.4211) .. controls (226.6651,268.3046) and (226.9499,268.1186) ..
        (227.2346,267.8686) -- (227.2346,271.0192) -- cycle(236.5022,271.2871) --
        (236.5022,269.6539) .. controls (236.0832,270.3222) and (235.6007,270.8164) ..
        (235.0600,271.1240) .. controls (234.5252,271.4383) and (233.9033,271.5954) ..
        (233.1936,271.5954) .. controls (231.7869,271.5954) and (230.7231,270.8629) ..
        (229.9965,269.3979) .. controls (229.2699,267.9328) and (228.9033,265.7699) ..
        (228.9033,262.9091) .. controls (228.9033,260.0660) and (229.2640,257.9208) ..
        (229.9847,256.4617) .. controls (230.7054,255.0026) and (231.7750,254.2701) ..
        (233.1936,254.2701) .. controls (233.9152,254.2701) and (234.5429,254.4213) ..
        (235.0777,254.7297) .. controls (235.6185,255.0372) and (236.0950,255.5197) ..
        (236.5022,256.1770) -- (236.5022,254.5784) -- (239.5658,254.5784) --
        (239.5658,271.2871) -- (236.5022,271.2871) -- cycle(232.0015,262.9091) ..
        controls (232.0015,265.0433) and (232.1823,266.5489) .. (232.5371,267.4208) ..
        controls (232.8971,268.2987) and (233.4851,268.7346) .. (234.3047,268.7346) ..
        controls (235.1242,268.7346) and (235.7114,268.2928) .. (236.0662,267.4149) ..
        controls (236.4262,266.5311) and (236.6070,265.0315) .. (236.6070,262.9091) ..
        controls (236.6070,260.7698) and (236.4262,259.2760) .. (236.0781,258.4151) ..
        controls (235.7232,257.5609) and (235.1301,257.1309) .. (234.3047,257.1309) ..
        controls (233.4733,257.1309) and (232.8802,257.5609) .. (232.5312,258.4151) ..
        controls (232.1764,259.2760) and (232.0015,260.7698) .. (232.0015,262.9091) --
        cycle;
    \end{tikzpicture}
    }
\end{center}
}
\endinput