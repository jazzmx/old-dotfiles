#!/bin/bash
# Terminal file preview

path="$1"
[ -d "$1" ] && { tree $1; exit 1; }

# Highlight settings
HIGHLIGHT_SIZE_MAX=262143  # 256KiB
HIGHLIGHT_TABWIDTH=8
HIGHLIGHT_STYLE='pablo'
BAT_THEME="--theme=gruvbox"

handle_extension() {
   [ "$1" ] || return
   local ext
   ext=$(echo ${1##*.} | tr '[:upper:]' '[:lower:]')
   case $ext in
      png|jpg|jpeg|mkv|mp4) mediainfo "$1" && exit ;;
      md) glow -s dark "$1" && exit ;;
      pdf) pdftotext -l 10 -nopgbrk -q -- "$1" - && exit ;;
      zip) zipinfo "$1" && exit ;;
      tar.gz|tgz) tar -ztvf "$1" && exit ;;
      tar.bz2) tar -jtvf "$1" && exit ;;
      tar) tar -tvf "$1" && exit ;;
      rar) unrar l "$1" && exit ;;
      7z) 7z l "$1" && exit ;;
      #html|xml) w3m -dump "$1" && exit;;
      #zsh*|bash*|git*) bat --color=always "$1" && exit ;;
      *) bat --paging=never --color=always $BAT_THEME "$1" && exit ;;
      # *) highlight "$1" -O ansi --force && exit ;;
   esac
}

handle_mime() {
   local mimetype="${1}"
   case "${mimetype}" in
      text/html) w3m -dump "${path}" ;;
      text/troff) man ./ "${path}" | col -b ;;
      text/* | */xml)
         if [ "$( stat --printf='%s' -- "${path}" )" -gt "${HIGHLIGHT_SIZE_MAX}" ]; then
            exit 2
         fi
         if [ "$(tput colors)" -ge 256 ]; then
            local highlight_format='xterm256'
         else
            local highlight_format='ansi'
         fi
         highlight --replace-tabs="${HIGHLIGHT_TABWIDTH}" --out-format="${highlight_format}" \
            --style="${HIGHLIGHT_STYLE}" --force -- "${path}" ;;
      application/zip) atool --list -- "${path}" ;;
      # image/*) chafa --fill=block --symbols=block -c 256 -s 80x"${HEIGHT}" "${path}" || exit 1;;
      image/*) mediainfo "${path}" || exit 1;;
      video/*|audio/*|application/octet-stream) mediainfo "${path}" || exit 1;;
      *opendocument*) odt2txt "${path}" ;;
   esac
}

handle_extension "$path"
handle_mime "$(file --dereference --brief --mime-type -- "${path}")"
exit

