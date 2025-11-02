#!/bin/bash

# GOUR Linux - Ethical Security Tools Framework
# Created by Adam El Mortaji
# Version 2.0
# License: MIT

clear
echo -e "\e[1;34m"
cat << "EOF"
   ____  ___  __  ______   __
  / __ \/ _ \/ / / / __ \ / /
 / / / /  __/ /_/ / / / // / 
/_/ /_/\___/\__,_/_/ /_//_/  
                             
     Ethical Security Tools
EOF
echo -e "\e[33mCreated by Adam El Mortaji - Morocco\e[0m"
echo -e "\e[1;32m"

# Function to install packages
install_pkg() {
    if [ -x "$(command -v pkg)" ]; then
        pkg install -y $1
    elif [ -x "$(command -v apt-get)" ]; then
        sudo apt-get install -y $1
    elif [ -x "$(command -v yum)" ]; then
        sudo yum install -y $1
    elif [ -x "$(command -v pacman)" ]; then
        sudo pacman -S --noconfirm $1
    else
        echo "Package manager not found. Please install $1 manually."
    fi
}

# System Information
echo "=== GOUR Linux System ==="
echo "Platform: $(uname -s)"
echo "Architecture: $(uname -m)"
echo ""

# Main Menu
show_menu() {
    echo "=== Main Menu ==="
    echo "1. Network Tools"
    echo "2. Web Security Tools"
    echo "3. Wireless Tools"
    echo "4. Password Tools"
    echo "5. Forensics Tools"
    echo "6. Programming Tools"
    echo "7. Utilities"
    echo "8. Chat System"
    echo "9. Install All Tools"
    echo "10. Help"
    echo "0. Exit"
    echo ""
    read -p "Select option: " choice
}

# Network Tools
network_tools() {
    echo ""
    echo "=== Network Tools ==="
    echo "nm  - Nmap Network Scanner"
    echo "ws  - Wireshark/Tshark"
    echo "nc  - Netcat"
    echo "nt  - Net-tools"
    echo "ping- Ping Utility"
    echo "ss  - Socket Statistics"
    echo ""
    echo "Usage examples:"
    echo "  nm 192.168.1.1"
    echo "  ws -i eth0"
    echo "  nc -lvp 4444"
}

# Web Security Tools
web_tools() {
    echo ""
    echo "=== Web Security Tools ==="
    echo "sql - SQLMap"
    echo "nk  - Nikto"
    echo "hd  - Hydra"
    echo "dir - Directory Brute Force"
    echo "sub - Subdomain Enumeration"
    echo ""
    echo "Usage examples:"
    echo "  sql -u 'http://site.com/page?id=1'"
    echo "  nk -h http://site.com"
    echo "  hd -l user -P pass.txt ftp://192.168.1.1"
}

# Wireless Tools
wireless_tools() {
    echo ""
    echo "=== Wireless Tools ==="
    echo "ac  - Aircrack-ng"
    echo "wif - WiFi Utilities"
    echo ""
    echo "Usage examples:"
    echo "  ac -a [bssid] -w [wordlist] [capturefile]"
    echo "  wif list"
}

# Password Tools
password_tools() {
    echo ""
    echo "=== Password Tools ==="
    echo "jn  - John the Ripper"
    echo "hc  - Hashcat"
    echo "cr  - Crunch"
    echo ""
    echo "Usage examples:"
    echo "  jn --wordlist=passwords.txt hashfile"
    echo "  hc -m 0 -a 0 hash.txt wordlist.txt"
    echo "  cr 8 8 -f /usr/share/crunch/charset.lst"
}

# Forensics Tools
forensics_tools() {
    echo ""
    echo "=== Forensics Tools ==="
    echo "sh  - Steghide"
    echo "bin - Binwalk"
    echo "vol - Volatility"
    echo "for - Foremost"
    echo ""
    echo "Usage examples:"
    echo "  sh extract -sf image.jpg"
    echo "  bin -e firmware.bin"
    echo "  vol -f memory.dmp imageinfo"
}

# Programming Tools
programming_tools() {
    echo ""
    echo "=== Programming Tools ==="
    echo "py  - Python"
    echo "js  - Node.js"
    echo "rb  - Ruby"
    echo "pp  - PHP"
    echo "cc  - Clang"
    echo "java- Java"
    echo ""
    echo "Usage examples:"
    echo "  py script.py"
    echo "  js app.js"
    echo "  rb program.rb"
}

# Utilities
utilities() {
    echo ""
    echo "=== Utilities ==="
    echo "gi  - Git"
    echo "wg  - Wget"
    echo "curl- Curl"
    echo "v   - Vim"
    echo "ht  - Htop"
    echo "fig - Figlet"
    echo "tr  - Tree"
    echo "zip - Zip/Unzip"
    echo ""
    echo "Usage examples:"
    echo "  gi clone https://github.com/user/repo"
    echo "  wg http://site.com/file"
    echo "  curl http://site.com"
}

# Tool Aliases - Network
alias nm='echo "Installing Nmap..."; install_pkg nmap; echo "Running Nmap..."; nmap'
alias ws='echo "Installing Tshark..."; install_pkg tshark; echo "Running Tshark..."; tshark'
alias nc='echo "Installing Netcat..."; install_pkg netcat; echo "Running Netcat..."; nc'
alias nt='echo "Installing Net-tools..."; install_pkg net-tools; echo "Running ifconfig..."; ifconfig'
alias ping='ping -c 4'
alias ss='ss -tuln'

# Tool Aliases - Web Security
alias sql='echo "Installing SQLMap..."; install_pkg sqlmap; echo "Running SQLMap..."; sqlmap'
alias nk='echo "Installing Nikto..."; install_pkg nikto; echo "Running Nikto..."; nikto'
alias hd='echo "Installing Hydra..."; install_pkg hydra; echo "Running Hydra..."; hydra'
alias dir='echo "Installing Gobuster..."; install_pkg gobuster; echo "Running Gobuster..."; gobuster'
alias sub='echo "Installing Subfinder..."; install_pkg subfinder; echo "Running Subfinder..."; subfinder'

# Tool Aliases - Wireless
alias ac='echo "Installing Aircrack-ng..."; install_pkg aircrack-ng; echo "Running Aircrack-ng..."; aircrack-ng'
alias wif='echo "Installing WiFi tools..."; install_pkg wireless-tools; echo "Running iwconfig..."; iwconfig'

# Tool Aliases - Password
alias jn='echo "Installing John..."; install_pkg john; echo "Running John..."; john'
alias hc='echo "Installing Hashcat..."; install_pkg hashcat; echo "Running Hashcat..."; hashcat'
alias cr='echo "Installing Crunch..."; install_pkg crunch; echo "Running Crunch..."; crunch'

# Tool Aliases - Forensics
alias sh='echo "Installing Steghide..."; install_pkg steghide; echo "Running Steghide..."; steghide'
alias bin='echo "Installing Binwalk..."; install_pkg binwalk; echo "Running Binwalk..."; binwalk'
alias vol='echo "Installing Volatility..."; install_pkg volatility; echo "Running Volatility..."; volatility'
alias for='echo "Installing Foremost..."; install_pkg foremost; echo "Running Foremost..."; foremost'

# Tool Aliases - Programming
alias py='echo "Installing Python..."; install_pkg python; echo "Running Python..."; python'
alias js='echo "Installing Node.js..."; install_pkg nodejs; echo "Running Node.js..."; node'
alias rb='echo "Installing Ruby..."; install_pkg ruby; echo "Running Ruby..."; ruby'
alias pp='echo "Installing PHP..."; install_pkg php; echo "Running PHP..."; php'
alias cc='echo "Installing Clang..."; install_pkg clang; echo "Running Clang..."; clang'
alias java='echo "Installing Java..."; install_pkg openjdk-17-jdk; echo "Running Java..."; java'

# Tool Aliases - Utilities
alias gi='echo "Installing Git..."; install_pkg git; echo "Running Git..."; git'
alias wg='echo "Installing Wget..."; install_pkg wget; echo "Running Wget..."; wget'
alias curl='curl -O'
alias v='echo "Installing Vim..."; install_pkg vim; echo "Running Vim..."; vim'
alias ht='echo "Installing Htop..."; install_pkg htop; echo "Running Htop..."; htop'
alias fig='echo "Installing Figlet..."; install_pkg figlet; echo "Running Figlet..."; figlet'
alias tr='echo "Installing Tree..."; install_pkg tree; echo "Running Tree..."; tree'
alias zip='echo "Installing Zip..."; install_pkg zip; echo "Running Zip..."; zip'
alias unzip='echo "Installing Unzip..."; install_pkg unzip; echo "Running Unzip..."; unzip'

# System Aliases
alias ll='ls -la'
alias ..='cd ..'
alias ...='cd ../..'
alias cl='clear'
alias upd='echo "Updating system..."; install_pkg update && install_pkg upgrade'
alias inl='install_pkg'
alias seh='pkg search'
alias rf='rm -rf'
alias cr='cp -r'

# Chat System Functions
CH(){
    read -p "PORT: " port
    echo "LISTENING ON PORT $port..."
    while true; do
        nc -l -p "$port"
    done
}

ch(){
    read -p "USERNAME: " username
    read -p "PORT: " port
    read -p "IP: " ip

    echo "Connecting to $ip:$port as $username..."
    
    while true; do
        read -p "$username: " msg
        if [ "$msg" == "exit" ]; then
            break
        fi
        echo "$username: $msg" | nc "$ip" "$port"
    done
}

# Kali Linux Meta-Installation
KALI(){
    echo "Installing Kali Linux Tools Suite..."
    upd
    install_pkg git
    install_pkg python
    install_pkg nmap
    install_pkg sqlmap
    install_pkg hydra
    install_pkg tshark
    install_pkg nikto
    install_pkg john
    install_pkg aircrack-ng
    install_pkg steghide
    install_pkg binwalk
    install_pkg volatility
    install_pkg foremost
    install_pkg gobuster
    install_pkg subfinder
    install_pkg hashcat
    install_pkg crunch
    install_pkg wireless-tools
    echo "Kali Linux tools installation completed!"
}

# Help Function
show_help() {
    echo ""
    echo "=== GOUR Linux Help ==="
    echo "Simply type the tool alias to install and run it"
    echo "Examples:"
    echo "  nm 192.168.1.1        - Scan network with nmap"
    echo "  nk http://example.com - Scan website with nikto"
    echo "  sql --help            - Show SQLMap help"
    echo ""
    echo "Advanced Features:"
    echo "  CH                    - Start chat server"
    echo "  ch                    - Connect to chat"
    echo "  KALI                  - Install all tools"
    echo "  upd                   - Update system"
    echo ""
    echo "Legal Notice: Use only for ethical security testing!"
}

# Main Interactive Loop
while true; do
    show_menu
    case $choice in
        1) network_tools ;;
        2) web_tools ;;
        3) wireless_tools ;;
        4) password_tools ;;
        5) forensics_tools ;;
        6) programming_tools ;;
        7) utilities ;;
        8) 
            echo "=== Chat System ==="
            echo "CH - Start server (listen on port)"
            echo "ch - Connect to server (username, port, ip)"
            echo ""
            echo "Example:"
            echo "  On Server: CH"
            echo "  On Client: ch"
            ;;
        9) KALI ;;
        10) show_help ;;
        0) 
            echo "Thank you for using GOUR Linux!"
            echo "Remember: Use ethically and responsibly!"
            echo "Created by Adam El Mortaji"
            exit 0
            ;;
        *) echo "Invalid option. Please try again." ;;
    esac
    
    echo ""
    read -p "Press Enter to continue..."
    clear
    echo -e "\e[1;34m"
    cat << "EOF"
   ____  ___  __  ______   __
  / __ \/ _ \/ / / / __ \ / /
 / / / /  __/ /_/ / / / // / 
/_/ /_/\___/\__,_/_/ /_//_/  
                             
     Ethical Security Tools
EOF
    echo -e "\e[0m"
done

# Set custom prompt (will work after sourcing)
export PS1='┌──(gour㉿linux)-[\w]\n└─\$ '

echo ""
echo "GOUR Linux is ready! Type any tool alias to begin."
echo "Type 'show_help' for assistance."
echo "Legal: Use only for authorized security testing!"