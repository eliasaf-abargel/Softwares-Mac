# 🚀 ZSH Advanced Configuration - Installation Guide

## 📋 Prerequisites

### 1. Install Homebrew (if not already installed)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Install Oh My Zsh (if not already installed)
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 3. Install Powerlevel10k Theme
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

## 🔧 Core Tools Installation

### Development Tools
```bash
# Node.js and npm
brew install node

# Python
brew install python

# Go
brew install go

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Ruby
brew install ruby

# Java
brew install openjdk
```

### Cloud Tools
```bash
# AWS CLI
brew install awscli

# Google Cloud SDK
brew install google-cloud-sdk

# Azure CLI
brew install azure-cli

# Terraform
brew install terraform

# Helm
brew install helm
```

### Container Tools
```bash
# Docker Desktop
brew install --cask docker

# kubectl
brew install kubectl

# kubectx and kubens
brew install kubectx
```

## 📦 Oh My Zsh Plugins Installation

### Required Plugins
```bash
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
```

### Optional but Recommended Plugins
```bash
# fzf (fuzzy finder)
brew install fzf

# fd (fast directory traversal)
brew install fd

# bat (better cat)
brew install bat

# ripgrep (fast grep)
brew install ripgrep

# exa (better ls)
brew install exa

# jq (JSON processor)
brew install jq

# htop (process viewer)
brew install htop
```

## 🎨 Additional Tools

### Node Version Manager (nvm)
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
```

### Python Virtual Environment
```bash
# pip is included with Python
pip3 install virtualenv
pip3 install poetry
```

### GitHub CLI
```bash
brew install gh
```

## 🔐 Cloud Configuration

### AWS Setup
```bash
# Configure AWS CLI
aws configure

# Set up multiple profiles for different environments
aws configure --profile dev
aws configure --profile prod
```

### GCP Setup
```bash
# Initialize gcloud
gcloud init

# Set up application default credentials
gcloud auth application-default login

# Create multiple configurations
gcloud config configurations create dev
gcloud config configurations create prod
```

### Azure Setup
```bash
# Login to Azure
az login

# Set subscription
az account set --subscription <subscription-id>
```

## 🎯 Quick Setup Script

Create a setup script to automate the installation:

```bash
#!/bin/bash

echo "🚀 Installing ZSH Advanced Configuration..."

# Update Homebrew
brew update

# Install core tools
echo "📦 Installing core tools..."
brew install node python go rust ruby openjdk

# Install cloud tools
echo "☁️ Installing cloud tools..."
brew install awscli google-cloud-sdk azure-cli terraform helm kubectl kubectx

# Install additional tools
echo "🛠️ Installing additional tools..."
brew install fzf fd bat ripgrep exa jq htop gh

# Install Oh My Zsh plugins
echo "🔌 Installing Oh My Zsh plugins..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

# Install nvm
echo "📦 Installing Node Version Manager..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Install Python tools
echo "🐍 Installing Python tools..."
pip3 install virtualenv poetry

echo "✅ Installation complete!"
echo "🔄 Please restart your terminal or run: source ~/.zshrc"
```

## 🔄 Post-Installation Steps

1. **Restart your terminal** or run `source ~/.zshrc`

2. **Configure Powerlevel10k**:
   ```bash
   p10k configure
   ```

3. **Set up cloud credentials**:
   - AWS: `aws configure`
   - GCP: `gcloud init`
   - Azure: `az login`

4. **Create custom directory for additional configs**:
   ```bash
   mkdir -p ~/.zshrc.d
   ```

5. **Test the configuration**:
   ```bash
   # Test cloud tools
   aws --version
   gcloud --version
   az --version
   
   # Test aliases
   ll
   gs
   k version
   ```

## 🎯 Usage Examples

### Cloud Environment Switching
```bash
# Switch between cloud environments
switch-env aws-dev
switch-env gcp-prod
switch-env azure-dev
```

### Project Auto-Detection
```bash
# Navigate to a project and auto-setup
cd my-node-project
project  # Will run npm install && npm run dev
```

### Quick Resource Management
```bash
# List cloud resources
cloud-resources aws
cloud-resources gcp
cloud-resources azure

# Docker management
dmanage start
dmanage logs
dmanage stop
```

### Kubernetes Context Management
```bash
# View current context
kctx

# Switch contexts
kx my-cluster
kn my-namespace
```

## 🔧 Troubleshooting

### Plugin Issues
If plugins don't work, ensure they're properly installed:
```bash
ls ~/.oh-my-zsh/custom/plugins/
```

### Completion Issues
If completions don't work:
```bash
rm ~/.zcompdump*
exec zsh
```

### Path Issues
If tools aren't found, check your PATH:
```bash
echo $PATH
which aws
which gcloud
which az
```

## 📚 Additional Resources

- [Oh My Zsh Documentation](https://ohmyz.sh/)
- [Powerlevel10k Documentation](https://github.com/romkatv/powerlevel10k)
- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/)
- [Google Cloud SDK Documentation](https://cloud.google.com/sdk/docs)
- [Azure CLI Documentation](https://docs.microsoft.com/en-us/cli/azure/)
- [Terraform Documentation](https://www.terraform.io/docs)
- [Kubernetes Documentation](https://kubernetes.io/docs/) 