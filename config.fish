# Обычный Minecraft
alias minecraft='cd /home/stqurem/Приложения/Minecraft/ && java -jar LegacyLauncher.jar'
# Minecraft на NVIDIA
alias minecraft-nvidia='cd /home/stqurem/Приложения/Minecraft/ && prime-run java -jar LegacyLauncher.jar'
alias minecraft-server='cd /home/stqurem/Minecraft_Servers/Minecraft_Server_Forge_1.20.1/ && ./run.sh'

alias bluetooth-settings='blueman-manager'
alias volume-settings='pwvucontrol'

alias hyprlock-run='/home/user/.config/hypr/hyprlock/scripts/hyprlock.fh'

alias wifi-off='nmcli device  disconnect wlan01'
alias wifi-on='nmcli device wifi connect'
alias wifi-list='nmcli device wifi list'
alias wifi-list-refresh='nmcli device wifi list'
alias waybar-refresh='killall waybar && waybar &'
alias grub-config-refresh='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias gparted-s='sudo -E gparted'
alias thunar-s='sudo -E thunar'
alias gdisks-s='sudo -E gnome-disks'
alias bleachbit-s='sudo -E bleachbit &'

alias zerotier-listnetworks='sudo zerotier-cli listnetworks'
alias zerotier-connect='sudo zerotier-cli join'
alias zerotier-leave='sudo zerotier-cli leave'
alias zerotier-on='sudo systemctl start zerotier-one'
alias zerotier-off='sudo systemctl stop zerotier-one'
alias guts-gif='ascii-image-converter /home/stqurem/Загрузки/berserk-guts-full.gif -b --dither'

alias wallpaper-engine-change='/home/user/.config/hypr/scripts/wallpaper-selector.fh'
alias wallpaper-change='waypaper --random --folder /home/user/Обои'

# Применить тему
alias matugen-theme='/home/user/.config/matugen/scripts/theme-selector.fh'

alias clock-w='hyprctl dispatch exec "[float; size 575 310; title Clock] kitty -o -e tty-clock -s -c -C 6"'
alias cava-w='hyprctl dispatch exec "[float; size 575 310; title Cava] kitty -o -e cava"'
alias matrix-w='hyprctl dispatch exec "[float; size 575 310; title Matrix] kitty -o -e cmatrix -C magenta"'
alias fastfetch-w='hyprctl dispatch exec "[float; size 575 310; title Fastfetch] kitty -o -e fastfetch"'


if status is-interactive
    # Commands to run in interactive sessions can go here
end


#gpu_info
function gpufetch
    cd gpufetch
    make
    ./gpufetch
end
