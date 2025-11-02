#!/bin/bash

# GOUR Linux Installer
# Created by Adam El Mortaji
# Version 2.0

echo -e "\e[1;34m"
cat << "EOF"
   ____  ___  __  ______   __
  / __ \/ _ \/ / / / __ \ / /
 / / / /  __/ /_/ / / / // / 
/_/ /_/\___/\__,_/_/ /_//_/  
                             
     Ethical Security Tools
EOF
echo -e "\e[0m"
echo -e "\e[33mGOUR Linux Installer - Created by Adam El Mortaji\e[0m"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    print_warning "Running as root is not recommended for security reasons."
    read -p "Continue anyway? (y/N): " continue_root
    if [ "$continue_root" != "y" ] && [ "$continue_root" != "Y" ]; then
        exit 1
    fi
fi

# Detect package manager
detect_package_manager() {
    if [ -x "$(command -v pkg)" ]; then
        echo "termux"
    elif [ -x "$(command -v apt-get)" ]; then
        echo "apt"
    elif [ -x "$(command -v yum)" ]; then
        echo "yum"
    elif [ -x "$(command -v pacman)" ]; then
        echo "pacman"
    elif [ -x "$(command -v dnf)" ]; then
        echo "dnf"
    else
        echo "unknown"
    fi
}

PKG_MANAGER=$(detect_package_manager)

# Install dependencies based on package manager
install_dependencies() {
    print_status "Installing system dependencies..."
    
    case $PKG_MANAGER in
        "termux")
            pkg update -y
            pkg install -y git curl wget python nodejs ruby php clang vim htop tree figlet zip unzip
            ;;
        "apt")
            sudo apt update -y
            sudo apt install -y git curl wget python3 python3-pip nodejs npm ruby php clang vim htop tree figlet zip unzip
            ;;
        "yum")
            sudo yum update -y
            sudo yum install -y git curl wget python3 nodejs ruby php clang vim htop tree figlet zip unzip
            ;;
        "dnf")
            sudo dnf update -y
            sudo dnf install -y git curl wget python3 nodejs ruby php clang vim htop tree figlet zip unzip
            ;;
        "pacman")
            sudo pacman -Syu --noconfirm
            sudo pacman -S --noconfirm git curl wget python nodejs npm ruby php clang vim htop tree figlet zip unzip
            ;;
        *)
            print_warning "Unknown package manager. Please install dependencies manually."
            ;;
    esac
}

# Backup existing configuration
backup_existing() {
    if [ -f ~/.bashrc ]; then
        cp ~/.bashrc ~/.bashrc.backup.$(date +%Y%m%d_%H%M%S)
        print_success "Backed up existing .bashrc"
    fi
    
    if [ -f ~/.zshrc ]; then
        cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d_%H%M%S)
        print_success "Backed up existing .zshrc"
    fi
}

# Install GOUR Linux
install_gour() {
    print_status "Installing GOUR Linux..."
    
    # Make scripts executable
    chmod +x gour.sh
    chmod +x update.sh 2>/dev/null || true
    
    # Create GOUR directory in home
    if [ ! -d ~/.gour ]; then
        mkdir ~/.gour
    fi
    
    # Copy shortcuts to GOUR directory
    if [ -d shortcuts ]; then
        cp -r shortcuts/* ~/.gour/
        chmod +x ~/.gour/*
    fi
    
    # Add to PATH
    if [[ ":$PATH:" != *":$HOME/.gour:"* ]]; then
        echo 'export PATH="$PATH:$HOME/.gour"' >> ~/.bashrc
    fi
    
    # Add alias and source to shell configuration
    CURRENT_DIR=$(pwd)
    
    # Add to bashrc
    if ! grep -q "GOUR Linux" ~/.bashrc; then
        echo "" >> ~/.bashrc
        echo "# GOUR Linux - Ethical Security Tools" >> ~/.bashrc
        echo "alias gour='$CURRENT_DIR/gour.sh'" >> ~/.bashrc
        echo "source $CURRENT_DIR/gour.sh" >> ~/.bashrc
    fi
    
    # Add to zshrc if exists
    if [ -f ~/.zshrc ] && ! grep -q "GOUR Linux" ~/.zshrc; then
        echo "" >> ~/.zshrc
        echo "# GOUR Linux - Ethical Security Tools" >> ~/.zshrc
        echo "alias gour='$CURRENT_DIR/gour.sh'" >> ~/.zshrc
        echo "source $CURRENT_DIR/gour.sh" >> ~/.zshrc
    fi
}

# Create update script
create_update_script() {
    cat > update.sh << 'EOF'
#!/bin/bash

# GOUR Linux Update Script
echo "Updating GOUR Linux..."

# Update from git
git pull origin main

# Re-run installation
chmod +x install.sh
./install.sh

echo "GOUR Linux updated successfully!"
EOF
    chmod +x update.sh
}

# Main installation process
main() {
    echo "=== GOUR Linux Installation ==="
    echo ""
    
    # Legal disclaimer
    print_warning "LEGAL DISCLAIMER: This tool is for EDUCATIONAL and AUTHORIZED testing only."
    read -p "Do you agree to use this tool ethically and legally? (y/N): " agree
    if [ "$agree" != "y" ] && [ "$agree" != "Y" ]; then
        print_error "Installation cancelled. You must agree to use this tool ethically."
        exit 1
    fi
    
    # Install dependencies
    install_dependencies
    
    # Backup existing configs
    backup_existing
    
    # Install GOUR Linux
    install_gour
    
    # Create update script
    create_update_script
    
    # Completion message
    echo ""
    print_success "GOUR Linux installed successfully!"
    echo ""
    echo -e "${GREEN}=== Next Steps ===${NC}"
    echo "1. Restart your terminal or run: source ~/.bashrc"
    echo "2. Start using: gour.sh"
    echo "3. Or use direct tool aliases: nm, sql, nk, etc."
    echo ""
    echo -e "${YELLOW}=== Available Commands ===${NC}"
    echo "gour.sh      - Start interactive menu"
    echo "update.sh    - Update GOUR Linux"
    echo "nm, sql, nk  - Direct tool access"
    echo ""
    echo -e "${RED}=== Legal Notice ===${NC}"
    echo "Use only for authorized security testing!"
    echo "Respect privacy and follow ethical guidelines."
    echo ""
    echo -e "${BLUE}Created by Adam El Mortaji${NC}"
}

# Run main installation
main