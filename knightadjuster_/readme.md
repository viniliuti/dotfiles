# KNightAdjuster 

Script from https://github.com/adrium/knightadjuster

This script is based on somebody else's comment with some [fixes for Qt6](https://github.com/adrium/knightadjuster/issues/9#issuecomment-2103601906) and some extra changes to make it work on Fedora

## Automatically run

To run this automatically, `crontab` was complaining about permissions

Solved that by using _systemd_ run command
```shell
systemd-run --user --unit=knightadjuster.timer --on-calendar='*-*-* *:0/11:00' /services/knightadjuster
```
