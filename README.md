# rclone-auth
Way to easily create/amend rclone config file with Docker

Pass in a config directory for the data volume to persist the rclone.conf

    docker run \
           -it \
           --rm \
           -v "<config dir>:/data" \
           -p 5900:5900 \
           martinjohn/rclone-auth


Connect to vnc on 5900 and fill in details of config in the terminal window, switching to firefox for authentication
