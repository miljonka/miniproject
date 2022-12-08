{% set user = 'miljo' %}

Firefox_packages:
  pkg.installed:
    - pkgs:
      - webext-ublock-origin-firefox
      - firefox

/etc/firefox/syspref.js:
  file.managed:
    - source: salt://MegaSalt/syspref.js

/home/{{user}}/.mozilla:
  file.directory:
    - clean: True

/home/{{user}}/discord-0.0.21.deb:
  file.managed:
    - user: {{user}}
    - group: {{user}}
    - source: salt://MegaSalt/discord-0.0.21.deb
 
Install_Discord:
  pkg.installed:
    - sources:
      - discord: /home/{{user}}/discord-0.0.21.deb

/home/{{user}}/Desktop/discord.desktop:
  file.managed:
    - user: {{user}}
    - group: {{user}}
    - source: salt://MegaSalt/discord.desktop
    - mode: '0755'

