source (dirname (status -f))/aliases.fish
source (dirname (status -f))/completions.fish

set -gx EDITOR nano

set -gx VISUAL code
set -gx PAGER less
set -gx LESS '-F -g -i -M -R -S -w -X -z-4'

if status --is-login
    source (dirname (status -f))/env.fish
end

source (dirname (status -f))/path.fish

function __direnv_export_eval --on-variable PWD
    status --is-command-substitution; and return
    eval (direnv export fish)
end

direnv hook fish | source

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish

set -g fish_user_paths "/usr/local/opt/v8@3.15/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/gnu-getopt/bin" $fish_user_paths

set -g fish_user_paths "/usr/local/opt/libpq/bin" $fish_user_paths

export KUBECONFIG=$HOME/.kube/configs/config-applifting

starship init fish | source