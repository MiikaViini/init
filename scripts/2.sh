#users command gets you list of active users
# -f force deleting user, it kills all activity
# -r deletes home folder and emails if there is any
users
printf "Type user you want to remove\n"
read user
sudo userdel -f -r $user

