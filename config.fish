if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PATH /Users/nikitapronin/src/flutter/bin:$PATH
set -gx PATH $PATH"":"$HOME/.pub-cache/bin"
set -gx PATH /Users/nikitapronin/Library/Python/3.8/bin:$PATH
set -gx PATH /Users/nikitapronin/src/flutter/bin/cache/dart-sdk/bin:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/nikitapronin/opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

status --is-interactive; and rbenv init - fish | source

# >>> Theming >>>
# <<< Theming >>>

