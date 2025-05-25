AutoHibernate
=============
Automatically hibernates the ubuntu laptop when the battery charge is less than or equal to 8%.

Pre-requisites
--------------
1. A swap partition with size more than that of RAM of the system.
2. A user account with sudo privileges.

Procedure
---------
1.  Run "cat /etc/fstab" or "sudo blkid" and copy the UUID of swap partition.
2.  sudo gedit /etc/default/grub
3.  Go to and paste UUID on the given line, "GRUB_CMDLINE_LINUX_DEFAULT="quiet splash resume=UUID=&lt;UUID of swap partition&gt;""
4.  sudo update-grub
5.  Append "<username> ALL=NOPASSWD: /bin/systemctl hibernate" to "/etc/sudoers" file.
6.  chmod a+x AutoHibernate.sh
7.  Add AutoHibernate.sh to "Startup Applications".
8.  Reboot the system.
