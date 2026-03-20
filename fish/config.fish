if status is-interactive
    # Commands to run in interactive sessions can go here
    command -q atuin; and atuin init fish | source
    command -q pyenv; and pyenv init - | source
end
