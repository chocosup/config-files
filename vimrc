" Fichier .vimrc, version 2.3, check=148704218ac7e5c2aa1ef60fc3719a7a

" Pour que la touche backspace fonctionne comme il faut.
set backspace=indent,eol,start

" Le BackSpace fonctionne aussi en mode normal.
" map <BS> X

" Sur les connexions lentes, le timeout est une plaie
set notimeout

" On lit les définitions de séquences d'échappement chez gourous
if filereadable($SKELDIR . "/keyboard/" . $TERM . ".vim")
  exe "source " . $SKELDIR . "/keyboard/" . $TERM . ".vim"
endif

" Les Control-flèches
map <S-Up> {
map <S-Down> }
map! <S-Up> <C-O>{
map! <S-Down> <C-O>}

" La touche Q fonctionne comme dans vim 4
nmap Q gqap
vmap Q gq

" La touche Y fait quelque chose de raisonnable
" nmap Y y$

" Pour activer les digraphes, décommentez la ligne suivante. Si les digraphes
" sont activés, '<backspace>e écrit un é; c'est énervant à la longue, donc on
" désactive. Vous pouvez toujours composer un digraphe en utilisant Control-K
" (si vous n'avez pas de touche compose).
set nodigraph             

" Les touches qui font passer à la ligne suivante/précédente. backspace (b),
" espace (s), flèches (<,>,[,]).
set whichwrap=b,s,<,>,[,]

" En français, on ne met qu'une espace simple en fin de phrase.
set nojoinspaces

" Pour une complétion automatique des noms de fichiers
if has("wildmenu")
   set wildmenu
endif

" La façon dont la complétion présente les choix.
set wildmode=list:longest,full

" On veut pouvoir rendre invisible un buffer
set hidden

" La complétion automatique ignore les fichiers suivants.
set suffixes=.bak.o.aux.dvi.log.toc.tof

" Pour voir tous les matchs d'une recherche
set hlsearch

" Pour que les matchs soient affichés pendant que vous tapez le mot recherché
set incsearch

" On ignore la casse des caractères dans les recherches de chaînes en
" minuscules; par contre, dès qu'une lettre est en majuscule, on tient compte
" de la casse de toute la chaîne.
set ignorecase
set smartcase

" Pour ne pas se faire bipper tout le temps.
set visualbell

" Pour éviter de trop ralentir en faisant défiler le texte.
set lazyredraw

" Pour garder d'une ligne à l'autre l'indentation d'un paragraphe,
" décommentez la ligne suivante.
" set autoindent

" La taille d'une ligne, pour la frappe au kilomètre.
set textwidth=73

" La taille de l'indentation. Ne pas confondre avec la taille de la
" tabulation (toujours 8 caractères sous Unix- sinon vous aurez des
" ennuis), qui est contrôlée par la variable 'tabstop' (que l'on laisse à
" sa valeur par défaut, qui est très bien).
set shiftwidth=4

" Pour que l'indentation ajuste sur un multiple de 'shiftwidth', décommenter
" la ligne suivante
set shiftround

" Les options de formatage. Pour certains types de fichiers (sources de
" programmes), on mettra une valeur différente plus bas.
set formatoptions=tcq2

" Pour que vim garde une copie de sauvegarde des fichiers modifiés. Le nom du
" fichier sauvegardé est le nom du fichier, avec un tilde à la fin.
set backup

" On peut décider que vim garde ses copies de sauvegarde et tous ses
" fichiers temporaires dans un répertoire .backup à part. Si vous voulez
" décommenter la suite, n'oubliez pas de vérifier l'existence de ce
" répertoire.
" set backupdir=$HOME/.vim/backup,.
" set directory=$HOME/.vim/backup,.

" vim peut garder des informations (historique des commandes, marques,
" tags) d'une session à l'autre. Si ça vous perturbe, il suffit de
" décommenter la ligne ci-dessous.
" set viminfo=

" On affiche en permanence les numéros de ligne et de colonne.
set ruler

" Quand on tape un ), vim montre furtivement le ( correspondant.
set showmatch

" Quand on tape une commande complexe en mode normal, vim affiche ce que l'on
" a déjà tapé
set showcmd

" Pour avoir des messages de vim qui tiennent sur une seule ligne, ce
" qui évite d'avoir à presser «Enter» pour voir les messages suivants.
set shortmess=filnrxoOt


" Les autocommandes
"""""""""""""""""""
" C'est ce qui permet un comportement différent suivant le type de fichiers

" On commence par enlever toutes les autocommandes avant de les définir
" (pour le cas où ce fichier serait lu plusieurs fois.) 
autocmd!

" Options de formatage des fichiers pour le source C.
autocmd FileType c,cpp set fo=croq cin com=sr:/*,mb:*,el:*/,://
" autocmd BufRead,BufNewFile * set formatoptions=tcq2 nocindent

" Pas de backup des fichiers temporaires de mail faits par mutt dans /tmp:
autocmd BufNewFile,BufRead mutt*[0-9] set nobk nowb

" Idem pour flrn et ses .article :
autocmd BufRead,BufNewFile .article.* set ft=mail nobk


" Syntax highlight
""""""""""""""""""
" C'est ce qui colore les fichiers. Commentez la ligne suivante pour
" désactiver.
syntax enable

" On prend la coloration par défaut pour arrière-plan somble de vim
set background=dark

" Voici des exemples si vous voulez personnaliser la coloration.
" Ces couleurs-ci sont utilisées par le syntax highlight selon le type de
" fichier que vous éditez (TeX, mail, ...).
" highlight Comment     term=none      ctermfg=darkCyan cterm=none
" highlight Constant    term=underline ctermfg=Blue     cterm=none
" highlight Identifier  term=none      ctermfg=Green    cterm=none
" highlight Statement   term=bold      ctermfg=Red      cterm=none
" highlight Operator    term=none      ctermfg=darkGray cterm=bold
" highlight link Delimiter Operator  
" highlight PreProc     term=underline ctermfg=Magenta  cterm=none
" highlight Type        term=bold      ctermfg=Brown    cterm=none
" highlight Special     term=bold      ctermfg=Blue     cterm=bold
" highlight Search      term=reverse   cterm=reverse
" highlight IncSearch   term=reverse   ctermfg=Blue     ctermbg=White
" highlight link SpecialChar Special
" highlight Error       term=reverse   ctermfg=White    ctermbg=Red   cterm=none
" highlight Todo        term=standout  ctermfg=White    ctermbg=Green cterm=bold 
" Si on n'aime pas les highlight des nombres.
" highlight link Number      NONE

" Pour les lignes "foldées" (c'est-à-dire plusieurs lignes de texte,
" visuellement condensées en une seule que l'on peut dérouler).
" highlight Folded      term=standout  ctermfg=White   ctermbg=Blue cterm=bold

" Pour les diffs (commande vimdiff).
" highlight DiffAdd     term=bold      ctermfg=Green   ctermbg=none cterm=bold
" highlight DiffDelete  term=bold      ctermfg=Red     ctermbg=none cterm=bold
" highlight DiffChange  term=bold      ctermfg=Cyan    ctermbg=none
" highlight DiffText    term=standout  ctermfg=White   ctermbg=Cyan cterm=bold


" On active le chargement automatique de plugins selon le type de fichier.
" Mettez vos préférences dans $HOME/.vim/ftplugin/syntaxe.vim, où syntaxe
" est le type de fichier (c, mail, perl, sh, html...).
filetype plugin on

" Pour activer l'indentation spécifique au type de fichier, décommenter la
" ligne suivante.
" filetype indent on

set nu
set ai
" set background=light
set backupdir=~/.vim/backup
