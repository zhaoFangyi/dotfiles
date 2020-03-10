# http://zsh.sourceforge.net/Doc/ 语法文档
# This loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Path to your oh-my-zsh installation.
#export ZSH=/Users/zhaofangyi/.oh-my-zsh

#ZSH_THEME="af-magic"

#编辑器
export EDITOR=vim
# 自动更新的时间间隔，单位是天，这里设置 30 天更新一次
export UPDATE_ZSH_DAYS=30
#History setup
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE=~/.zhistory

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_cd # cd by typing directory name if it's not a command
setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt AUTO_PUSHD # 启用 cd 命令的历史纪录，cd -[TAB]进入历史路径
setopt PUSHD_IGNORE_DUPS #相同的历史路径只保留一个

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate #enable approximate matches for completion
zstyle ':completion:*' verbose yes

source $HOME/antigen.zsh
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    # Bundles from the default repo (robbyrussell's oh-my-zsh)
    git
    wd
    npm
    nvm
    node
    z
    web-search
    last-working-dir
    common-aliases
    

    # Syntax highlighting bundle.
    zsh-users/zsh-syntax-highlighting

    # Fish-like auto suggestions
    zsh-users/zsh-autosuggestions

    # Extra zsh completions
    zsh-users/zsh-completions
    zsh-users/zsh-history-substring-search
EOBUNDLES

antigen theme robbyrussell

antigen apply

# Aliases
alias fang="ssh fang"
alias config="vi $HOME/.zshrc"
alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
alias ga="git add ."
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g C='| wc -l'
alias -g N="| /dev/null"
alias -g G='| grep' # now you can do: ls foo G something


sourceZsh(){
    source ~/.zshrc
    backupToDrive ~/.zshrc
    echo "New .zshrc sourced."
    return
}

editZsh(){
    updateYadm
    vim ~/.zshrc
    source ~/.zshrc
    backupToDrive ~/.zshrc
    echo "New .zshrc sourced."
    return
}

updateYad() {
    yadm pull
    return
}

backupToDrive(){
    yadm add ~/.zshrc
    yadm commit -m "updated .zshrc"
    yadm push
    echo "New .zshrc backed up to yadm."
    return
}