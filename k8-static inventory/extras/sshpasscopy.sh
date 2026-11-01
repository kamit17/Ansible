for server in `cat server.txt`;  
do  
    sshpass -p "root" ssh-copy-id -i ~/.ssh/id_rsa.pub root@$server  
done
