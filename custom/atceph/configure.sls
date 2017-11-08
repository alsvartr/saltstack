ceph_mkdir_etc:
  file.directory:
    - name: /etc/atceph
    - user: ceph
    - group: ceph
    - mode: 755
    - makedirs: True
  require:
    - sls: ceph_git

{% if salt.pillar.get('atceph') %}
/etc/atceph/config:
  file.managed:
    - source: salt://custom/atceph/configs/config
    - template: jinja
  require:
    - sls: atceph_mkdir_etc
{% endif %}

/etc/atceph/rbdmap:
  file.managed:
    - source: salt://custom/atceph/configs/rbdmap
    - template: jinja
    - replace: False
  require:
    - sls: atceph_mkdir_etc

/etc/atceph/exclude:
  file.managed:
    - source: salt://custom/atceph/configs/exclude
    - template: jinja
    - replace: False
  require:
    - sls: atceph_mkdir_etc

/etc/systemd/system/rbd-mapper.service:
  file.copy:
    - source: /opt/ceph/etc/rbd-mapper.service
    - force: True
  require:
    - sls: atceph_git
