
# Vim/Neovim 配置

## 前提条件

- Vim >= 8.0 或 Neovim

## 使用说明

安装和使用的具体方法：

1. 克隆本项目到任意目录下；
2. 将本项目内的 `vimrc` 文件软链接到 `~/.vimrc`，比如：
   ```bash
   ln -snf /your/downloaded/path/to/vimrc/vimrc ~/.vimrc
   ```
3. 安装 (Vim-Plug)[https://github.com/junegunn/vim-plug]:
   ```bash
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```
4. 在任意路径下运行 `vim` 以打开一个 Vim 窗口，然后运行命令 `:PlugInstall`，以安装 vimrc 文件中配置的所有插件；
5. 你可能还需要把 `vimrc` 文件中「[文件开头模板](./vimrc#L678)」里的 Author 和 Mail 换成自己的；
6. 如果需要查看部分重要插件的中文说明，可以到[部分插件说明.md](./部分插件说明.md)查阅；
7. 如果你使用的是 neovim，那么可能还需要参考[nvim-from-vim](https://neovim.io/doc/user/nvim.html#nvim-from-vim)进行一下简单的配置；

## 注意

- Vim 的 `<Leader>` 键被绑定为 `;`
