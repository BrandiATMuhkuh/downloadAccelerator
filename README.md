# downloadAccelerator
Have you noticed that some server, especially streaming server give you a higher download speed at the beginning of the streaming process than at the end? This is because the want you to buffer fast (you can start watching fast) but than slow down. This helps them to limit their bandwidth. 

However, many time you just want to download the file as fast as possible. For example to bring it home from work. This script will help you to do that.

## example: Download ubuntu image
```
./dlScript.sh -u http://ucmirror.canterbury.ac.nz/linux/ubuntu/14.10/ubuntu-14.10-server-i386.iso -t 12 -s ubunutImage.iso
```
this will now download the ubuntu iso file (`-u <url>`) by restarting the download every 12 seconds (`-t <time>`) and calling the file ubuntuImage.iso (`-s <savename>`).

## HELP
```
-u <url>: set the url of the file
-t <time>: set the time in seconds until the script restart the connection. When you download a file you will see after x seconds a drop in download speed. This is the perfect time. Default time is 11 seconds
-s <savename>: the name the file should have after downloading. Default is 'downloadedFile'
-h: help
```

## PITFALLS
don't forget to give the file execution right! User `chmod +x dlScript.sh`

## FUTURE
Download multible files at once. The restart does not work all the time. However, many server provide min download of about 200kb. So multibe connections are fine too
`curl -L -o test1.mp4 -r 0-64368964  $URL` 
`curl -sI $URL | grep Content-Length | awk '{print $2}'`
