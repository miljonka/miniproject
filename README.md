# miniproject

WORK IN PROGRESS

Using [Salt](https://saltproject.io/) to install applications like firefox that comes with uBlock etc. 

Planning to install more useful applications for desktop usage like Discord etc.

If you want good package of useful apps, this salt module is for you!

Project done for the course  [Configuration Management Systems](https://terokarvinen.com/2022/palvelinten-hallinta-2022p2/?from=MoodleNews)

&nbsp;
--
&nbsp;

STATE OF THE PROJECT = WORK IN PROGRESS

Rigth now applying the MegaSalt state does: 

- install Firefox
- install uBlock origin for Firefox
- sets homepage to google.com
- install Discord


INSTRUCTIONS:
```
git clone https://github.com/miljonka/miniproject.git
cd miniproject
sudo salt-call --local --file-root miniproject state.apply MegaSalt
```
