iptables:
  service.running:
    - enable: True

ip6tables:
  service.running:
    - enable: True

auditd:
  service.running:
    - enable: True

crond:
  service.running:
    - enable: True

rdisc:
  service.dead:
    - enable: False

postfix:
  service.running:
    - enable: True

/etc/gshadow:
  file.managed:
    - source: salt://stig/gshadow
    - mode: 0000
    - user: root
    - group: root

/etc/shadow:
  file.managed:
    - source: salt://stig/shadow
    - mode: 0000
    - user: root
    - group: root

/etc/passwd:
  file.managed:
    - source: salt://stig/passwd
    - mode: 644
    - user: root
    - group: root

/etc/group:
  file.managed:
    - source: salt://stig/group
    - mode: 644
    - user: root
    - group: root

/etc/grub.conf:
  file.managed:
    - source: salt://stig/grub.conf
    - mode: 600
    - user: root
    - group: root

/etc/sysconfig/iptables:
  file.managed:
    - source: salt://stig/iptables
