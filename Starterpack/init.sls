{% set filename = 'firefox-esr.js' %}

{% if grains['os'] == 'Ubuntu' %}

software-properties-common:
  pkg.installed

get_repo:
  cmd.run:
    - name: sudo add-apt-repository -y ppa:mozillateam/ppa
    - creates: /etc/apt/sources.list.d/mozillateam-ubuntu-ppa-jammy.list 

#install_firefox_esr:
#  pkgrepo.managed:
#    - name: ppa:mozillateam/ppa
#    - dist: precise
#    - file: /etc/apt/sources.list.d/mozillateam.list

{% set filename = 'syspref.js' %}

{% endif %}

firefoxNstuff:
  pkg.installed:
    - pkgs:
      - firefox-esr
      - webext-ublock-origin-firefox


/etc/firefox-esr/{{filename}}:
  file.managed:
    - source: salt://Starterpack/firefox-esr.js

/home/discord-0.0.22.deb:
  file.managed:
    - source: salt://Starterpack/discord-0.0.22.deb

discord_install:
  pkg.installed:
    - sources:
      - discord: /home/discord-0.0.22.deb
