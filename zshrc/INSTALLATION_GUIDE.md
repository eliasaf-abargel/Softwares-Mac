# 🚀 Advanced ZSH Configuration - Complete Installation Guide

A comprehensive guide for setting up a production-ready ZSH environment with cloud-native development tools, enhanced productivity features, and a beautiful terminal experience.

## 📋 Table of Contents

1. [Prerequisites](#-prerequisites)
2. [Quick Installation](#-quick-installation)
3. [Manual Installation](#-manual-installation)
4. [Post-Installation Setup](#-post-installation-setup)
5. [Configuration Details](#-configuration-details)
6. [Usage Examples](#-usage-examples)
7. [Troubleshooting](#-troubleshooting)
8. [Customization](#-customization)

## 🎯 Prerequisites

### System Requirements
- **macOS** (10.15 or later recommended)
- **Administrator privileges** for software installation
- **Internet connection** for downloading tools and packages

### Required Software
- **Homebrew** (package manager)
- **Git** (version control)
- **Terminal application** (Terminal.app, iTerm2, Warp, VS Code, etc.)

## ⚡ Quick Installation

### Automated Setup (Recommended)
```bash
# 1. Navigate to the zshrc directory
cd /path/to/your/zshrc

# 2. Make setup script executable
chmod +x setup.sh

# 3. Run the automated installation
./setup.sh

# 4. Restart your terminal or reload configuration
source ~/.zshrc
```

The automated script will:
- ✅ Install all required tools and dependencies
- ✅ Configure Oh My Zsh with Powerlevel10k theme
- ✅ Set up cloud development environments
- ✅ Install productivity plugins and tools
- ✅ Create backup of existing configuration
- ✅ Apply the new configuration automatically

## 🔧 Manual Installation

### Step 1: Install Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Step 2: Install Oh My Zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Step 3: Install Powerlevel10k Theme
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### Step 4: Install Core Development Tools
```bash
# Update Homebrew
brew update

# Install programming languages and tools
brew install node python go rust ruby openjdk

# Install cloud development tools
brew install awscli google-cloud-sdk azure-cli terraform helm

# Install container tools
brew install kubectl kubectx
brew install --cask docker

# Install productivity tools
brew install fzf fd bat ripgrep exa jq htop gh
```

### Step 5: Install Oh My Zsh Plugins
```bash
# Essential plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
```

### Step 6: Install Additional Tools
```bash
# Node Version Manager (nvm)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Python virtual environment tools
pip3 install virtualenv poetry

# Rust (if not installed via Homebrew)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Step 7: Apply Configuration
```bash
# Backup existing configuration
cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d_%H%M%S)

# Copy new configuration
cp /path/to/your/zshrc/config ~/.zshrc

# Create custom configuration directory
mkdir -p ~/.zshrc.d
```

## 🔧 Post-Installation Setup

### 1. Configure Powerlevel10k
```bash
# Restart terminal or reload configuration
source ~/.zshrc

# Run Powerlevel10k configuration wizard
p10k configure
```

**Configuration Tips:**
- Choose **Yes** for instant prompt
- Select **Unicode** for character set
- Choose **MesloLGS NF** or **JetBrainsMonoNL Nerd Font** for font
- Enable **Git status** and **Cloud environment** segments
- Customize colors to your preference

### 2. Install Nerd Fonts (Required for Icons)
```bash
# Install Nerd Fonts
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-meslo-lg-nerd-font
```

### 3. Configure Terminal Fonts

**VS Code:**
```json
{
    "terminal.integrated.fontFamily": "JetBrainsMonoNL Nerd Font"
}
```

**Warp:**
- Settings → Terminal → Font Family: `JetBrainsMonoNL Nerd Font`

**IntelliJ IDEA:**
- Settings → Editor → Font → Font Family: `JetBrainsMonoNL Nerd Font`

**iTerm2:**
- Preferences → Profiles → Text → Font: `JetBrainsMonoNL Nerd Font`

### 4. Set Up Cloud Credentials

**AWS Configuration:**
```bash
aws configure
aws configure --profile dev
aws configure --profile prod
```

**Google Cloud Configuration:**
```bash
gcloud init
gcloud auth application-default login
gcloud config configurations create dev
gcloud config configurations create prod
```

**Azure Configuration:**
```bash
az login
az account set --subscription <your-subscription-id>
```

## 📋 Configuration Details

### What's Included

#### 🎨 **Visual Enhancements**
- **Powerlevel10k** theme with instant prompt
- **Nerd Fonts** integration for rich icons
- **Syntax highlighting** for commands
- **Auto-suggestions** based on history
- **Context-aware prompt** with environment indicators

#### ☁️ **Cloud Development Tools**
- **AWS CLI** with profile management
- **Google Cloud SDK** with project switching
- **Azure CLI** with subscription management
- **Terraform** with workspace support
- **Helm** for Kubernetes package management

#### 🐳 **Container & Orchestration**
- **Docker** and **Docker Compose** integration
- **Kubernetes** with context management
- **kubectx** and **kubens** for cluster switching
- **Smart container management** functions

#### 🛠️ **Development Workflow**
- **Enhanced Git** aliases and functions
- **Multi-language support** (Node.js, Python, Go, Rust)
- **Project auto-detection** and setup
- **Smart commit** and push functions

#### 🔍 **Productivity Features**
- **FZF** fuzzy finder integration
- **Z** smart directory jumping
- **History search** and substring search
- **Auto-completion** for all major tools
- **Custom aliases** for common operations

### Key Functions

#### Cloud Environment Management
```bash
switch-env aws-dev      # Switch to AWS development
switch-env gcp-prod     # Switch to GCP production
switch-env azure-dev    # Switch to Azure development

cloud-resources aws     # List AWS resources
cloud-resources gcp     # List GCP resources
cloud-resources azure   # List Azure resources
```

#### Project Management
```bash
project                # Auto-detect and setup project
mkcd directory-name    # Create directory and navigate
smartcommit           # Smart commit with auto-message
smartpush             # Smart push with upstream tracking
```

#### Container Management
```bash
dmanage start         # Start Docker Compose services
dmanage stop          # Stop Docker Compose services
dmanage logs          # View Docker Compose logs
kctx                  # Show Kubernetes context info
```

## 🎯 Usage Examples

### Daily Development Workflow

```bash
# 1. Start your day
switch-env aws-dev     # Switch to development environment

# 2. Navigate to project
cd ~/projects/my-app
project               # Auto-setup project dependencies

# 3. Development workflow
gs                    # Check git status
ga .                  # Stage all changes
smartcommit          # Commit with smart message
smartpush            # Push to remote

# 4. Container operations
dmanage start        # Start development environment
dmanage logs         # Monitor application logs

# 5. Cloud operations
cloud-resources aws  # Check AWS resources
```

### Kubernetes Operations

```bash
# Context management
kctx                  # View current context
kx production-cluster # Switch to production cluster
kn monitoring         # Switch to monitoring namespace

# Resource management
kg pods               # List pods
kd pod my-pod         # Describe pod
kl my-pod             # Follow pod logs
```

### Terraform Workflow

```bash
# Infrastructure management
tfi                   # Initialize Terraform
tfp                   # Plan changes
tfa                   # Apply changes
tfo                   # Show outputs
tfs list              # List state resources
```

## 🔍 Troubleshooting

### Common Issues and Solutions

#### Powerlevel10k Instant Prompt Warnings
**Problem:** Warning about instant prompt during startup
**Solution:**
```bash
# Check for commands that produce output in .zshrc
# Ensure all output is wrapped in conditional blocks
if [[ -z $P9K_INSTANT_PROMPT ]]; then
    echo "This will only show when not using instant prompt"
fi
```

#### Missing Icons in Terminal
**Problem:** Icons appear as squares or missing characters
**Solution:**
```bash
# 1. Verify Nerd Fonts installation
fc-list | grep -i "nerd"

# 2. Configure terminal font
# Use one of these font names:
# - JetBrainsMonoNL Nerd Font
# - MesloLGL Nerd Font
# - MesloLGSDZ Nerd Font Mono
```

#### Plugin Not Working
**Problem:** Plugin functionality not available
**Solution:**
```bash
# 1. Verify plugin installation
ls ~/.oh-my-zsh/custom/plugins/

# 2. Check plugin name in config
# Ensure exact plugin name matches directory name

# 3. Reload configuration
source ~/.zshrc
```

#### Completion Issues
**Problem:** Auto-completion not working
**Solution:**
```bash
# 1. Clear completion cache
rm ~/.zcompdump*

# 2. Restart ZSH
exec zsh

# 3. Verify completion initialization
autoload -Uz compinit
compinit
```

#### Path Issues
**Problem:** Commands not found
**Solution:**
```bash
# 1. Check PATH variable
echo $PATH

# 2. Verify tool installation
which aws
which gcloud
which az

# 3. Reload shell environment
source ~/.zshrc
```

### Performance Optimization

#### Slow Startup
```bash
# 1. Enable instant prompt (already configured)
# 2. Profile startup time
time zsh -i -c exit

# 3. Identify slow plugins
zsh -xv 2>&1 | grep -E "(plugin|source)" | head -20
```

#### Memory Usage
```bash
# Monitor ZSH memory usage
ps aux | grep zsh

# Optimize history settings
# Reduce HISTSIZE if needed
```

## 🛠️ Customization

### Adding Custom Aliases
Create `~/.zshrc.d/custom-aliases.zsh`:
```bash
# Development aliases
alias dev='cd ~/development'
alias docs='cd ~/documents'

# Tool-specific aliases
alias mytool='my-custom-command'
```

### Adding Custom Functions
Create `~/.zshrc.d/custom-functions.zsh`:
```bash
# Custom project setup
myproject() {
    echo "Setting up custom project..."
    # Your custom logic here
}

# Custom deployment function
deploy() {
    echo "Deploying to $1..."
    # Your deployment logic here
}
```

### Modifying Cloud Profiles
Edit the `switch-env` function in `~/.zshrc`:
```bash
switch-env() {
    case $1 in
        "my-aws-dev")
            export AWS_PROFILE=my-dev-profile
            export AWS_DEFAULT_REGION=us-west-2
            echo "Switched to My AWS DEV environment"
            ;;
        # Add your custom profiles here
    esac
}
```

### Custom Prompt Segments
Modify `~/.p10k.zsh` to add custom prompt segments:
```bash
# Add custom segment to prompt
prompt_mysegment() {
    p10k segment -f 208 -i '⭐' -t 'My Custom Info'
}
```

## 📚 Additional Resources

### Documentation
- [Oh My Zsh Documentation](https://ohmyz.sh/)
- [Powerlevel10k Documentation](https://github.com/romkatv/powerlevel10k)
- [ZSH Documentation](https://zsh.sourceforge.io/Doc/)

### Cloud Tools Documentation
- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/)
- [Google Cloud SDK Documentation](https://cloud.google.com/sdk/docs)
- [Azure CLI Documentation](https://docs.microsoft.com/en-us/cli/azure/)
- [Terraform Documentation](https://www.terraform.io/docs)
- [Kubernetes Documentation](https://kubernetes.io/docs/)

### Community Resources
- [ZSH Community](https://github.com/zsh-users)
- [Oh My Zsh Community](https://github.com/ohmyzsh/ohmyzsh)
- [Powerlevel10k Community](https://github.com/romkatv/powerlevel10k)

---

## 🎉 Congratulations!

You now have a fully configured, production-ready ZSH environment with:
- ✅ Enhanced visual experience with Powerlevel10k
- ✅ Complete cloud development toolchain
- ✅ Container and orchestration support
- ✅ Productivity-boosting features
- ✅ Professional development workflow

**Happy coding! 🚀** 