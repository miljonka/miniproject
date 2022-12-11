# Applications Starterpack

WORK IN PROGRESS, rigth now this project works as it is. Planning on adding more must-have applications.

Using [Salt](https://saltproject.io/) to install Firefox-ESR that comes with uBlock and preset homepage google.com + Discord

Small but good starter-pack of applications every computer needs!

 ![photo](https://user-images.githubusercontent.com/112076418/206718193-22c76ea3-8688-4c20-8c27-83e9d11483a1.png)
 \
_Images are from: https://commons.wikimedia.org/wiki/Main_Page_ 



Project done for the course  [Configuration Management Systems](https://terokarvinen.com/2022/palvelinten-hallinta-2022p2/?from=MoodleNews) by Tero Karvinen

&nbsp;
--
&nbsp;

STATE OF THE PROJECT = WORK IN PROGRESS

This project has been done and tested with Debian 11 and Ubuntu 22.04.1 LTS. Use at your own risk!

Rigth now applying the Starterpack state does: 

- install Firefox-ESR
- install uBlock origin for Firefox
- sets homepage to google.com
- install Discord


INSTRUCTIONS: 

go to your /home/$USER folder \
clone this repository \
apply the state `sudo salt-call --local --file-root miniproject/ state.apply Starterpack`

Example from pinokkio:
```
pinokkio@debian:~$ cd
pinokkio@debian:~$ git clone https://github.com/miljonka/miniproject.git
pinokkio@debian:~$ sudo salt-call --local --file-root miniproject/ state.apply Starterpack
```

If everything went smoothly, u should now have Firefox with uBlock and Discord ! 

![a465f4df523e3cbdda9ed26990494267](https://user-images.githubusercontent.com/112076418/206704895-f595f660-e474-40cb-a193-2f64629fc10b.png)

![c41f3a908d5e09c247923ce26a512f2b](https://user-images.githubusercontent.com/112076418/206704904-298ef390-857b-4338-9b9b-cd1eab22c718.png)

To check if uBlock installed correctly: \
Open your browser and look for the red icon on the right:

![ublock](https://user-images.githubusercontent.com/112076418/206705541-f8a72d12-9690-48ee-aa1f-29aefc636962.png)


UNINSTALL:

If you want to uninstall firefox, uBlock and Discord:
```
$ sudo apt-get autoremove --purge -y firefox-esr webext-ublock-origin-firefox discord
```

Remove discord installer created by the state:
```
$ sudo rm /home/discord-0.0.21.deb
```
If you applied this state on Ubuntu and want to use snap-store instead of mozillateamPPA to re-install firefox:
```
$ sudo rm /etc/apt/sources.list.d/mozillateam-ubuntu-ppa-jammy.list 
$ sudo add-apt-repository --remove ppa:mozillateam/ppa
```
