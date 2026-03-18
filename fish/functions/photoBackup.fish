function photoBackup
    rsync -avh --progress --itemize-changes --exclude='.Spotlight-V100/' --exclude='.fseventsd/' /Volumes/1TB\ SSD/ /Volumes/Photos/Photo\ Backup/
end
