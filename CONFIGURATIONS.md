# Configurações Disponíveis / Available Configurations

Este repositório oferece três configurações diferentes para atender diferentes necessidades e preferências.

This repository offers three different configurations to suit different needs and preferences.

## 📋 config.jsonc (Padrão / Default)

Esta é a configuração completa e recomendada para a maioria dos usuários.

**Características / Features:**
- Logo do Windows
- Informações completas do sistema
- Todos os módulos disponíveis
- Ideal para usuários que querem ver todas as informações

**Módulos incluídos / Included modules:**
- Sistema operacional e host
- Kernel e tempo de atividade
- Pacotes instalados
- Shell e terminal
- Display, DE, WM, temas
- CPU, GPU e memória
- Disco e bateria
- Locale
- Paleta de cores

**Instalação / Installation:**
```powershell
Copy-Item config.jsonc "$env:USERPROFILE\.config\fastfetch\config.jsonc"
```

---

## 🎯 config-minimal.jsonc (Minimalista / Minimal)

Configuração simplificada para quem prefere informações essenciais.

**Características / Features:**
- Logo pequeno do Windows
- Apenas informações essenciais
- Saída mais limpa e rápida
- Ideal para usuários que preferem simplicidade

**Módulos incluídos / Included modules:**
- Sistema operacional
- Kernel
- Tempo de atividade
- Shell e terminal
- CPU, GPU e memória
- Disco
- Paleta de cores

**Instalação / Installation:**
```powershell
Copy-Item config-minimal.jsonc "$env:USERPROFILE\.config\fastfetch\config.jsonc"
```

---

## 💎 config-win11.jsonc (Windows 11 Themed)

Configuração moderna com tema do Windows 11 e ícones Nerd Font.

**Características / Features:**
- Logo do Windows 11
- Ícones modernos (requer Nerd Font)
- Cores tema Windows 11 (cyan/magenta)
- Separadores estilizados
- Visual mais moderno e elegante

**Requisitos / Requirements:**
- Uma Nerd Font instalada (recomendado: Cascadia Code NF, FiraCode NF, ou JetBrains Mono NF)
- Terminal com suporte a fontes com ícones

**Módulos incluídos / Included modules:**
- Informações básicas com ícones
- CPU, GPU e memória com ícones
- Disco C: específico
- Bateria e adaptador de energia
- Locale
- Paleta de cores

**Instalação / Installation:**
```powershell
Copy-Item config-win11.jsonc "$env:USERPROFILE\.config\fastfetch\config.jsonc"
```

---

## 🎨 Personalização / Customization

### Trocar o Logo / Change the Logo

Edite a seção `logo.source` no arquivo de configuração:

```jsonc
"logo": {
  "source": "windows",  // Opções: windows, windows10, windows11, windows_small
  "padding": {
    "top": 1,
    "left": 2
  }
}
```

### Alterar Cores / Change Colors

Edite a seção `display.color`:

```jsonc
"display": {
  "color": {
    "keys": "blue",    // Cor das chaves
    "title": "cyan"    // Cor do título
  }
}
```

Cores disponíveis / Available colors: black, red, green, yellow, blue, magenta, cyan, white, ou códigos numéricos (0-255)

### Adicionar/Remover Módulos / Add/Remove Modules

Edite o array `modules` para adicionar ou remover informações:

```jsonc
"modules": [
  {
    "type": "os",
    "key": "OS"
  },
  // Adicione mais módulos aqui / Add more modules here
]
```

Módulos disponíveis / Available modules: os, host, kernel, uptime, packages, shell, display, de, wm, terminal, cpu, gpu, memory, disk, battery, locale, colors, e muitos mais!

### Alterar Separador / Change Separator

```jsonc
"display": {
  "separator": " -> "  // Pode ser: ":", " | ", " → ", etc.
}
```

---

## 📚 Recursos Adicionais / Additional Resources

- [Documentação oficial do Fastfetch](https://github.com/fastfetch-cli/fastfetch/wiki)
- [Lista completa de módulos](https://github.com/fastfetch-cli/fastfetch/wiki/Configuration)
- [Esquema JSON](https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json)
- [Nerd Fonts](https://www.nerdfonts.com/) (para ícones)

---

## 💡 Dicas / Tips

1. **Testar configurações:** Use `fastfetch -c <arquivo>` para testar uma configuração sem substituir a atual
   ```powershell
   fastfetch -c config-minimal.jsonc
   ```

2. **Ver todas as opções:** Execute `fastfetch --help` para ver todas as opções disponíveis

3. **Gerar configuração padrão:** 
   ```powershell
   fastfetch --gen-config
   ```

4. **Depuração:** Use `fastfetch --print-structure` para ver a estrutura da configuração atual
