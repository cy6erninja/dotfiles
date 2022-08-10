# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories # much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
#	osx
#	zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
##
# ⚠️ WARNING: Don't manually `source` your .zshrc file! It can have unexpected
# side effects. Instead, to safely apply changes, use `znap restart`.
#


##
# Source Znap at the start of your .zshrc file.
#
source ~/git/zsh-snap/znap.zsh


##
# Does your shell feels slow to start? `znap prompt` reduces the time between
# opening your terminal and seeing your prompt to just 15 - 40 ms!
#
znap prompt agnoster/agnoster-zsh-theme

# `znap prompt` also supports Oh-My-Zsh themes. Just make sure you load the
# required libs first:
znap source ohmyzsh/ohmyzsh lib/{git,theme-and-appearance}
znap prompt ohmyzsh/ohmyzsh robbyrussell

# Using your own custom prompt? After initializing the prompt, just call
# `znap prompt` without arguments to get it to show:
PS1=$'%(?,%F{g},%F{r})%#%f '
znap prompt

# The same goes for any other kind of custom prompt:
znap eval starship 'starship init zsh --print-full-init'
znap prompt


##
# Load your plugins with `znap source`.
#
#znap source marlonrichert/zsh-autocomplete
znap source marlonrichert/zsh-edit

# ...or to load only those parts of Oh-My-Zsh or Prezto that you really need:
znap source sorin-ionescu/prezto modules/{environment,history}
znap source ohmyzsh/ohmyzsh \
    'lib/(*~(git|theme-and-appearance).zsh)' plugins/git

# `znap source` finds the right file automatically, but you can also specify
# one (or more) explicitly:
znap source asdf-vm/asdf asdf.sh

# No special syntax is needed to configure plugins. Just use normal Zsh
# statements:

znap source marlonrichert/zsh-hist
bindkey '^[q' push-line-or-edit
bindkey -r '^Q' '^[Q'

ZSH_AUTOSUGGEST_STRATEGY=( history )
znap source zsh-users/zsh-autosuggestions

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting


##
# Cache the output of slow commands with `znap eval`.
#

# If the first arg is a repo, then the command will run inside it. Plus,
# whenever you update a repo with `znap pull`, its eval cache gets regenerated
# automatically.
znap eval trapd00r/LS_COLORS "$( whence -a dircolors gdircolors ) -b LS_COLORS"

# The cache gets regenerated, too, when the eval command has changed. For
# example, here we include a variable. So, the cache gets invalidated whenever
# this variable has changed.
znap source marlonrichert/zcolors
znap eval   marlonrichert/zcolors "zcolors ${(q)LS_COLORS}"

# Here we include the full path to a command. Since that path includes a
# version number, the cache will be invalidated when that changes.
znap eval asdf-community/asdf-direnv "asdf exec $( asdf which direnv ) hook zsh"

# Combine `znap eval` with `curl` or `wget` to download, cache and source
# individual files:
znap eval omz-git 'curl -fsSL \
    https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh'


##
# Defer initilization code with lazily loaded functions created by
# `znap function`.
#

# For each of the examples below, the `eval` statement on the right is not
# executed until you try to execute the associated command or try to use
# completion on it.

znap function _pyenv pyenv              'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

znap function _pip_completion pip       'eval "$( pip completion --zsh )"'
compctl -K    _pip_completion pip

znap function _python_argcomplete pipx  'eval "$( register-python-argcomplete pipx  )"'
complete -o nospace -o default -o bashdefault \
           -F _python_argcomplete pipx

znap function _pipenv pipenv            'eval "$( pipenv --completion )"'
compdef       _pipenv pipenv
##
# ⚠️ WARNING: Don't manually `source` your .zshrc file! It can have unexpected
# side effects. Instead, to safely apply changes, use `znap restart`.
#


##
# Source Znap at the start of your .zshrc file.
#
source ~/git/zsh-snap/znap.zsh


##
# Does your shell feels slow to start? `znap prompt` reduces the time between
# opening your terminal and seeing your prompt to just 15 - 40 ms!
#
znap prompt agnoster/agnoster-zsh-theme

# `znap prompt` also supports Oh-My-Zsh themes. Just make sure you load the
# required libs first:
znap source ohmyzsh/ohmyzsh lib/{git,theme-and-appearance}
znap prompt ohmyzsh/ohmyzsh robbyrussell

# Using your own custom prompt? After initializing the prompt, just call
# `znap prompt` without arguments to get it to show:
PS1=$'%(?,%F{g},%F{r})%#%f '
znap prompt

# The same goes for any other kind of custom prompt:
znap eval starship 'starship init zsh --print-full-init'
znap prompt


##
# Load your plugins with `znap source`.
#
znap source marlonrichert/zsh-autocomplete
znap source marlonrichert/zsh-edit

# ...or to load only those parts of Oh-My-Zsh or Prezto that you really need:
znap source sorin-ionescu/prezto modules/{environment,history}
znap source ohmyzsh/ohmyzsh \
    'lib/(*~(git|theme-and-appearance).zsh)' plugins/git

# `znap source` finds the right file automatically, but you can also specify
# one (or more) explicitly:
znap source asdf-vm/asdf asdf.sh

# No special syntax is needed to configure plugins. Just use normal Zsh
# statements:

znap source marlonrichert/zsh-hist
bindkey '^[q' push-line-or-edit
bindkey -r '^Q' '^[Q'

ZSH_AUTOSUGGEST_STRATEGY=( history )
znap source zsh-users/zsh-autosuggestions

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting


##
# Cache the output of slow commands with `znap eval`.
#

# If the first arg is a repo, then the command will run inside it. Plus,
# whenever you update a repo with `znap pull`, its eval cache gets regenerated
# automatically.
znap eval trapd00r/LS_COLORS "$( whence -a dircolors gdircolors ) -b LS_COLORS"

# The cache gets regenerated, too, when the eval command has changed. For
# example, here we include a variable. So, the cache gets invalidated whenever
# this variable has changed.
znap source marlonrichert/zcolors
znap eval   marlonrichert/zcolors "zcolors ${(q)LS_COLORS}"

# Here we include the full path to a command. Since that path includes a
# version number, the cache will be invalidated when that changes.
znap eval asdf-community/asdf-direnv "asdf exec $( asdf which direnv ) hook zsh"

# Combine `znap eval` with `curl` or `wget` to download, cache and source
# individual files:
znap eval omz-git 'curl -fsSL \
    https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh'


##
# Defer initilization code with lazily loaded functions created by
# `znap function`.
#

# For each of the examples below, the `eval` statement on the right is not
# executed until you try to execute the associated command or try to use
# completion on it.

znap function _pyenv pyenv              'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

znap function _pip_completion pip       'eval "$( pip completion --zsh )"'
compctl -K    _pip_completion pip

znap function _python_argcomplete pipx  'eval "$( register-python-argcomplete pipx  )"'
complete -o nospace -o default -o bashdefault \
           -F _python_argcomplete pipx

znap function _pipenv pipenv            'eval "$( pipenv --completion )"'
compdef       _pipenv pipenv
##
# ⚠️ WARNING: Don't manually `source` your .zshrc file! It can have unexpected
# side effects. Instead, to safely apply changes, use `znap restart`.
#


##
# Source Znap at the start of your .zshrc file.
#
source ~/git/zsh-snap/znap.zsh


##
# Does your shell feels slow to start? `znap prompt` reduces the time between
# opening your terminal and seeing your prompt to just 15 - 40 ms!
#
znap prompt agnoster/agnoster-zsh-theme

# `znap prompt` also supports Oh-My-Zsh themes. Just make sure you load the
# required libs first:
znap source ohmyzsh/ohmyzsh lib/{git,theme-and-appearance}
znap prompt ohmyzsh/ohmyzsh robbyrussell

# Using your own custom prompt? After initializing the prompt, just call
# `znap prompt` without arguments to get it to show:
PS1=$'%(?,%F{g},%F{r})%#%f '
znap prompt

# The same goes for any other kind of custom prompt:
znap eval starship 'starship init zsh --print-full-init'
znap prompt


##
# Load your plugins with `znap source`.
#
znap source marlonrichert/zsh-autocomplete
znap source marlonrichert/zsh-edit

# ...or to load only those parts of Oh-My-Zsh or Prezto that you really need:
znap source sorin-ionescu/prezto modules/{environment,history}
znap source ohmyzsh/ohmyzsh \
    'lib/(*~(git|theme-and-appearance).zsh)' plugins/git

# `znap source` finds the right file automatically, but you can also specify
# one (or more) explicitly:
znap source asdf-vm/asdf asdf.sh

# No special syntax is needed to configure plugins. Just use normal Zsh
# statements:

znap source marlonrichert/zsh-hist
bindkey '^[q' push-line-or-edit
bindkey -r '^Q' '^[Q'

ZSH_AUTOSUGGEST_STRATEGY=( history )
znap source zsh-users/zsh-autosuggestions

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting


##
# Cache the output of slow commands with `znap eval`.
#

# If the first arg is a repo, then the command will run inside it. Plus,
# whenever you update a repo with `znap pull`, its eval cache gets regenerated
# automatically.
znap eval trapd00r/LS_COLORS "$( whence -a dircolors gdircolors ) -b LS_COLORS"

# The cache gets regenerated, too, when the eval command has changed. For
# example, here we include a variable. So, the cache gets invalidated whenever
# this variable has changed.
znap source marlonrichert/zcolors
znap eval   marlonrichert/zcolors "zcolors ${(q)LS_COLORS}"

# Here we include the full path to a command. Since that path includes a
# version number, the cache will be invalidated when that changes.
znap eval asdf-community/asdf-direnv "asdf exec $( asdf which direnv ) hook zsh"

# Combine `znap eval` with `curl` or `wget` to download, cache and source
# individual files:
znap eval omz-git 'curl -fsSL \
    https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh'


##
# Defer initilization code with lazily loaded functions created by
# `znap function`.
#

# For each of the examples below, the `eval` statement on the right is not
# executed until you try to execute the associated command or try to use
# completion on it.

znap function _pyenv pyenv              'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

znap function _pip_completion pip       'eval "$( pip completion --zsh )"'
compctl -K    _pip_completion pip

znap function _python_argcomplete pipx  'eval "$( register-python-argcomplete pipx  )"'
complete -o nospace -o default -o bashdefault \
           -F _python_argcomplete pipx

znap function _pipenv pipenv            'eval "$( pipenv --completion )"'
compdef       _pipenv pipenv
##
# ⚠️ WARNING: Don't manually `source` your .zshrc file! It can have unexpected
# side effects. Instead, to safely apply changes, use `znap restart`.
#


##
# Source Znap at the start of your .zshrc file.
#
source ~/git/zsh-snap/znap.zsh


##
# Does your shell feels slow to start? `znap prompt` reduces the time between
# opening your terminal and seeing your prompt to just 15 - 40 ms!
#
znap prompt agnoster/agnoster-zsh-theme

# `znap prompt` also supports Oh-My-Zsh themes. Just make sure you load the
# required libs first:
znap source ohmyzsh/ohmyzsh lib/{git,theme-and-appearance}
znap prompt ohmyzsh/ohmyzsh robbyrussell

# Using your own custom prompt? After initializing the prompt, just call
# `znap prompt` without arguments to get it to show:
PS1=$'%(?,%F{g},%F{r})%#%f '
znap prompt

# The same goes for any other kind of custom prompt:
znap eval starship 'starship init zsh --print-full-init'
znap prompt


##
# Load your plugins with `znap source`.
#
znap source marlonrichert/zsh-autocomplete
znap source marlonrichert/zsh-edit

# ...or to load only those parts of Oh-My-Zsh or Prezto that you really need:
znap source sorin-ionescu/prezto modules/{environment,history}
znap source ohmyzsh/ohmyzsh \
    'lib/(*~(git|theme-and-appearance).zsh)' plugins/git

# `znap source` finds the right file automatically, but you can also specify
# one (or more) explicitly:
znap source asdf-vm/asdf asdf.sh

# No special syntax is needed to configure plugins. Just use normal Zsh
# statements:

znap source marlonrichert/zsh-hist
bindkey '^[q' push-line-or-edit
bindkey -r '^Q' '^[Q'

ZSH_AUTOSUGGEST_STRATEGY=( history )
znap source zsh-users/zsh-autosuggestions

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting


##
# Cache the output of slow commands with `znap eval`.
#

# If the first arg is a repo, then the command will run inside it. Plus,
# whenever you update a repo with `znap pull`, its eval cache gets regenerated
# automatically.
znap eval trapd00r/LS_COLORS "$( whence -a dircolors gdircolors ) -b LS_COLORS"

# The cache gets regenerated, too, when the eval command has changed. For
# example, here we include a variable. So, the cache gets invalidated whenever
# this variable has changed.
znap source marlonrichert/zcolors
znap eval   marlonrichert/zcolors "zcolors ${(q)LS_COLORS}"

# Here we include the full path to a command. Since that path includes a
# version number, the cache will be invalidated when that changes.
znap eval asdf-community/asdf-direnv "asdf exec $( asdf which direnv ) hook zsh"

# Combine `znap eval` with `curl` or `wget` to download, cache and source
# individual files:
znap eval omz-git 'curl -fsSL \
    https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh'


##
# Defer initilization code with lazily loaded functions created by
# `znap function`.
#

# For each of the examples below, the `eval` statement on the right is not
# executed until you try to execute the associated command or try to use
# completion on it.

znap function _pyenv pyenv              'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

znap function _pip_completion pip       'eval "$( pip completion --zsh )"'
compctl -K    _pip_completion pip

znap function _python_argcomplete pipx  'eval "$( register-python-argcomplete pipx  )"'
complete -o nospace -o default -o bashdefault \
           -F _python_argcomplete pipx

znap function _pipenv pipenv            'eval "$( pipenv --completion )"'
compdef       _pipenv pipenv
