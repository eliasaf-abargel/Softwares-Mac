# 🚀 Softwares-Mac - Advanced Development Environment

A comprehensive collection of professional development tools and configurations for macOS, designed to enhance productivity and streamline cloud-native development workflows.

## 📁 Repository Structure

```
Softwares-Mac/
├── README.md                 # This file - main documentation
├── zshrc/                    # Advanced ZSH configuration suite
│   ├── README.md            # ZSH configuration documentation
│   ├── config               # Main ZSH configuration file
│   ├── p10k-config.zsh      # Powerlevel10k theme configuration
│   ├── setup.sh             # Automated installation script
│   └── INSTALLATION_GUIDE.md # Detailed installation instructions
├── nvim/                     # Neovim configuration
│   ├── init.vim             # Neovim configuration file
│   └── README.md            # Neovim setup documentation
└── sketchybar/               # macOS status bar customization
    ├── sketchybarrc.sh      # Main sketchybar configuration
    ├── colors.sh            # Color scheme definitions
    ├── items/               # Status bar items
    ├── plugins/             # Status bar plugins
    └── README.md            # Sketchybar documentation
```

## 🎯 What's Included

### 🖥️ **Terminal Environment**
- **Advanced ZSH Configuration** with Powerlevel10k theme
- **Cloud development tools** (AWS, GCP, Azure)
- **Container orchestration** (Docker, Kubernetes)
- **Productivity enhancements** (FZF, syntax highlighting, autosuggestions)
- **Smart project detection** and automated setup

### 📝 **Code Editor**
- **Neovim configuration** optimized for modern development
- **Language support** for multiple programming languages
- **Plugin ecosystem** for enhanced productivity

### 🎨 **System Customization**
- **Sketchybar** status bar with rich information display
- **System monitoring** (CPU, memory, disk, network)
- **Development context** indicators
- **Customizable themes** and layouts

## 🚀 Quick Start

### 1. Clone the Repository
```bash
git clone <repository-url>
cd Softwares-Mac
```

### 2. Install ZSH Configuration (Recommended)
```bash
cd zshrc
chmod +x setup.sh
./setup.sh
```

### 3. Configure Neovim
```bash
cd nvim
# Follow the README.md instructions
```

### 4. Setup Sketchybar (Optional)
```bash
cd sketchybar
# Follow the README.md instructions
```

## 📚 Detailed Documentation

### [ZSH Configuration Suite](./zshrc/)
Complete terminal environment with cloud-native development tools, productivity enhancements, and professional workflow automation.

**Features:**
- Powerlevel10k theme with instant prompt
- Cloud environment management (AWS, GCP, Azure)
- Container and orchestration tools
- Smart project detection and setup
- Enhanced Git workflow
- Productivity plugins and utilities

**[📖 Read ZSH Documentation](./zshrc/README.md)**

### [Neovim Configuration](./nvim/)
Modern Vim-based editor configuration optimized for cloud-native development with extensive plugin ecosystem.

**Features:**
- Language server protocol support
- Git integration
- Fuzzy file finding
- Syntax highlighting
- Auto-completion
- Debugging support

**[📖 Read Neovim Documentation](./nvim/README.md)**

### [Sketchybar Status Bar](./sketchybar/)
Customizable macOS status bar with rich system information and development context.

**Features:**
- System resource monitoring
- Development environment indicators
- Customizable themes
- Plugin architecture
- Real-time updates

**[📖 Read Sketchybar Documentation](./sketchybar/README.md)**

## 🛠️ System Requirements

### Minimum Requirements
- **macOS** 10.15 (Catalina) or later
- **Administrator privileges** for software installation
- **Internet connection** for downloading tools and packages
- **8GB RAM** (16GB recommended for development)
- **20GB free disk space**

### Recommended Specifications
- **macOS** 12.0 (Monterey) or later
- **16GB RAM** or more
- **Apple Silicon** (M1/M2) or Intel i5/i7
- **50GB free disk space**
- **High-speed internet** connection

## 🔧 Installation Options

### Option 1: Complete Setup (Recommended)
Install all components for a full development environment:
```bash
# Install ZSH configuration
cd zshrc && ./setup.sh

# Install Neovim configuration
cd ../nvim && # follow README instructions

# Install Sketchybar (optional)
cd ../sketchybar && # follow README instructions
```

### Option 2: Selective Installation
Install only the components you need:
- **ZSH only**: Follow [ZSH installation guide](./zshrc/INSTALLATION_GUIDE.md)
- **Neovim only**: Follow [Neovim setup guide](./nvim/README.md)
- **Sketchybar only**: Follow [Sketchybar setup guide](./sketchybar/README.md)

### Option 3: Manual Configuration
For advanced users who want to customize everything:
- Copy individual configuration files
- Modify settings according to your preferences
- Install dependencies manually

## 🎨 Customization

### ZSH Customization
- Add custom aliases in `~/.zshrc.d/custom-aliases.zsh`
- Add custom functions in `~/.zshrc.d/custom-functions.zsh`
- Modify cloud profiles in the main config
- Customize Powerlevel10k theme

### Neovim Customization
- Modify `init.vim` for plugin configuration
- Add custom key mappings
- Configure language-specific settings
- Customize color schemes

### Sketchybar Customization
- Modify `sketchybarrc.sh` for layout changes
- Customize colors in `colors.sh`
- Add custom items in `items/` directory
- Create custom plugins in `plugins/` directory

## 🔍 Troubleshooting

### Common Issues

**ZSH Configuration:**
- [Powerlevel10k instant prompt warnings](./zshrc/INSTALLATION_GUIDE.md#powerlevel10k-instant-prompt-warnings)
- [Missing icons in terminal](./zshrc/INSTALLATION_GUIDE.md#missing-icons-in-terminal)
- [Plugin not working](./zshrc/INSTALLATION_GUIDE.md#plugin-not-working)

**Neovim Configuration:**
- [Plugin installation issues](./nvim/README.md#troubleshooting)
- [Language server problems](./nvim/README.md#language-servers)
- [Performance issues](./nvim/README.md#performance)

**Sketchybar Configuration:**
- [Status bar not appearing](./sketchybar/README.md#troubleshooting)
- [Item display issues](./sketchybar/README.md#items)
- [Theme customization](./sketchybar/README.md#themes)

### Getting Help

1. **Check the documentation** for each component
2. **Review troubleshooting sections** in individual README files
3. **Check log files** for error messages
4. **Verify system requirements** are met
5. **Ensure proper installation** of dependencies

## 🤝 Contributing

This repository is designed to be easily customizable and extensible. Contributions are welcome:

### How to Contribute
1. **Fork the repository**
2. **Create a feature branch**
3. **Make your changes**
4. **Test thoroughly**
5. **Submit a pull request**

### Areas for Contribution
- **New ZSH functions** and aliases
- **Additional Neovim plugins** and configurations
- **Sketchybar items** and themes
- **Documentation improvements**
- **Bug fixes** and performance optimizations

## 📄 License

This configuration suite is provided as-is for educational and productivity purposes. Feel free to use and modify according to your needs.

Individual components may have their own licenses:
- **Oh My Zsh**: MIT License
- **Powerlevel10k**: MIT License
- **Neovim**: Apache License 2.0
- **Sketchybar**: MIT License

## 🙏 Acknowledgments

- **Oh My Zsh** community for the excellent ZSH framework
- **Powerlevel10k** for the beautiful and fast prompt theme
- **Neovim** community for the modern Vim experience
- **Sketchybar** developers for the customizable status bar
- **Homebrew** team for the excellent package manager

## 📞 Support

For support and questions:
1. **Check the documentation** first
2. **Review troubleshooting sections**
3. **Search existing issues**
4. **Create a new issue** with detailed information

---

## 🎉 Getting Started

Ready to transform your macOS development experience? Start with the [ZSH Configuration Suite](./zshrc/) for the most comprehensive setup, or choose individual components based on your needs.

**Happy coding! 🚀**
