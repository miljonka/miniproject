{% set user = 'miljo' %}

{% if grains['os'] == 'Ubuntu' %}

/home/addrepo.sh:
  file.managed:
    - source: salt://MegaSalt/addrepo.sh
    - mode: '0755'

runscript:
  cmd.run:
    - name: bash /home/addrepo.sh

{% endif %}

Firefox_packages:
  pkg.installed:
    - pkgs:
      - webext-ublock-origin-firefox
      - firefox-esr

/etc/firefox-esr/syspref.js:
  file.managed:
    - source: salt://MegaSalt/syspref.js

/home/{{user}}/.mozilla:
  file.directory:
    - user: {{user}}
    - group: {{user}}
    - clean: True


/home/discord-0.0.21.deb:
  file.managed:
    - source: salt://MegaSalt/discord-0.0.21.deb

discord_install:
  pkg.installed:
    - sources:
      - discord: /home/discord-0.0.21.deb
