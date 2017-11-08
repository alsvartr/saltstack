systemd_daemon_reload:
  cmd.run:
    - name: systemctl daemon-reload

rbd-mapper.service:
  service.running:
    - name: rbd-mapper
    - enable: True
  require:
    - sls: systemd_daemon_reload
