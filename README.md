# Application Starterpack

Using [Salt](https://saltproject.io/) to install [Firefox-ESR](https://www.mozilla.org/en-US/firefox/enterprise/) browser, that comes with [uBlock](https://ublockorigin.com/) extension and preset homepage google.com,  [Discord](https://discord.com/) and [Flameshot](https://flameshot.org/) screenshotting tool.

Small but good starter-pack of applications every computer needs!

 ![Nimetön](https://user-images.githubusercontent.com/112076418/207203587-2365f051-8647-4f72-a8d4-5b25a3cb9a9b.png) \
_Images are from: https://commons.wikimedia.org/wiki/Main_Page_ 



Project done by myself for the course  [Configuration Management Systems](https://terokarvinen.com/2022/palvelinten-hallinta-2022p2/?from=MoodleNews) by Tero Karvinen

Full report on how the project was done [here](https://github.com/miljonka/Palvelinten-hallinta/wiki/h7_Oma-projekti)

***
This project has been done and tested with Debian 11 and Ubuntu 22.04.1 LTS virtual machines. Use at your own risk!

Right now applying the Starterpack state does: 

- install Firefox-ESR browser
- install uBlock origin extension for Firefox
- sets Firefox homepage to google.com
- install Discord VoIP & chat application
- install Flameshot screenshot tool


INSTRUCTIONS: 

go to your /home/$USER folder \
clone this repository \
apply the state with `$ sudo salt-call --local --file-root miniproject/ state.apply Starterpack`

Example from pinokkio:
```
pinokkio@debian:~$ cd
pinokkio@debian:~$ git clone https://github.com/miljonka/miniproject.git
pinokkio@debian:~$ sudo salt-call --local --file-root miniproject/ state.apply Starterpack
```

If everything went smoothly, u should now have Firefox with uBlock, Discord and Flameshot ! 


![004b857ac38218a3ef858d7d75ddf29a](https://user-images.githubusercontent.com/112076418/207205179-05c242c9-dc87-435e-acae-27b45aae0ab9.png)


![d338f430d26628713778ffe234ea2dbe](https://user-images.githubusercontent.com/112076418/207205186-e6284296-0829-4f44-a408-b50517ca0a75.png)


![82fb66537959b655a2643008845a6947](https://user-images.githubusercontent.com/112076418/207205194-90fc72de-87ea-487e-b041-1b496f4721af.png)


To check if uBlock installed correctly: \
Open your browser and look for the red icon on the right:

![ublock](https://user-images.githubusercontent.com/112076418/206705541-f8a72d12-9690-48ee-aa1f-29aefc636962.png)


UNINSTALL:

If you want to uninstall Firefox, uBlock, Discord and Flameshot:
```
$ sudo apt-get autoremove --purge -y firefox-esr webext-ublock-origin-firefox discord flameshot
```

If you applied Starterpack on Ubuntu and want to use snap-store instead of mozillateamPPA repository to re-install firefox:
```
$ sudo rm /etc/apt/sources.list.d/mozillateam-ubuntu-ppa-jammy.list 
$ sudo add-apt-repository --remove ppa:mozillateam/ppa
```
