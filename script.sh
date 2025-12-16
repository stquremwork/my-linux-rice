#!/bin/bash
# =========================================
# СКРИПТ УСТАНОВКИ ДЛЯ ARCH LINUX
# С поддержкой русского и английского языков
# =========================================
# Глобальные переменные для текста
declare -A messages_ru messages_en current_messages LANGUAGE=""

# Русские тексты
messages_ru=(
    ["title"]="СКРИПТ УСТАНОВКИ ДЛЯ ARCH LINUX"
    ["welcome"]="Добро пожаловать в скрипт установки Arch Linux"
    ["choose_lang"]="Выберите язык / Select language:"
    ["lang_ru"]="Русский"
    ["lang_en"]="English"
    ["invalid_choice"]="Неверный выбор! Попробуйте снова."
    ["root_warning"]="Внимание: Не рекомендуется запускать скрипт от пользователя root."
    ["run_as_user"]="Запустите скрипт от обычного пользователя с правами sudo."
    ["update_system"]="Обновление системы..."
    ["system_updated"]="Система обновлена!"
    ["recommended_update"]="Рекомендуется обновить систему перед установкой"
    ["update_now"]="Обновить систему? (y/N): "
    ["install_apps"]="ВЫБОР И УСТАНОВКА ПРИЛОЖЕНИЙ"
    ["check_yay"]="Проверка и установка yay (AUR Helper)..."
    ["yay_not_found"]="yay не найден. Начинаю установку..."
    ["install_deps"]="Устанавливаю зависимости: base-devel, git..."
    ["clone_yay"]="Клонирую репозиторий yay из AUR..."
    ["build_yay"]="Собираю и устанавливаю yay..."
    ["yay_installed"]="yay успешно установлен!"
    ["yay_exists"]="yay уже установлен. Пропускаю."
    ["installing_via"]="Устанавливаю через"
    ["installed_success"]="установлен успешно!"
    ["already_installed"]="уже установлен"
    ["install_error"]="Ошибка при установке"
    ["gnome_install"]="Установка окружения GNOME..."
    ["update_before"]="Обновляю систему..."
    ["installing_xorg"]="Устанавливаю Xorg..."
    ["installing_gnome"]="Устанавливаю GNOME..."
    ["setup_gdm"]="Устанавливаю и настраиваю GDM..."
    ["gnome_installed"]="Окружение GNOME установлено!"
    ["reboot_required"]="Перезагрузите систему для применения изменений"
    ["hyprland_install"]="Установка окружения Hyprland..."
    ["installing_hyprland"]="Устанавливаю Hyprland..."
    ["installing_wayland"]="Устанавливаю Wayland компоненты..."
    ["setup_display_manager"]="Настраиваю вход в систему..."
    ["hyprland_installed"]="Окружение Hyprland установлено!"
    ["hyprland_note"]="После входа в систему используйте команду: Hyprland"
    ["complete_install"]="Полная установка GNOME с приложениями..."
    ["more_actions"]="Хотите выполнить ещё действия? (y/N): "
    ["installation_complete"]="Установка завершена!"
    ["gdm_detected"]="Обнаружен GDM. Для запуска графической среды необходима перезагрузка."
    ["reboot_now"]="Перезагрузить сейчас? (y/N): "
    ["exit_script"]="Выход..."
    ["main_menu"]="Установка окружения и программ"
    ["menu_gnome"]="Установить GNOME"
    ["menu_apps"]="Выбрать и установить приложения"
    ["menu_hyprland"]="Установить Hyprland (окружение Wayland)"
    ["menu_update"]="Только обновить систему"
    ["menu_exit"]="Выход"
    ["select_option"]="Выберите вариант"
    ["bitwarden"]="Bitwarden (менеджер паролей)"
    ["chrome"]="Google Chrome (браузер)"
    ["zen_browser"]="Zen Browser (браузер на базе Firefox)"
    ["browsers"]="Браузеры"
    ["telegram_desktop"]="Telegram Desktop (мессенджер)"
    ["discord"]="Discord (мессенджер для геймеров)"
    ["vencord"]="Vencord (модификация Discord)"
    ["messengers"]="Мессенджеры"
    ["speedtest"]="Speedtest CLI (скорость интернета)"
    ["onlyoffice"]="OnlyOffice (офисный пакет)"
    ["jetbrains"]="JetBrains Toolbox (менеджер IDE)"
    ["recommended_toolbox"]="Рекомендуется установить JetBrains Toolbox для управления IDE"
    ["install_toolbox"]="Установить JetBrains Toolbox? (y/N): "
    ["after_toolbox"]="После запуска Toolbox установите нужные IDE."
    ["activation_warning"]="Внимание: Автоматическая активация через ckey.run может быть небезопасной."
    ["consider_license"]="Рассмотрите официальные лицензии или альтернативные способы."
    ["qbittorrent"]="qBittorrent (торрент-клиент)"
    ["steam"]="Steam (игровая платформа)"
    ["portproton"]="PortProton (запуск Windows игр)"
    ["games"]="Игры"
    ["enable_multilib"]="Включаю репозиторий multilib для Steam..."
    ["multilib_warning"]="Внимание: Multilib не включен в /etc/pacman.conf"
    ["multilib_required"]="Для установки Steam необходимо раскомментировать [multilib] в /etc/pacman.conf"
    ["wallpaper"]="Linux Wallpaper Engine (анимированные обои)"
    ["yandex_music"]="Яндекс.Музыка (музыкальный клиент)"
    ["nodejs_deps"]="Установка зависимости: nodejs-lts..."
    ["soundcloud"]="SoundCloud-dl (скачивание музыки)"
    ["obs"]="OBS Studio (запись экрана)"
    ["zerotier"]="Zerotier One (VPN сеть)"
    ["zerotier_enabled"]="Zerotier служба включена и запущена"
    ["widgets"]="Терминальные виджеты (cava, cmatrix, tty-clock)"
    ["press_enter"]="Нажмите Enter для продолжения..."
    ["select_category"]="Выберите вариант [1-5]: "
    ["enable_zerotier"]="Zerotier служба включена и запущена"
    ["app_selection"]="ВЫБЕРИТЕ ПРИЛОЖЕНИЯ ДЛЯ УСТАНОВКИ"
    ["instructions_single"]="↑↓ - перемещение, ПРОБЕЛ/ENTER - подтвердить"
    ["instructions_multi"]="↑↓ - перемещение, ПРОБЕЛ - выбрать/снять, ENTER - подтвердить"
    ["select_all"]="ВЫБРАТЬ/ОТМЕНИТЬ ВСЕ"
    ["selected_apps"]="Выбранные приложения"
    ["no_apps_selected"]="Не выбрано ни одного приложения!"
    ["continue_anyway"]="Продолжить без установки? (y/N): "
    ["installing_selected"]="Устанавливаю выбранные приложения..."
    ["app_done"]="Готово!"
    ["total_apps"]="Всего приложений"
    ["to_install"]="для установки"
    ["obsidian"]="Obsidian (заметки на базе Markdown)"
    ["vscode"]="Visual Studio Code (редактор кода)"
    ["development"]="Разработка"
    ["filezilla"]="FileZilla (FTP-клиент)"
    ["rustdesk"]="RustDesk (удаленный доступ)"
    ["remote"]="Удаленный доступ"
    ["pgadmin"]="pgAdmin 4 (управление PostgreSQL)"
    ["postgresql"]="PostgreSQL (база данных)"
    ["mysql"]="MySQL (база данных)"
    ["database"]="Базы данных"
    ["ventoy"]="Ventoy (создание загрузочных USB)"
    ["gparted"]="GParted (редактор разделов)"
    ["system_tools"]="Системные утилиты"
    ["krita"]="Krita (графический редактор)"
    ["graphics"]="Графика"
    ["razergenie"]="Razer Genie (утилита для устройств Razer)"
    ["winscribe"]="WindScribe (VPN клиент)"
    ["vpn"]="VPN клиенты"
    ["elyprism"]="ElyPrism Launcher (лаунчер Minecraft)"
    ["prism_launcher"]="Prism Launcher (альтернативный лаунчер Minecraft)"
    ["minecraft"]="Лаунчеры Minecraft"
    ["notes"]="Заметки"
    ["additional_apps"]="Дополнительные приложения"
    ["games_launchers"]="Игры и лаунчеры"
    ["network"]="Сеть и VPN"
)

# Английские тексты
messages_en=(
    ["title"]="ARCH LINUX INSTALLATION SCRIPT"
    ["welcome"]="Welcome to Arch Linux installation script"
    ["choose_lang"]="Select language:"
    ["lang_ru"]="Russian"
    ["lang_en"]="English"
    ["invalid_choice"]="Invalid choice! Please try again."
    ["root_warning"]="Warning: It is not recommended to run the script as root user."
    ["run_as_user"]="Please run the script as a regular user with sudo privileges."
    ["update_system"]="Updating system..."
    ["system_updated"]="System updated!"
    ["recommended_update"]="It is recommended to update the system before installation"
    ["update_now"]="Update system now? (y/N): "
    ["install_apps"]="APPLICATION SELECTION AND INSTALLATION"
    ["check_yay"]="Checking and installing yay (AUR Helper)..."
    ["yay_not_found"]="yay not found. Starting installation..."
    ["install_deps"]="Installing dependencies: base-devel, git..."
    ["clone_yay"]="Cloning yay repository from AUR..."
    ["build_yay"]="Building and installing yay..."
    ["yay_installed"]="yay successfully installed!"
    ["yay_exists"]="yay is already installed. Skipping."
    ["installing_via"]="Installing via"
    ["installed_success"]="installed successfully!"
    ["already_installed"]="is already installed"
    ["install_error"]="Error installing"
    ["gnome_install"]="Installing GNOME environment..."
    ["update_before"]="Updating system..."
    ["installing_xorg"]="Installing Xorg..."
    ["installing_gnome"]="Installing GNOME..."
    ["setup_gdm"]="Installing and configuring GDM..."
    ["gnome_installed"]="GNOME environment installed!"
    ["reboot_required"]="Reboot the system to apply changes"
    ["hyprland_install"]="Installing Hyprland environment..."
    ["installing_hyprland"]="Installing Hyprland..."
    ["installing_wayland"]="Installing Wayland components..."
    ["setup_display_manager"]="Setting up login manager..."
    ["hyprland_installed"]="Hyprland environment installed!"
    ["hyprland_note"]="After login, use command: Hyprland"
    ["complete_install"]="Full GNOME installation with applications..."
    ["more_actions"]="Perform more actions? (y/N): "
    ["installation_complete"]="Installation complete!"
    ["gdm_detected"]="GDM detected. Reboot is required to start graphical environment."
    ["reboot_now"]="Reboot now? (y/N): "
    ["exit_script"]="Exiting..."
    ["main_menu"]="Environment and Applications Installation"
    ["menu_gnome"]="Install GNOME"
    ["menu_apps"]="Select and install applications"
    ["menu_hyprland"]="Install Hyprland (Wayland environment)"
    ["menu_update"]="Update system only"
    ["menu_exit"]="Exit"
    ["select_option"]="Select option"
    ["bitwarden"]="Bitwarden (password manager)"
    ["chrome"]="Google Chrome (browser)"
    ["zen_browser"]="Zen Browser (Firefox-based browser)"
    ["browsers"]="Browsers"
    ["telegram_desktop"]="Telegram Desktop (messenger)"
    ["discord"]="Discord (gaming messenger)"
    ["vencord"]="Vencord (Discord mod)"
    ["messengers"]="Messengers"
    ["speedtest"]="Speedtest CLI (internet speed)"
    ["onlyoffice"]="OnlyOffice (office suite)"
    ["jetbrains"]="JetBrains Toolbox (IDE manager)"
    ["recommended_toolbox"]="It is recommended to install JetBrains Toolbox for IDE management"
    ["install_toolbox"]="Install JetBrains Toolbox? (y/N): "
    ["after_toolbox"]="After launching Toolbox, install the required IDEs."
    ["activation_warning"]="Warning: Automatic activation via ckey.run may be unsafe."
    ["consider_license"]="Consider official licenses or alternative methods."
    ["qbittorrent"]="qBittorrent (torrent client)"
    ["steam"]="Steam (gaming platform)"
    ["portproton"]="PortProton (Windows games)"
    ["games"]="Games"
    ["enable_multilib"]="Enabling multilib repository for Steam..."
    ["multilib_warning"]="Warning: Multilib is not enabled in /etc/pacman.conf"
    ["multilib_required"]="To install Steam, you need to uncomment [multilib] in /etc/pacman.conf"
    ["wallpaper"]="Linux Wallpaper Engine (animated wallpapers)"
    ["yandex_music"]="Yandex.Music (music client)"
    ["nodejs_deps"]="Installing dependency: nodejs-lts..."
    ["soundcloud"]="SoundCloud-dl (music downloader)"
    ["obs"]="OBS Studio (screen recording)"
    ["zerotier"]="Zerotier One (VPN network)"
    ["zerotier_enabled"]="Zerotier service enabled and started"
    ["widgets"]="Terminal widgets (cava, cmatrix, tty-clock)"
    ["press_enter"]="Press Enter to continue..."
    ["select_category"]="Select option [1-5]: "
    ["enable_zerotier"]="Zerotier service enabled and started"
    ["app_selection"]="SELECT APPLICATIONS TO INSTALL"
    ["instructions_single"]="↑↓ - navigate, SPACE/ENTER - confirm"
    ["instructions_multi"]="↑↓ - navigate, SPACE - select/deselect, ENTER - confirm"
    ["select_all"]="SELECT/DESELECT ALL"
    ["selected_apps"]="Selected applications"
    ["no_apps_selected"]="No applications selected!"
    ["continue_anyway"]="Continue without installation? (y/N): "
    ["installing_selected"]="Installing selected applications..."
    ["app_done"]="Done!"
    ["total_apps"]="Total applications"
    ["to_install"]="to install"
    ["obsidian"]="Obsidian (Markdown notes)"
    ["vscode"]="Visual Studio Code (code editor)"
    ["development"]="Development"
    ["filezilla"]="FileZilla (FTP client)"
    ["rustdesk"]="RustDesk (remote access)"
    ["remote"]="Remote access"
    ["pgadmin"]="pgAdmin 4 (PostgreSQL management)"
    ["postgresql"]="PostgreSQL (database)"
    ["mysql"]="MySQL (database)"
    ["database"]="Databases"
    ["ventoy"]="Ventoy (bootable USB creator)"
    ["gparted"]="GParted (partition editor)"
    ["system_tools"]="System tools"
    ["krita"]="Krita (graphics editor)"
    ["graphics"]="Graphics"
    ["razergenie"]="Razer Genie (Razer device utility)"
    ["winscribe"]="WindScribe (VPN client)"
    ["vpn"]="VPN clients"
    ["elyprism"]="ElyPrism Launcher (Minecraft launcher)"
    ["prism_launcher"]="Prism Launcher (alternative Minecraft launcher)"
    ["minecraft"]="Minecraft launchers"
    ["notes"]="Notes"
    ["additional_apps"]="Additional applications"
    ["games_launchers"]="Games and launchers"
    ["network"]="Network and VPN"
)

# Цвета
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

print_message() {
    local key="$1"
    local color="${2:-$NC}"
    local text="${current_messages[$key]:-$key}"
    echo -e "${color}${text}${NC}"
}

get_message() {
    local key="$1"
    echo "${current_messages[$key]:-$key}"
}

interactive_menu() {
    local mode="$1"
    local -n items="$2"
    local callback="$3"

    local total="${#items[@]}"
    local current_selection=0
    local -a selected_indices=()
    for ((i=0; i<total; i++)); do
        selected_indices[$i]=0
    done

    local old_stty
    old_stty=$(stty -g)
    stty -echo -icanon min 1 time 0

    while true; do
        clear
        echo "========================================="
        print_message "${mode}_title" "$CYAN"
        echo "========================================="
        if [[ $mode == "single" ]]; then
            print_message "instructions_single" "$YELLOW"
        else
            print_message "instructions_multi" "$YELLOW"
        fi
        echo -e "${YELLOW}Q - вернуться назад${NC}"
        echo "========================================="

        for ((i=0; i<total; i++)); do
            local prefix="[ ]"
            if [[ $mode == "multi" && ${selected_indices[$i]} -eq 1 ]]; then
                prefix="[✓]"
            fi
            if [[ $i -eq $current_selection ]]; then
                echo -e "${GREEN}➤ ${prefix} ${items[$i]}${NC}"
            else
                echo "  ${prefix} ${items[$i]}"
            fi
        done

        echo "========================================="
        if [[ $mode == "multi" ]]; then
            local selected_count=0
            for state in "${selected_indices[@]}"; do
                [[ $state -eq 1 ]] && ((selected_count++))
            done
            echo -e "${BLUE}Выбрано: ${selected_count}/${total}${NC}"
        fi
        echo "========================================="

        local key
        IFS= read -rsn1 key
        case "$key" in
            $'\x1b')
                read -rsn2 -t 0.1 seq
                case "$seq" in
                    "[A") current_selection=$(( (current_selection - 1 + total) % total )) ;;
                    "[B") current_selection=$(( (current_selection + 1) % total )) ;;
                esac
                ;;
            " ")
                if [[ $mode == "multi" ]]; then
                    if [[ ${selected_indices[$current_selection]} -eq 1 ]]; then
                        selected_indices[$current_selection]=0
                    else
                        selected_indices[$current_selection]=1
                    fi
                else
                    stty "$old_stty"
                    $callback "$current_selection"
                    return 0
                fi
                ;;
            "")
                if [[ $mode == "single" ]]; then
                    stty "$old_stty"
                    $callback "$current_selection"
                    return 0
                else
                    local -a chosen=()
                    for ((i=0; i<total; i++)); do
                        [[ ${selected_indices[$i]} -eq 1 ]] && chosen+=("$i")
                    done
                    stty "$old_stty"
                    $callback "${chosen[@]}"
                    return 0
                fi
                ;;
            "q"|"Q")
                stty "$old_stty"
                return 1
                ;;
        esac
    done
}

install_hyprland() {
    print_message "hyprland_install" "$BLUE"
    print_message "update_before" "$YELLOW"
    sudo pacman -Syu --noconfirm
    
    print_message "installing_wayland" "$BLUE"
    # Установка базовых компонентов Wayland
    sudo pacman -S wayland wayland-protocols xorg-xwayland --noconfirm --needed
    
    print_message "installing_hyprland" "$BLUE"
    # Установка Hyprland и необходимых компонентов
    sudo pacman -S hyprland kitty waybar rofi wofi mako grim slurp wl-clipboard swaybg swaylock-effects --noconfirm --needed
    
    # Дополнительные полезные утилиты
    sudo pacman -S brightnessctl playerctl pamixer network-manager-applet blueman --noconfirm --needed
    
    # Установка display manager (можно выбрать sddm или lightdm)
    print_message "setup_display_manager" "$BLUE"
    echo -e "${YELLOW}Выберите Display Manager:${NC}"
    echo "1) SDDM (рекомендуется для Hyprland)"
    echo "2) LightDM"
    echo "3) Без Display Manager (ручной запуск через TTY)"
    read -p "Ваш выбор [1-3]: " dm_choice
    
    case $dm_choice in
        1)
            sudo pacman -S sddm sddm-kcm --noconfirm --needed
            sudo systemctl enable sddm.service
            ;;
        2)
            sudo pacman -S lightdm lightdm-gtk-greeter --noconfirm --needed
            sudo systemctl enable lightdm.service
            ;;
        3)
            echo -e "${YELLOW}Display Manager не установлен.${NC}"
            echo -e "${YELLOW}Для запуска Hyprland после входа в TTY используйте команду:${NC}"
            echo -e "${GREEN}Hyprland${NC}"
            ;;
        *)
            sudo pacman -S sddm sddm-kcm --noconfirm --needed
            sudo systemctl enable sddm.service
            ;;
    esac
    
    # Включение NetworkManager
    sudo systemctl enable NetworkManager.service
    sudo systemctl enable bluetooth.service
    
    print_message "hyprland_installed" "$GREEN"
    print_message "hyprland_note" "$YELLOW"
    echo -e "${CYAN}Рекомендуемые следующие шаги:${NC}"
    echo "1. Перезагрузите систему"
    echo "2. После входа установите дополнительные приложения через этот скрипт"
    echo "3. Настройте конфигурацию Hyprland в ~/.config/hypr/"
    echo ""
    
    print_message "reboot_required" "$YELLOW"
    echo ""
    read -p "$(get_message 'press_enter')" dummy
}

main_menu_callback() {
    local choice="$1"
    case $choice in
        0) install_gnome ;;
        1) install_selected_applications ;;
        2) install_hyprland ;;
        3) update_system ;;
        4) print_message "exit_script" "$BLUE"; exit 0 ;;
    esac
}

lang_callback() {
    local choice="$1"
    case $choice in
        0)
            LANGUAGE="ru"
            for key in "${!messages_ru[@]}"; do
                current_messages[$key]="${messages_ru[$key]}"
            done
            ;;
        1)
            LANGUAGE="en"
            for key in "${!messages_en[@]}"; do
                current_messages[$key]="${messages_en[$key]}"
            done
            ;;
    esac

    if [[ "$LANGUAGE" == "ru" ]]; then
        export LC_ALL=ru_RU.UTF-8 2>/dev/null || true
        export LANG=ru_RU.UTF-8 2>/dev/null || true
    else
        export LC_ALL=en_US.UTF-8 2>/dev/null || true
        export LANG=en_US.UTF-8 2>/dev/null || true
    fi
}

install_selected_callback() {
    local -a selected_indices=("$@")
    if [[ ${#selected_indices[@]} -eq 0 ]]; then
        print_message "no_apps_selected" "$RED"
        read -p "$(get_message 'continue_anyway'): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            return 1
        fi
        return 0
    fi

    clear
    echo "========================================="
    print_message "selected_apps" "$CYAN"
    echo "========================================="
    for idx in "${selected_indices[@]}"; do
        echo -e "${GREEN}✓ ${app_names[$idx]}${NC}"
    done
    echo "========================================="
    echo -e "${BLUE}$(get_message 'total_apps'): ${#selected_indices[@]}/${#app_names[@]}${NC}"
    echo "========================================="
    read -p "$(get_message 'press_enter')" dummy

    local need_yay=false
    for idx in "${selected_indices[@]}"; do
        IFS='|' read -r _ packages installer <<< "${all_apps[$idx]}"
        if [[ "$installer" == "yay" ]]; then
            need_yay=true
            break
        fi
    done
    $need_yay && install_yay

    echo ""
    echo "========================================="
    print_message "installing_selected" "$CYAN"
    echo "========================================="
    for idx in "${selected_indices[@]}"; do
        IFS='|' read -r name packages installer <<< "${all_apps[$idx]}"
        echo ""
        echo -e "${YELLOW}▸ $name${NC}"
        echo "----------------------------------------"
        case "$installer" in
            "pacman")
                IFS=' ' read -ra pkg_array <<< "$packages"
                install_pacman_packages "${pkg_array[@]}"
                ;;
            "yay")
                IFS=' ' read -ra pkg_array <<< "$packages"
                install_yay_packages "${pkg_array[@]}"
                ;;
            "mixed")
                install_pacman_packages "cava" "cmatrix"
                install_yay_packages "tty-clock"
                ;;
        esac

        case "$name" in
            "$(get_message 'steam')")
                print_message "enable_multilib" "$BLUE"
                if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
                    print_message "multilib_warning" "$RED"
                    print_message "multilib_required" "$YELLOW"
                fi
                ;;
            "$(get_message 'yandex_music')")
                print_message "nodejs_deps" "$BLUE"
                install_pacman_packages "nodejs-lts"
                ;;
            "$(get_message 'zerotier')")
                sudo systemctl enable --now zerotier-one
                print_message "zerotier_enabled" "$GREEN"
                ;;
            "$(get_message 'jetbrains')")
                print_message "activation_warning" "$RED"
                print_message "consider_license" "$YELLOW"
                ;;
        esac
    done
    echo ""
    echo "========================================="
    print_message "app_done" "$GREEN"
    echo "========================================="
    echo ""
    read -p "$(get_message 'press_enter')" dummy
}

choose_language() {
    clear
    echo "========================================="
    echo " $(get_message 'welcome')"
    echo "========================================="
    echo ""

    # по умолчанию русские сообщения, чтобы были тексты
    for key in "${!messages_ru[@]}"; do
        current_messages[$key]="${messages_ru[$key]}"
    done

    local -a lang_items=(
        "$(get_message 'lang_ru')"
        "$(get_message 'lang_en')"
    )

    current_messages["single_title"]="$(get_message 'choose_lang')"
    if ! interactive_menu "single" lang_items lang_callback; then
        return 1
    fi
}

install_yay() {
    print_message "check_yay" "$BLUE"
    if ! command -v yay &> /dev/null; then
        print_message "yay_not_found" "$YELLOW"
        print_message "install_deps" "$BLUE"
        sudo pacman -S --needed base-devel git --noconfirm
        print_message "clone_yay" "$BLUE"
        cd /tmp || exit 1
        git clone https://aur.archlinux.org/yay.git
        cd yay || exit 1
        print_message "build_yay" "$BLUE"
        makepkg -si --noconfirm
        cd ..
        rm -rf yay
        print_message "yay_installed" "$GREEN"
    else
        print_message "yay_exists" "$YELLOW"
    fi
}

install_pacman_packages() {
    local packages=("$@")
    for package in "${packages[@]}"; do
        if ! pacman -Qi "$package" &> /dev/null; then
            echo -e "${BLUE}$(get_message 'installing_via') pacman: $package...${NC}"
            sudo pacman -S "$package" --noconfirm --needed
            if [ $? -eq 0 ]; then
                echo -e "${GREEN}$package $(get_message 'installed_success')${NC}"
            else
                echo -e "${RED}$(get_message 'install_error') $package${NC}"
            fi
        else
            echo -e "${YELLOW}$package $(get_message 'already_installed')${NC}"
        fi
    done
}

install_yay_packages() {
    local packages=("$@")
    for package in "${packages[@]}"; do
        if ! pacman -Qi "$package" &> /dev/null; then
            echo -e "${BLUE}$(get_message 'installing_via') yay (AUR): $package...${NC}"
            yay -S "$package" --noconfirm --needed
            if [ $? -eq 0 ]; then
                echo -e "${GREEN}$package $(get_message 'installed_success')${NC}"
            else
                echo -e "${RED}$(get_message 'install_error') $package${NC}"
            fi
        else
            echo -e "${YELLOW}$package $(get_message 'already_installed')${NC}"
        fi
    done
}

install_selected_applications() {
    local -a all_apps=(
        "$(get_message 'bitwarden')|bitwarden|pacman"
        "$(get_message 'chrome')|google-chrome|yay"
        "$(get_message 'zen_browser')|zen-browser-bin|yay"
        "$(get_message 'telegram_desktop')|telegram-desktop|yay"
        "$(get_message 'discord')|discord|yay"
        "$(get_message 'vencord')|vencord|yay"
        "$(get_message 'speedtest')|speedtest-cli|pacman"
        "$(get_message 'onlyoffice')|onlyoffice-bin|yay"
        "$(get_message 'qbittorrent')|qbittorrent|pacman"
        "$(get_message 'obs')|obs-studio|pacman"
        "$(get_message 'zerotier')|zerotier-one|pacman"
        "$(get_message 'widgets')|cava cmatrix tty-clock|mixed"
        "$(get_message 'jetbrains')|jetbrains-toolbox|yay"
        "$(get_message 'vscode')|visual-studio-code-bin|yay"
        "$(get_message 'obsidian')|obsidian|yay"
        "$(get_message 'postgresql')|postgresql|pacman"
        "$(get_message 'mysql')|mysql|pacman"
        "$(get_message 'pgadmin')|pgadmin4|yay"
        "$(get_message 'wallpaper')|linux-wallpaperengine-git|yay"
        "$(get_message 'yandex_music')|yandex-music|yay"
        "$(get_message 'soundcloud')|soundcloud-dl|yay"
        "$(get_message 'krita')|krita|pacman"
        "$(get_message 'steam')|steam|pacman"
        "$(get_message 'portproton')|portproton|yay"
        "$(get_message 'elyprism')|elyprism-launcher-bin|yay"
        "$(get_message 'prism_launcher')|prismlauncher|pacman"
        "$(get_message 'filezilla')|filezilla|pacman"
        "$(get_message 'rustdesk')|rustdesk-bin|yay"
        "$(get_message 'ventoy')|ventoy-bin|yay"
        "$(get_message 'gparted')|gparted|pacman"
        "$(get_message 'razergenie')|razergenie|yay"
        "$(get_message 'winscribe')|winscribe|yay"
    )

    app_names=()
    for app in "${all_apps[@]}"; do
        IFS='|' read -r name _ _ <<< "$app"
        app_names+=("$name")
    done

    current_messages["multi_title"]="$(get_message 'app_selection')"

    if ! interactive_menu "multi" app_names install_selected_callback; then
        return
    fi
}

install_gnome() {
    print_message "gnome_install" "$BLUE"
    print_message "update_before" "$YELLOW"
    sudo pacman -Syu --noconfirm
    print_message "installing_xorg" "$BLUE"
    sudo pacman -S xorg --noconfirm --needed
    print_message "installing_gnome" "$BLUE"
    sudo pacman -S gnome gnome-extra --noconfirm --needed
    print_message "setup_gdm" "$BLUE"
    sudo pacman -S gdm --noconfirm --needed
    sudo systemctl enable gdm.service
    sudo systemctl enable NetworkManager.service
    print_message "gnome_installed" "$GREEN"
    print_message "reboot_required" "$YELLOW"
    echo ""
    read -p "$(get_message 'press_enter')" dummy
}

update_system() {
    print_message "update_system" "$BLUE"
    sudo pacman -Syu --noconfirm
    print_message "system_updated" "$GREEN"
    echo ""
    read -p "$(get_message 'press_enter')" dummy
}

show_menu() {
    local -a menu_items=(
        "$(get_message 'menu_gnome')"
        "$(get_message 'menu_apps')"
        "$(get_message 'menu_hyprland')"
        "$(get_message 'menu_update')"
        "$(get_message 'menu_exit')"
    )
    current_messages["single_title"]="$(get_message 'main_menu')"

    # Показать главное меню один раз
    if ! interactive_menu "single" menu_items main_menu_callback; then
        # Нажали q в главном меню – сообщаем вызывающему коду
        return 1
    fi

    return 0
}


main() {
    choose_language || exit 0

    clear
    echo "========================================="
    print_message "title" "$GREEN"
    echo "========================================="
    echo ""

    if [ "$EUID" -eq 0 ]; then
        print_message "root_warning" "$RED"
        print_message "run_as_user" "$YELLOW"
        exit 1
    fi

while true; do
    if ! show_menu; then
        # q в главном меню – снова выбор языка
        choose_language || exit 0
        clear
        echo "========================================="
        print_message "title" "$GREEN"
        echo "========================================="
        echo ""
        continue
    fi
done


    # Если уберёшь exit 0 из main_menu_callback, будешь доходить сюда.
    echo ""
    echo "========================================="
    read -p "$(get_message 'more_actions'): " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_message "installation_complete" "$GREEN"
        if pacman -Qi gdm &> /dev/null; then
            print_message "gdm_detected" "$YELLOW"
            read -p "$(get_message 'reboot_now'): " -n 1 -r
            echo ""
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                sudo reboot
            fi
        fi
        exit 0
    fi
}

main "$@"