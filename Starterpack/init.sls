{% set filename = 'firefox-esr.js' %} #default filename for firefox system wide settings

{% if grains['os'] == 'Ubuntu' %} #only run these if os is ubuntu

software-properties-common: #needed to execute get_repo: 
  pkg.installed

get_repo: #runs a commands that adds mozillateam repository to be able to install firefox-esr from there
  cmd.run:
    - name: sudo add-apt-repository -y ppa:mozillateam/ppa
    - creates: /etc/apt/sources.list.d/mozillateam-ubuntu-ppa-jammy.list  #runs the command only if this file is missing

#solution below is the way I thougth it was supposed to be done, but kept getting error messages due to a bug(?)

#install_firefox_esr: 
#  pkgrepo.managed:
#    - name: ppa:mozillateam/ppa
#    - dist: precise
#    - file: /etc/apt/sources.list.d/mozillateam.list

{% set filename = 'syspref.js' %} #changes the filename firefox-esr.js to syspref.js if os is ubuntu

{% endif %}

firefoxNstuff: #install packages
  pkg.installed:
    - pkgs:
      - firefox-esr
      - webext-ublock-origin-firefox
      - flameshot

/etc/firefox-esr/{{filename}}: #firefox system wide settings with a filename variable
  file.managed:
    - source: salt://Starterpack/firefox-esr.js

/home/discord-0.0.22.deb: #discord installation files
  file.managed:
    - source: salt://Starterpack/discord-0.0.22.deb

discord_install: #install discord from the files
  pkg.installed:
    - sources:
      - discord: /home/discord-0.0.22.deb
