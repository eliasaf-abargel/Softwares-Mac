# 🚀 Advanced ZSH Configuration Suite

A comprehensive, production-ready ZSH configuration designed for modern cloud-native development workflows. This setup provides an enhanced terminal experience with integrated support for AWS, GCP, Azure, Docker, Kubernetes, and more.

## ✨ Features

### 🎨 **Visual Experience**
- **Powerlevel10k** theme with instant prompt for lightning-fast startup
- Rich icon support with Nerd Fonts integration
- Context-aware prompt showing cloud environments, git status, and more
- Syntax highlighting and autosuggestions

### ☁️ **Cloud Development**
- **AWS CLI** with profile switching and resource management
- **Google Cloud SDK** with project configuration
- **Azure CLI** with subscription management
- **Terraform** integration with workspace support
- **Helm** for Kubernetes package management

### 🐳 **Container & Orchestration**
- **Docker** and **Docker Compose** with smart aliases
- **Kubernetes** with context and namespace management
- **kubectx** and **kubens** for cluster switching

### 🛠️ **Development Tools**
- **Git** with enhanced workflow aliases
- **Node.js** with nvm integration
- **Python** with virtual environments
- **Go** and **Rust** development support
- **Homebrew** package management

### 🔍 **Productivity Enhancements**
- **FZF** fuzzy finder integration
- **Z** smart directory jumping
- **History** search and substring search
- **Auto-completion** for all major tools
- **Smart project detection** and setup

## 📁 File Structure

```
zshrc/
├── README.md                 # This file - comprehensive documentation
├── config                    # Main ZSH configuration file
├── p10k-config.zsh          # Powerlevel10k theme configuration
├── setup.sh                  # Automated installation script
└── INSTALLATION_GUIDE.md    # Detailed installation instructions
```

## 🚀 Quick Start

### Option 1: Automated Installation (Recommended)
```bash
# Clone or download this repository
cd zshrc
chmod +x setup.sh
./setup.sh
```

### Option 2: Manual Installation
1. Follow the detailed instructions in [INSTALLATION_GUIDE.md](./INSTALLATION_GUIDE.md)
2. Copy `config` to `~/.zshrc`
3. Configure Powerlevel10k: `p10k configure`

## 🎯 Key Features Explained

### Cloud Environment Management
```bash
# Switch between cloud environments
switch-env aws-dev      # Switch to AWS development profile
switch-env gcp-prod     # Switch to GCP production project
switch-env azure-dev    # Switch to Azure development subscription

# Quick resource listing
cloud-resources aws     # List AWS resources
cloud-resources gcp     # List GCP resources
cloud-resources azure   # List Azure resources
```

### Smart Project Detection
```bash
# Navigate to any project and auto-setup
cd my-node-project
project  # Automatically runs: npm install && npm run dev

cd my-python-project
project  # Automatically runs: python -m venv venv && pip install -r requirements.txt
```

### Enhanced Git Workflow
```bash
gs    # git status
ga    # git add
gc    # git commit
gp    # git push
gl    # git log --oneline
gco   # git checkout
gcb   # git checkout -b
smartcommit  # Smart commit with auto-message
smartpush    # Smart push with upstream tracking
```

### Docker & Kubernetes Management
```bash
# Docker shortcuts
dps     # docker ps
dex     # docker exec -it
dlogs   # docker logs -f
dclean  # docker system prune -f

# Kubernetes shortcuts
k       # kubectl
kg      # kubectl get
kd      # kubectl describe
kl      # kubectl logs -f
kx      # kubectx (switch context)
kn      # kubens (switch namespace)
kctx    # Show current context info
```

### Terraform Workflow
```bash
tf      # terraform
tfi     # terraform init
tfp     # terraform plan
tfa     # terraform apply
tfd     # terraform destroy
tfo     # terraform output
tfs     # terraform state
```

## 🎨 Prompt Features

The Powerlevel10k prompt displays:
- **Git status** with branch, changes, and remote info
- **Cloud environment** indicators (AWS/GCP/Azure)
- **Kubernetes context** and namespace
- **Docker** status when in containerized projects
- **Python virtual environment** indicator
- **Node.js version** when using nvm
- **Exit code** for failed commands
- **Execution time** for long-running commands

## 🔧 Configuration Files

### Main Configuration (`config`)
- Core ZSH settings and environment variables
- Plugin management and loading
- Aliases and functions for all tools
- Cloud environment configurations
- Completion and key binding setup

### Powerlevel10k Configuration (`p10k-config.zsh`)
- Custom prompt segments and styling
- Icon and color schemes
- Context-specific information display
- Performance optimizations

## 🛠️ Customization

### Adding Custom Aliases
Add to `~/.zshrc.d/custom-aliases.zsh`:
```bash
# Your custom aliases here
alias myalias='my-command'
```

### Adding Custom Functions
Add to `~/.zshrc.d/custom-functions.zsh`:
```bash
# Your custom functions here
myfunction() {
    echo "Custom function"
}
```

### Modifying Cloud Profiles
Edit the `switch-env` function in the main config to add your specific cloud profiles.

## 🔍 Troubleshooting

### Common Issues

**Powerlevel10k instant prompt warnings:**
- Ensure no output during ZSH initialization
- Check for commands that produce output in `.zshrc`

**Missing icons:**
- Install Nerd Fonts: `brew install --cask font-jetbrains-mono-nerd-font`
- Configure terminal font to use Nerd Font

**Plugin not working:**
- Verify plugin installation: `ls ~/.oh-my-zsh/custom/plugins/`
- Check plugin name in config file

**Completion issues:**
```bash
rm ~/.zcompdump*
exec zsh
```

### Font Configuration

For proper icon display, configure your terminal to use a Nerd Font:

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

## 📚 Resources

- [Oh My Zsh Documentation](https://ohmyz.sh/)
- [Powerlevel10k Documentation](https://github.com/romkatv/powerlevel10k)
- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/)
- [Google Cloud SDK Documentation](https://cloud.google.com/sdk/docs)
- [Azure CLI Documentation](https://docs.microsoft.com/en-us/cli/azure/)
- [Terraform Documentation](https://www.terraform.io/docs)
- [Kubernetes Documentation](https://kubernetes.io/docs/)

## 🤝 Contributing

This configuration is designed to be easily customizable. Feel free to:
- Add new aliases and functions
- Modify cloud environment configurations
- Enhance the prompt with additional segments
- Add support for new tools and frameworks

## 📄 License

This configuration is provided as-is for educational and productivity purposes. Feel free to use and modify according to your needs.

---

**Happy coding! 🚀** 