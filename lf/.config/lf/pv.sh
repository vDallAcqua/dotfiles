#!/bin/sh

#!/bin/sh

file="$1"
w="$2"
h="$3"
x="$4"
y="$5"

case "$file" in
    # --- IMMAGINI (JPG, PNG, WEBP, ecc) ---
    *.jpg|*.jpeg|*.png|*.bmp|*.gif|*.webp|*.tiff|*.ico)
        # Usa chafa in modalità sixel.
        # --animate=false : evita loop infiniti sulle GIF che bloccano lf
        chafa -f sixel -s "${w}x${h}" --animate=false "$file"
        exit 1
        ;;
        
    # --- VIDEO (Thumbnail) ---
    *.mp4|*.mkv|*.avi|*.mov|*.webm)
        # Estrae il frame centrale (-t 10%) e lo passa a chafa
        ffmpegthumbnailer -i "$file" -o - -s 0 -t 10% | chafa -f sixel -s "${w}x${h}" -
        exit 1
        ;;

    # --- PDF (Prima pagina) ---
    *.pdf)
        # Converte la prima pagina in JPG e la mostra
        pdftoppm -jpeg -f 1 -l 1 "$file" | chafa -f sixel -s "${w}x${h}" -
        exit 1
        ;;

    # --- ARCHIVI ---
    *.tar*) tar tf "$file";;
    *.zip) unzip -l "$file";;
    *.rar) unrar l "$file";;
    *.7z) 7z l "$file";;

    # --- TUTTO IL RESTO (Testo colorato) ---
    *) 
        bat --color=always --style=plain --wrap=character --terminal-width="$w" "$file" 2>/dev/null || cat "$file"
        ;;
esac

