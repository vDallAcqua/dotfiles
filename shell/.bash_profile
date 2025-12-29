#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# --- AUTOSTART RIVER ---
# Se sono sul TTY1 E non c'è già una sessione Wayland attiva:
if [ -z "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    # Avvia River dentro una sessione DBus
    exec dbus-run-session river
fi
