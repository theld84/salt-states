stig-enabled-services:
  service.running:
    - enable: True
    - names:
      - iptables
      - ip6tables
      - auditd
      - crond
      - postfix

stig-disabled-services:
  service.dead:
    - enable: False
    - names:
      - rdisc
      - netconsole
      - rhnsd


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

stig-iptables:
  file.sed:
    - name: /etc/sysconfig/iptables
    - before: INPUT ACCEPT
    - after: INPUT DROP
    - before: FORWARD ACCEPT
    - after: FORWARD DROP

stig-auditd:
  file.sed:
    - name: /etc/audit/auditd.conf
    - before: space_left_action = SYSLOG
    - after: space_left_action = EMAIL

/etc/yum.conf:
  file.managed:
    - source: salt://stig/yum.conf


