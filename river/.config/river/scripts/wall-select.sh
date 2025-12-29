#!/bin/bash

# Configurazione
WALL_DIR="$HOME/Pictures/Wallpapers"
TRANSITION_TYPE="grow"  # Opzioni: simple, fade, left, right, top, bottom, wipe, wave, grow, center, outer
TRANSITION_POS="0.85,0.85" # Parte dall'angolo in basso a destra (dove c'è l'orologio solitamente)

# 1. Trova le immagini e passale a Fuzzel
# -d: modalità dmenu
# -p: prompt personalizzato
SELECTED=$(ls "$WALL_DIR" | fuzzel -d -p "Wallpaper 󰸉 > " --width 40)

# 2. Se ho selezionato qualcosa (non ho premuto Esc)
if [ -n "$SELECTED" ]; then
    # Applica lo sfondo con swww
    swww img "$WALL_DIR/$SELECTED" \
        --transition-type "$TRANSITION_TYPE" \
        --transition-pos "$TRANSITION_POS" \
        --transition-fps 60 \
        --transition-duration 2
        
    # (Opzionale) Invia notifica
    notify-send "Wallpaper" "Impostato: $SELECTED"
fi
