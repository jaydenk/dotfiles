function flushdns
    switch (uname -s)
        case Darwin
            command sudo dscacheutil -flushcache
            command sudo killall -HUP mDNSResponder
        case Linux
            if command -q resolvectl
                command sudo resolvectl flush-caches
            else if command -q systemd-resolve
                command sudo systemd-resolve --flush-caches
            else
                echo "No supported DNS cache service found"
                return 1
            end
    end
    echo "DNS cache flushed"
end
