atceph:
  pid_dir: "/tmp"
  ceph:
    bin_dir: "/bin"
    cmd_prefix:
    config: "/etc/ceph/ceph.conf"
    client: client.admin
  rbd_backup:
    snap_keep: 0
    local_keep: 0
    export_dir: "/mnt/rbd-export"
    export_fname: "$POOL_$VOLUME"
    arch_cmd: "dsmc backup"
    max_export_threads: 3
    max_archive_threads: 7
    exclude_file: "/etc/atceph/exclude"
    stat_file: "/tmp/rbd-backup-stat"
  rbd_mapper:
    map_file: "/etc/atceph/rbdmap"
