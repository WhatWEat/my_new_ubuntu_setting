#!/bin/bash

set -e  # 发生错误时终止脚本

echo "请选择一个选项:"
echo "1. 安装 Fish Shell 和 Oh My Fish"
echo "2. 初始化 Fish 配置"
echo "3. 软连接 mamba"
read -p "请输入选项 (1/2/3): " choice

if [ "$choice" = "1" ]; then
    # 更新软件包列表
    sudo apt update

    # 安装 Fish Shell
    sudo apt install -y fish
    
    # 设置 Fish 为默认 Shell
    if ! grep -Fxq "/usr/bin/fish" /etc/shells; then
        echo "/usr/bin/fish" | sudo tee -a /etc/shells
    fi
    chsh -s /usr/bin/fish

    # 安装 Oh My Fish (OMF)
    curl -L https://get.oh-my.fish | fish

    fish -c "omf install agnoster"
    fish -c "omf theme agnoster"

    echo "exec fish" >> ~/.bashrc

    echo "Fish Shell 和 Oh My Fish 安装完成！请重新启动终端使用 Fish。"
elif [ "$choice" == "2" ]; then
    # 初始化 Fish 配置
    echo "初始化 Fish 配置..."
    mkdir -p ~/.config/fish/functions
    cp -r functions ~/.config/fish/
    echo "Fish 配置已成功初始化。"
    mkdir -p ~/.local/bin
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.profile
    source ~/.profile
elif [ "$choice" == "3" ]; then
    # 创建软链接，将 conda 和 mamba 添加到 ~/.local/bin
    chmod +x ~/.local/bin/conda
    chmod +x ~/.local/bin/mamba
    ln -sf ~/miniforge3/bin/conda ~/.local/bin/conda
    ln -sf ~/miniforge3/bin/mamba ~/.local/bin/mamba
    echo "已创建 conda 和 mamba 的软链接到 ~/.local/bin。"
else
    echo "无效选项，退出。"
    exit 1
fi