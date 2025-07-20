#!/bin/bash

# 🚀 ZSH Advanced Configuration Setup Script
# This script will install all required tools and plugins

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

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

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install Homebrew if not exists
install_homebrew() {
    if ! command_exists brew; then
        print_status "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        print_success "Homebrew installed successfully"
    else
        print_success "Homebrew already installed"
    fi
}

# Function to install Oh My Zsh if not exists
install_ohmyzsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        print_status "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        print_success "Oh My Zsh installed successfully"
    else
        print_success "Oh My Zsh already installed"
    fi
}

# Function to install Powerlevel10k theme
install_powerlevel10k() {
    if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
        print_status "Installing Powerlevel10k theme..."
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
        print_success "Powerlevel10k theme installed successfully"
    else
        print_success "Powerlevel10k theme already installed"
    fi
}

# Function to install core development tools
install_dev_tools() {
    print_status "Installing development tools..."
    
    local tools=("node" "python" "go" "ruby" "openjdk")
    
    for tool in "${tools[@]}"; do
        if ! command_exists "$tool"; then
            print_status "Installing $tool..."
            brew install "$tool"
            print_success "$tool installed successfully"
        else
            print_success "$tool already installed"
        fi
    done
}

# Function to install Rust
install_rust() {
    if ! command_exists rustc; then
        print_status "Installing Rust..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        source "$HOME/.cargo/env"
        print_success "Rust installed successfully"
    else
        print_success "Rust already installed"
    fi
}

# Function to install cloud tools
install_cloud_tools() {
    print_status "Installing cloud tools..."
    
    local cloud_tools=("awscli" "google-cloud-sdk" "azure-cli" "terraform" "helm")
    
    for tool in "${cloud_tools[@]}"; do
        if ! command_exists "$tool"; then
            print_status "Installing $tool..."
            brew install "$tool"
            print_success "$tool installed successfully"
        else
            print_success "$tool already installed"
        fi
    done
}

# Function to install container tools
install_container_tools() {
    print_status "Installing container tools..."
    
    # Install kubectl
    if ! command_exists kubectl; then
        print_status "Installing kubectl..."
        brew install kubectl
        print_success "kubectl installed successfully"
    else
        print_success "kubectl already installed"
    fi
    
    # Install kubectx
    if ! command_exists kubectx; then
        print_status "Installing kubectx..."
        brew install kubectx
        print_success "kubectx installed successfully"
    else
        print_success "kubectx already installed"
    fi
    
    # Install Docker Desktop
    if ! command_exists docker; then
        print_status "Installing Docker Desktop..."
        brew install --cask docker
        print_success "Docker Desktop installed successfully"
        print_warning "Please start Docker Desktop manually"
    else
        print_success "Docker already installed"
    fi
}

# Function to install additional tools
install_additional_tools() {
    print_status "Installing additional tools..."
    
    local additional_tools=("fzf" "fd" "bat" "ripgrep" "exa" "jq" "htop" "gh")
    
    for tool in "${additional_tools[@]}"; do
        if ! command_exists "$tool"; then
            print_status "Installing $tool..."
            brew install "$tool"
            print_success "$tool installed successfully"
        else
            print_success "$tool already installed"
        fi
    done
}

# Function to install Oh My Zsh plugins
install_ohmyzsh_plugins() {
    print_status "Installing Oh My Zsh plugins..."
    
    local plugins=(
        "zsh-syntax-highlighting:https://github.com/zsh-users/zsh-syntax-highlighting.git"
        "zsh-autosuggestions:https://github.com/zsh-users/zsh-autosuggestions"
        "zsh-history-substring-search:https://github.com/zsh-users/zsh-history-substring-search"
        "zsh-completions:https://github.com/zsh-users/zsh-completions"
    )
    
    for plugin in "${plugins[@]}"; do
        IFS=':' read -r plugin_name plugin_url <<< "$plugin"
        local plugin_path="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$plugin_name"
        
        if [ ! -d "$plugin_path" ]; then
            print_status "Installing $plugin_name..."
            git clone "$plugin_url" "$plugin_path"
            print_success "$plugin_name installed successfully"
        else
            print_success "$plugin_name already installed"
        fi
    done
}

# Function to install nvm
install_nvm() {
    if [ ! -d "$HOME/.nvm" ]; then
        print_status "Installing Node Version Manager (nvm)..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
        print_success "nvm installed successfully"
    else
        print_success "nvm already installed"
    fi
}

# Function to install Python tools
install_python_tools() {
    print_status "Installing Python tools..."
    
    if command_exists pip3; then
        pip3 install virtualenv poetry
        print_success "Python tools installed successfully"
    else
        print_warning "pip3 not found, skipping Python tools installation"
    fi
}

# Function to create custom directory
create_custom_directory() {
    print_status "Creating custom configuration directory..."
    mkdir -p ~/.zshrc.d
    print_success "Custom directory created: ~/.zshrc.d"
}

# Function to backup existing zshrc
backup_zshrc() {
    if [ -f "$HOME/.zshrc" ]; then
        print_status "Backing up existing .zshrc..."
        cp "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
        print_success "Backup created: $HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
    fi
}

# Function to copy new zshrc
copy_zshrc() {
    print_status "Copying new zshrc configuration..."
    cp "$(dirname "$0")/config" "$HOME/.zshrc"
    print_success "New zshrc configuration copied"
}

# Function to setup cloud configurations
setup_cloud_configs() {
    print_status "Setting up cloud configurations..."
    
    # Create AWS profiles directory
    mkdir -p ~/.aws
    
    # Create GCP configurations
    if command_exists gcloud; then
        print_status "Setting up GCP configurations..."
        gcloud config configurations create dev 2>/dev/null || true
        gcloud config configurations create prod 2>/dev/null || true
    fi
    
    print_success "Cloud configurations setup completed"
}

# Function to display post-installation instructions
display_post_install_instructions() {
    echo ""
    echo "🎉 Installation completed successfully!"
    echo ""
    echo "📋 Next steps:"
    echo "1. Restart your terminal or run: source ~/.zshrc"
    echo "2. Configure Powerlevel10k: p10k configure"
    echo "3. Set up cloud credentials:"
    echo "   - AWS: aws configure"
    echo "   - GCP: gcloud init"
    echo "   - Azure: az login"
    echo ""
    echo "🔧 Test your installation:"
    echo "   - Test aliases: ll, gs, k version"
    echo "   - Test cloud tools: aws --version, gcloud --version, az --version"
    echo ""
    echo "📚 Check the INSTALLATION_GUIDE.md for detailed usage instructions"
}

# Main installation function
main() {
    echo "🚀 Starting ZSH Advanced Configuration Setup..."
    echo "================================================"
    
    # Check if running on macOS
    if [[ "$OSTYPE" != "darwin"* ]]; then
        print_error "This script is designed for macOS. Please use the manual installation guide for other systems."
        exit 1
    fi
    
    # Install Homebrew
    install_homebrew
    
    # Update Homebrew
    print_status "Updating Homebrew..."
    brew update
    
    # Install Oh My Zsh
    install_ohmyzsh
    
    # Install Powerlevel10k
    install_powerlevel10k
    
    # Install development tools
    install_dev_tools
    
    # Install Rust
    install_rust
    
    # Install cloud tools
    install_cloud_tools
    
    # Install container tools
    install_container_tools
    
    # Install additional tools
    install_additional_tools
    
    # Install Oh My Zsh plugins
    install_ohmyzsh_plugins
    
    # Install nvm
    install_nvm
    
    # Install Python tools
    install_python_tools
    
    # Create custom directory
    create_custom_directory
    
    # Backup existing zshrc
    backup_zshrc
    
    # Copy new zshrc
    copy_zshrc
    
    # Setup cloud configurations
    setup_cloud_configs
    
    # Display post-installation instructions
    display_post_install_instructions
}

# Run main function
main "$@" 