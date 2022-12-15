#default filename for firefox-esr system wide settings
{% set filename = 'firefox-esr.js' %} 

#only run these if os is ubuntu
{% if grains['os'] == 'Ubuntu' %} 

#needed to execute add-apt-repository command 
software-properties-common:
  pkg.installed

#runs a command that adds mozillateam repository if it already isnt added, to be able to install firefox-esr from there
get_repo: 
  cmd.run:
    - name: sudo add-apt-repository -y ppa:mozillateam/ppa
    - creates: /etc/apt/sources.list.d/mozillateam-ubuntu-ppa-jammy.list  

#solution below is the way I thougth it was supposed to be done, but kept getting error messages due to a bug(?)

#install_firefox_esr: 
#  pkgrepo.managed:
#    - name: ppa:mozillateam/ppa
#    - dist: precise
#    - file: /etc/apt/sources.list.d/mozillateam.list

#changes the filename firefox-esr.js to syspref.js if os is ubuntu
{% set filename = 'syspref.js' %} 

{% endif %}

#install packages
firefoxNstuff: 
  pkg.installed:
    - pkgs:
      - firefox-esr
      - webext-ublock-origin-firefox
      - flameshot
      
#firefox system wide settings with a filename variable
/etc/firefox-esr/{{filename}}: 
  file.managed:
    - source: salt://Starterpack/firefox-esr.js

#install discord from salt master
install_discord: 
  pkg.installed:
    - sources:
      - discord: salt://Starterpack/discord-0.0.22.deb
