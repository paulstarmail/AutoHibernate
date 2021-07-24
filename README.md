AutoHibernate
=============

Automatically hibernates the ubuntu laptop when the battery charge is less than or equal to 8%.

----Pre-requisites----

1. A swap partition with size more than that of RAM of the system.
2. A user account with sudo privileges.

----Procedure----

1.  sudo apt-get install acpi
2.  Run "cat /etc/fstab" or "sudo blkid" and copy the UUID of swap partition.
3.  sudo gedit /etc/default/grub
4.  Go to and paste UUID on the given line, "GRUB_CMDLINE_LINUX_DEFAULT="quiet splash resume=UUID=&lt;UUID of swap partition&gt;""
5.  sudo update-grub
6.  Reboot the system.
7.  chmod a+x AutoHibernate.py
8.  sudo gedit /etc/systemd/system/AutoHibernate.service
9.  Copy paste the contents of "AutoHibernate.service" file. Be sure to modify the lines 5 and 7.
10. sudo systemctl daemon-reload
11. sudo systemctl start AutoHibernate
12. sudo systemctl enable AutoHibernate
