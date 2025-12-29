#!/bin/sh

case "$1" in
	*.tar*) tar tf "$1";;
	*.zip) unzip -l "$1";;
	*.pdf) pdftotex -layout -nopgbrk "$1" - ;;
	*.docx) pandoc -f docx -t plain "$1" ;;
	*) bat --color=always --style=plain "$1" 2>/dev/null || cat "$1" ;;
esac

