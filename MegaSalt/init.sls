packages:
  pkg.installed:
    - pkgs:
      - webext-ublock-origin-firefox
      - firefox

/etc/firefox/syspref.js:
  file.managed:
    - source: salt://MegaSalt/syspref.js



