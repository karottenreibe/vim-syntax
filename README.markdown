What is this?
=============

A simple (!) extension to the syntax gem, that allows you to
highlight vim syntax.

How do I use it?
================

First:
    
    gem install karottenreibe-vim-syntax --source http://gems.github.com

Then:

    require 'vim-syntax'
    require 'syntax/convertors/html'

    convertor = Syntax::Convertors::HTML.for_syntax "vim"
    puts convertor.convert( "let mapleader=','" )

