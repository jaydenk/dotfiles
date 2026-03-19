function nano --wraps=nano --description 'Use Homebrew nano on macOS, system nano elsewhere'
    if test -x /opt/homebrew/bin/nano
        /opt/homebrew/bin/nano $argv
    else if test -x /usr/local/bin/nano
        /usr/local/bin/nano $argv
    else
        command nano $argv
    end
end
