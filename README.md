# .fastfetch

Configuração personalizada do Fastfetch para Windows / Custom Fastfetch configuration for Windows

## 📦 Sobre / About

Este repositório contém uma configuração personalizada do Fastfetch otimizada para sistemas Windows. Fastfetch é uma ferramenta de informações do sistema escrita em C que exibe informações sobre o seu sistema de forma rápida e elegante.

This repository contains a custom Fastfetch configuration optimized for Windows systems. Fastfetch is a system information tool written in C that displays information about your system quickly and elegantly.

## 🚀 Instalação / Installation

### Windows

1. **Instalar o Fastfetch / Install Fastfetch:**
   
   Usando Scoop:
   ```powershell
   scoop install fastfetch
   ```
   
   Ou usando Chocolatey:
   ```powershell
   choco install fastfetch
   ```
   
   Ou baixe o executável diretamente do [repositório oficial](https://github.com/fastfetch-cli/fastfetch/releases).

2. **Clonar este repositório / Clone this repository:**
   ```powershell
   git clone https://github.com/QuittoGames/.fastfetch.git
   ```

3. **Copiar o arquivo de configuração / Copy the configuration file:**
   
   Para PowerShell / For PowerShell:
   ```powershell
   # Criar o diretório de configuração se não existir / Create config directory if it doesn't exist
   New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.config\fastfetch"
   
   # Copiar o arquivo de configuração / Copy the configuration file
   Copy-Item -Path "config.jsonc" -Destination "$env:USERPROFILE\.config\fastfetch\config.jsonc"
   ```
   
   Para Command Prompt / For Command Prompt:
   ```cmd
   mkdir "%USERPROFILE%\.config\fastfetch" 2>nul
   copy config.jsonc "%USERPROFILE%\.config\fastfetch\config.jsonc"
   ```

## 🎨 Uso / Usage

Após a instalação, simplesmente execute / After installation, simply run:

```powershell
fastfetch
```

O Fastfetch irá detectar e usar automaticamente o arquivo de configuração.

Fastfetch will automatically detect and use the configuration file.

### Personalização / Customization

Você pode editar o arquivo `config.jsonc` para personalizar:
- Módulos exibidos
- Cores
- Logo do sistema
- Separadores
- E muito mais!

You can edit the `config.jsonc` file to customize:
- Displayed modules
- Colors
- System logo
- Separators
- And much more!

Documentação oficial: [Fastfetch Wiki](https://github.com/fastfetch-cli/fastfetch/wiki)

## 📋 Recursos / Features

Esta configuração inclui / This configuration includes:

- ✅ Logo do Windows
- ✅ Informações do sistema operacional
- ✅ Informações de hardware (CPU, GPU, Memória)
- ✅ Informações de display e tema
- ✅ Terminal e shell
- ✅ Bateria (para laptops)
- ✅ Esquema de cores personalizável
- ✅ Paleta de cores no final

## 🤝 Contribuindo / Contributing

Sinta-se à vontade para fazer fork, modificar e enviar pull requests!

Feel free to fork, modify, and submit pull requests!

## 📝 Licença / License

MIT License - veja o arquivo [LICENSE](LICENSE) para detalhes.