# jaskeleton

just another skeleton plugin for vim!

[![License: MIT](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://opensource.org/licenses/MIT)

## toc

<!-- vim-markdown-toc GFM -->

* [installation](#installation)
* [configuration](#configuration)
* [todo](#todo)

<!-- vim-markdown-toc -->

## installation

using [vim-plug](https://github.com/junegunn/vim-plug), add to your `vimrc`
file:

```vim
Plug 'camiloariza/vim-jaskeleton'
```

another plugin manager ([vundle](https://github.com/gmarik/vundle),
[neobundle](https://github.com/Shougo/neobundle.vim),
[pathogen](https://github.com/tpope/vim-pathogen)) can be used too!

## configuration

the variables `jaskeleton_user` and `jaskeleton_email` must be set in the
`vimrc` file. For example,

```vim
let g:jaskeleton_user = 'camilo ariza'
let g:jaskeleton_email = 'camilo.ariza@protonmail.com'
```

the default date format is defined as `%a %d %b %Y %H:%M:%S %z`, i.e.  `Sat 18
Apr 2020 22:14:01 -0300`. The date format can be defined by setting the global
variable `jaskeleton_date_fmt`. For example,

```vim
let g:jaskeleton_date_fmt = '%Y/%m/%d'
```

setting `jaskeleton_date_fmt` to `'%Y/%m/%d'` will format the date as
`2020/04/18`.

## todo

- [ ] get modified date tag from template
- [ ] disable plugin command
- [ ] documentation
  - [ ] use case animations
  - [ ] list similar plugins
