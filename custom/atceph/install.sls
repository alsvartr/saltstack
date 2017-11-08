atceph_pkgs:
  pkg.installed:
    - pkgs:
      - git
      - ruby
      - rubygem-json

github.com:
  ssh_known_hosts:
    - present
    - user: ceph

atceph_mkdir:
  file.directory:
    - name: /opt/ceph
    - user: ceph
    - group: ceph
    - mode: 755
    - makedirs: True

atceph_git:
  git.latest:
    - name: git@github.com:alsvartr/atceph.git
    - target: /opt/ceph
    - user: ceph
    - force_reset: True
  require:
    - sls: ceph_mkdir
    - sls: github.com
