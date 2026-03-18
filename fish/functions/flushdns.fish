function flushdns
    command sudo dscacheutil -flushcache
    command sudo killall -HUP mDNSResponder
end
