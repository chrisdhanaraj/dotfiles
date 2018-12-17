default_username='chrisdhanaraj'

# uncomment to profile prompt startup with zprof
# zmodload zsh/zprof

# history
SAVEHIST=100000

# # antigen time!
source ~/code/antigen/antigen.zsh

# ######################################################################
# ### install some antigen bundles

# # homebrew  - autocomplete on `brew install`
antigen bundle brew
antigen bundle brew-cask

# # Tracks your most used directories, based on 'frecency'.
antigen bundle robbyrussell/oh-my-zsh plugins/z

# # nicoulaj's moar completion files for zsh -- not sure why disabled.
antigen bundle zsh-users/zsh-completions src

# # Syntax highlighting on the readline
antigen bundle zsh-users/zsh-syntax-highlighting

# history search
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

# # suggestions
antigen bundle tarruda/zsh-autosuggestions

# # colors for all files!
antigen bundle trapd00r/zsh-syntax-highlighting-filetypes

# # dont set a theme, because pure does it all
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Tell antigen that you're done.
antigen apply

###
#################################################################################################


# bind UP and DOWN arrow keys for history search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Automatically list directory contents on `cd`.
auto-ls () {
	emulate -L zsh;
	# explicit sexy ls'ing as aliases arent honored in here.
	hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || ls
}

chpwd_functions=( auto-ls $chpwd_functions )

# z prof

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# export PATH="$PATH:$HOME/.newt-cache/node-versions/n/versions/node/6.6.0/bin"

source ~/.aliases
source ~/.extra
source ~/.exports
source ~/.functions

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH="$PATH:$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
