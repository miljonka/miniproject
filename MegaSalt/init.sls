{% set user = 'miljo' %} #set your username, so that firefox can clean previous profiles from your home directory.

{% if grains['os'] == 'Ubuntu' %}  #if your operating system is Ubuntu, run a script that downloads firefox repository, in Debian 11 this is not neede

/home/addrepo.sh: # create a script that downloads firefox repository
  file.managed:
    - source: salt://MegaSalt/addrepo.sh
    - mode: '0755'

runscript: #execute the script
  cmd.run:
    - name: bash /home/addrepo.sh

{% endif %}

Firefox_packages: #install firefox and uBlock
  pkg.installed:
    - pkgs:
      - webext-ublock-origin-firefox
      - firefox-esr

/etc/firefox-esr/syspref.js: #preferences, homepage etc.
  file.managed:
    - source: salt://MegaSalt/syspref.js

/home/{{user}}/.mozilla: #clean firefox from previous profiles and settings
  file.directory:
    - user: {{user}}
    - group: {{user}}
    - clean: True


/home/discord-0.0.21.deb: #create Discord installer to home folder
  file.managed:
    - source: salt://MegaSalt/discord-0.0.21.deb

discord_install: #install discord
  pkg.installed:
    - sources:
      - discord: /home/discord-0.0.21.deb
