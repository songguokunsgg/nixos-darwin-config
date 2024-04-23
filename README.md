# 简单的使用说明

## 安装 nix 

```bash
sh <(curl -L https://nixos.org/nix/install)
```

但要注意添加环境变量到 ~/.zprofile

```bash
export NIX_PATH=darwin-config=$HOME/.nixpkgs/darwin-configuration.nix:/nix/var/nix/profiles/per-user/root/channels:$HOME/.nix-defexpr/channels:nixpkgs-overlays=$HOME/.nixpkgs/overlays/:nixpkgs-overlays=$HOME/.nixpkgs/overlays/
```

## 使用

将clone下来的文件夹移动为 `~/.nixpkgs`
将flake.nix中的主机名**修改为你的实际主机名**

然后cd到~/.nixpkgs, 使用以下命令进行第一次安装

```bash
nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake .
```

后续使用这两行命令进行升级，或者在修改配置文件后一键更新配置

```bash
nix flake update ~/.nixpkgs
darwin-rebuild switch --flake ~/.nixpkgs
```

如果没有找到darwin-rebuild，检查环境变量

## 为什么配置文件这么少

因为你已经试过了 home-manager，效果不理想，难以调试

macOS 无法实现 nixos 那么好的效果，编译甚至都很难通过

所以就使用flake功能锁软件版本就行

## 为什么没有 GUI 程序

GUI 程序不适合用nix管理，因为本身nixpkgs的mac程序包就很少

而且你已经有了clean my mac，可以用于升级卸载 GUI 软件

不需要这一功能了

## 总结

我真的不想再折腾了，就这样养老吧，反正 brew 是扔掉了
