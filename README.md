# rclone-auth
Way to easily create/amend rclone config file with Docker

Test

    docker run \
           -it \
           --rm \
           --cap-add=SYS_ADMIN \
           -p 5900:5900 \
           martinjohn/rclone-auth


Connect to vnc and run 

    rclone config

In the terminal window
