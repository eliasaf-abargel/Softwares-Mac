#!/bin/bash

# =============================================================================
# 🚀 Advanced ZSH Configuration Setup Script
# =============================================================================
# 
# This script provides a complete, automated installation of a production-ready
# ZSH environment with cloud-native development tools, enhanced productivity
# features, and a beautiful terminal experience.
#
# Features:
# - Oh My Zsh with Powerlevel10k theme
# - Cloud development tools (AWS, GCP, Azure)
# - Container and orchestration tools (Docker, Kubernetes)
# - Development languages and frameworks
# - Productivity plugins and utilities
# - Automated configuration and setup
#
# Author: Advanced ZSH Configuration Suite
# Version: 2.0.0
# =============================================================================

set -e  # Exit on any error

# =============================================================================
# CONFIGURATION
# =============================================================================

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Script configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.zshrc.backups"
LOG_FILE="$HOME/.zshrc.setup.log"

# =============================================================================
# UTILITY FUNCTIONS
# =============================================================================

# Function to print colored output with timestamps
print_status() {
    echo -e "${BLUE}[$(date '+%H:%M:%S')] [INFO]${NC} $1" | tee -a "$LOG_FILE"
}

print_success() {
    echo -e "${GREEN}[$(date '+%H:%M:%S')] [SUCCESS]${NC} $1" | tee -a "$LOG_FILE"
}

print_warning() {
    echo -e "${YELLOW}[$(date '+%H:%M:%S')] [WARNING]${NC} $1" | tee -a "$LOG_FILE"
}

print_error() {
    echo -e "${RED}[$(date '+%H:%M:%S')] [ERROR]${NC} $1" | tee -a "$LOG_FILE"
}

print_header() {
    echo -e "${PURPLE}[$(date '+%H:%M:%S')] [HEADER]${NC} ${BOLD}$1${NC}" | tee -a "$LOG_FILE"
}

print_step() {
    echo -e "${CYAN}[$(date '+%H:%M:%S')] [STEP]${NC} $1" | tee -a "$LOG_FILE"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check if directory exists
directory_exists() {
    [ -d "$1" ]
}

# Function to check if file exists
file_exists() {
    [ -f "$1" ]
}

# Function to create backup
create_backup() {
    local source="$1"
    local backup_name="$2"
    
    if file_exists "$source"; then
        local timestamp=$(date +%Y%m%d_%H%M%S)
        local backup_path="$BACKUP_DIR/${backup_name}.${timestamp}"
        
        mkdir -p "$BACKUP_DIR"
        cp "$source" "$backup_path"
        print_success "Backup created: $backup_path"
    fi
}

# Function to install package with error handling
install_package() {
    local package="$1"
    local description="$2"
    
    if ! command_exists "$package"; then
        print_step "Installing $description..."
        if brew install "$package" >> "$LOG_FILE" 2>&1; then
            print_success "$description installed successfully"
        else
            print_error "Failed to install $description"
            return 1
        fi
    else
        print_success "$description already installed"
    fi
}

# Function to install cask with error handling
install_cask() {
    local cask="$1"
    local description="$2"
    
    if ! command_exists "$(echo "$cask" | sed 's/^font-//')"; then
        print_step "Installing $description..."
        if brew install --cask "$cask" >> "$LOG_FILE" 2>&1; then
            print_success "$description installed successfully"
        else
            print_error "Failed to install $description"
            return 1
        fi
    else
        print_success "$description already installed"
    fi
}

# =============================================================================
# INSTALLATION FUNCTIONS
# =============================================================================

# Function to install Homebrew
install_homebrew() {
    print_header "Installing Homebrew Package Manager"
    
    if ! command_exists brew; then
        print_step "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" >> "$LOG_FILE" 2>&1
        
        # Add Homebrew to PATH for Apple Silicon Macs
        if [[ "$(uname -m)" == "arm64" ]]; then
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
        
        print_success "Homebrew installed successfully"
    else
        print_success "Homebrew already installed"
    fi
    
    # Update Homebrew
    print_step "Updating Homebrew..."
    brew update >> "$LOG_FILE" 2>&1
    print_success "Homebrew updated"
}

# Function to install Oh My Zsh
install_ohmyzsh() {
    print_header "Installing Oh My Zsh Framework"
    
    if ! directory_exists "$HOME/.oh-my-zsh"; then
        print_step "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended >> "$LOG_FILE" 2>&1
        print_success "Oh My Zsh installed successfully"
    else
        print_success "Oh My Zsh already installed"
    fi
}

# Function to install Powerlevel10k theme
install_powerlevel10k() {
    print_header "Installing Powerlevel10k Theme"
    
    local theme_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    
    if ! directory_exists "$theme_dir"; then
        print_step "Installing Powerlevel10k theme..."
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$theme_dir" >> "$LOG_FILE" 2>&1
        print_success "Powerlevel10k theme installed successfully"
    else
        print_success "Powerlevel10k theme already installed"
    fi
}

# Function to install development tools
install_dev_tools() {
    print_header "Installing Development Tools"
    
    local dev_tools=(
        "node:Node.js"
        "python:Python"
        "go:Go"
        "ruby:Ruby"
        "openjdk:OpenJDK"
    )
    
    for tool in "${dev_tools[@]}"; do
        IFS=':' read -r package description <<< "$tool"
        install_package "$package" "$description"
    done
}

# Function to install Rust
install_rust() {
    print_header "Installing Rust Programming Language"
    
    if ! command_exists rustc; then
        print_step "Installing Rust..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y >> "$LOG_FILE" 2>&1
        source "$HOME/.cargo/env"
        print_success "Rust installed successfully"
    else
        print_success "Rust already installed"
    fi
}

# Function to install cloud tools
install_cloud_tools() {
    print_header "Installing Cloud Development Tools"
    
    local cloud_tools=(
        "awscli:AWS CLI"
        "google-cloud-sdk:Google Cloud SDK"
        "azure-cli:Azure CLI"
        "terraform:Terraform"
        "helm:Helm"
    )
    
    for tool in "${cloud_tools[@]}"; do
        IFS=':' read -r package description <<< "$tool"
        install_package "$package" "$description"
    done
}

# Function to install container tools
install_container_tools() {
    print_header "Installing Container & Orchestration Tools"
    
    # Install kubectl
    install_package "kubectl" "kubectl"
    
    # Install kubectx
    install_package "kubectx" "kubectx"
    
    # Install Docker Desktop
    if ! command_exists docker; then
        print_step "Installing Docker Desktop..."
        if brew install --cask docker >> "$LOG_FILE" 2>&1; then
            print_success "Docker Desktop installed successfully"
            print_warning "Please start Docker Desktop manually after installation"
        else
            print_error "Failed to install Docker Desktop"
        fi
    else
        print_success "Docker already installed"
    fi
}

# Function to install productivity tools
install_productivity_tools() {
    print_header "Installing Productivity Tools"
    
    local productivity_tools=(
        "fzf:Fuzzy Finder (fzf)"
        "fd:Fast Directory Traversal (fd)"
        "bat:Better Cat (bat)"
        "ripgrep:Fast Grep (ripgrep)"
        "exa:Better LS (exa)"
        "jq:JSON Processor (jq)"
        "htop:Process Viewer (htop)"
        "gh:GitHub CLI"
    )
    
    for tool in "${productivity_tools[@]}"; do
        IFS=':' read -r package description <<< "$tool"
        install_package "$package" "$description"
    done
}

# Function to install Nerd Fonts
install_nerd_fonts() {
    print_header "Installing Nerd Fonts"
    
    local nerd_fonts=(
        "font-jetbrains-mono-nerd-font:JetBrains Mono Nerd Font"
        "font-meslo-lg-nerd-font:Meslo LG Nerd Font"
    )
    
    for font in "${nerd_fonts[@]}"; do
        IFS=':' read -r cask description <<< "$font"
        install_cask "$cask" "$description"
    done
}

# Function to install Oh My Zsh plugins
install_ohmyzsh_plugins() {
    print_header "Installing Oh My Zsh Plugins"
    
    local plugins=(
        "zsh-syntax-highlighting:https://github.com/zsh-users/zsh-syntax-highlighting.git"
        "zsh-autosuggestions:https://github.com/zsh-users/zsh-autosuggestions"
        "zsh-history-substring-search:https://github.com/zsh-users/zsh-history-substring-search"
        "zsh-completions:https://github.com/zsh-users/zsh-completions"
    )
    
    for plugin in "${plugins[@]}"; do
        IFS=':' read -r plugin_name plugin_url <<< "$plugin"
        local plugin_path="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$plugin_name"
        
        if ! directory_exists "$plugin_path"; then
            print_step "Installing $plugin_name plugin..."
            if git clone "$plugin_url" "$plugin_path" >> "$LOG_FILE" 2>&1; then
                print_success "$plugin_name plugin installed successfully"
            else
                print_error "Failed to install $plugin_name plugin"
            fi
        else
            print_success "$plugin_name plugin already installed"
        fi
    done
}

# Function to install Node Version Manager (nvm)
install_nvm() {
    print_header "Installing Node Version Manager (nvm)"
    
    if ! directory_exists "$HOME/.nvm"; then
        print_step "Installing nvm..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash >> "$LOG_FILE" 2>&1
        print_success "nvm installed successfully"
    else
        print_success "nvm already installed"
    fi
}

# Function to install Python tools
install_python_tools() {
    print_header "Installing Python Development Tools"
    
    if command_exists pip3; then
        print_step "Installing Python virtual environment tools..."
        pip3 install virtualenv poetry >> "$LOG_FILE" 2>&1
        print_success "Python tools installed successfully"
    else
        print_warning "pip3 not found, skipping Python tools installation"
    fi
}

# Function to setup configuration
setup_configuration() {
    print_header "Setting Up Configuration"
    
    # Create custom directory
    print_step "Creating custom configuration directory..."
    mkdir -p ~/.zshrc.d
    print_success "Custom directory created: ~/.zshrc.d"
    
    # Backup existing zshrc
    create_backup "$HOME/.zshrc" "zshrc"
    
    # Copy new zshrc
    print_step "Applying new ZSH configuration..."
    cp "$SCRIPT_DIR/config" "$HOME/.zshrc"
    print_success "New ZSH configuration applied"
    
    # Setup cloud configurations
    print_step "Setting up cloud configurations..."
    mkdir -p ~/.aws
    
    if command_exists gcloud; then
        gcloud config configurations create dev 2>/dev/null || true
        gcloud config configurations create prod 2>/dev/null || true
        print_success "GCP configurations created"
    fi
    
    print_success "Configuration setup completed"
}

# Function to display post-installation instructions
display_post_install_instructions() {
    echo ""
    echo "🎉 ${BOLD}Installation completed successfully!${NC}"
    echo "================================================"
    echo ""
    echo "${CYAN}📋 Next Steps:${NC}"
    echo "1. ${BOLD}Restart your terminal${NC} or run: ${GREEN}source ~/.zshrc${NC}"
    echo "2. ${BOLD}Configure Powerlevel10k:${NC} ${GREEN}p10k configure${NC}"
    echo "3. ${BOLD}Set up cloud credentials:${NC}"
    echo "   • AWS: ${GREEN}aws configure${NC}"
    echo "   • GCP: ${GREEN}gcloud init${NC}"
    echo "   • Azure: ${GREEN}az login${NC}"
    echo ""
    echo "${CYAN}🔧 Test Your Installation:${NC}"
    echo "   • Test aliases: ${GREEN}ll${NC}, ${GREEN}gs${NC}, ${GREEN}k version${NC}"
    echo "   • Test cloud tools: ${GREEN}aws --version${NC}, ${GREEN}gcloud --version${NC}"
    echo "   • Test productivity: ${GREEN}fzf${NC}, ${GREEN}bat --version${NC}"
    echo ""
    echo "${CYAN}📚 Documentation:${NC}"
    echo "   • Read ${GREEN}README.md${NC} for feature overview"
    echo "   • Read ${GREEN}INSTALLATION_GUIDE.md${NC} for detailed instructions"
    echo ""
    echo "${YELLOW}⚠️  Important Notes:${NC}"
    echo "   • Log file: ${GREEN}$LOG_FILE${NC}"
    echo "   • Backup directory: ${GREEN}$BACKUP_DIR${NC}"
    echo "   • Custom configs: ${GREEN}~/.zshrc.d/${NC}"
    echo ""
    echo "${PURPLE}🚀 Happy coding!${NC}"
}

# Function to check system requirements
check_system_requirements() {
    print_header "Checking System Requirements"
    
    # Check OS
    if [[ "$OSTYPE" != "darwin"* ]]; then
        print_error "This script is designed for macOS. Please use the manual installation guide for other systems."
        exit 1
    fi
    
    # Check macOS version
    local macos_version=$(sw_vers -productVersion)
    print_success "macOS version: $macos_version"
    
    # Check available disk space (at least 5GB)
    local available_space=$(df -h / | awk 'NR==2 {print $4}' | sed 's/G//')
    if [ "$available_space" -lt 5 ]; then
        print_warning "Low disk space available: ${available_space}GB. Recommended: at least 5GB"
    else
        print_success "Available disk space: ${available_space}GB"
    fi
    
    # Check internet connection
    if ping -c 1 google.com >/dev/null 2>&1; then
        print_success "Internet connection available"
    else
        print_error "No internet connection available"
        exit 1
    fi
}

# =============================================================================
# MAIN INSTALLATION FUNCTION
# =============================================================================

main() {
    # Initialize log file
    echo "=== Advanced ZSH Configuration Setup Log ===" > "$LOG_FILE"
    echo "Started at: $(date)" >> "$LOG_FILE"
    echo "===========================================" >> "$LOG_FILE"
    
    print_header "Advanced ZSH Configuration Setup"
    echo "================================================"
    print_status "Log file: $LOG_FILE"
    print_status "Backup directory: $BACKUP_DIR"
    echo ""
    
    # Check system requirements
    check_system_requirements
    
    # Install components
    install_homebrew
    install_ohmyzsh
    install_powerlevel10k
    install_dev_tools
    install_rust
    install_cloud_tools
    install_container_tools
    install_productivity_tools
    install_nerd_fonts
    install_ohmyzsh_plugins
    install_nvm
    install_python_tools
    setup_configuration
    
    # Display completion message
    display_post_install_instructions
    
    # Log completion
    echo "Installation completed at: $(date)" >> "$LOG_FILE"
}

# =============================================================================
# SCRIPT EXECUTION
# =============================================================================

# Check if script is being sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Script is being executed directly
    main "$@"
else
    print_error "This script should be executed directly, not sourced"
    exit 1
fi 