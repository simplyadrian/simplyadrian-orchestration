#!/bin/sh

. /etc/tune-profiles/functions

start() {
        set_cpu_governor performance
        set_transparent_hugepages always
        disable_disk_barriers
        multiply_disk_readahead 4
        for i in $(find /sys/block/ -type l | grep -E "(sd[a-z]+|dm-\d+|vd[a-z]+)$")/queue/rotational; do echo 0 > $i; done
        return 0
}

stop() {
        restore_cpu_governor
        restore_transparent_hugepages
        enable_disk_barriers
        restore_disk_readahead
        return 0
}

process $@
