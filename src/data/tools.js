import { portsData } from './portsData';

export const portsDatabase = portsData.map(p => ({
  ...p,
  risk: p.security
}));

export const sampleTerminalCommands = {
  "help": "Available commands:\n  help        - Show available terminal commands\n  ip a        - Show network interfaces and IP addresses\n  ifconfig    - Display active network interface config\n  ping        - Send ICMP echo requests (e.g., 'ping 8.8.8.8')\n  traceroute  - Trace packet route hops (e.g., 'traceroute rtechlab.com')\n  netstat     - Show active listening ports and connections\n  uname -a    - Display Linux kernel version and architecture\n  cat /etc/os-release - Display Linux operating system release information\n  pwd         - Print current working directory\n  ls -la      - List directory contents in detailed long format\n  clear       - Clear the terminal console output",
  "ip a": `1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 52:54:00:12:34:56 brd ff:ff:ff:ff:ff:ff
    inet 192.168.10.45/24 brd 192.168.10.255 scope global dynamic eth0
       valid_lft 86320sec preferred_lft 86320sec
    inet6 fe80::5054:ff:fe12:3456/64 scope link
       valid_lft forever preferred_lft forever`,
  "ifconfig": `eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.10.45  netmask 255.255.255.0  broadcast 192.168.10.255
        inet6 fe80::5054:ff:fe12:3456  prefixlen 64  scopeid 0x20<link>
        ether 52:54:00:12:34:56  txqueuelen 1000  (Ethernet)
        RX packets 145028  bytes 182390142 (182.3 MB)
        TX packets 98412  bytes 12904810 (12.9 MB)

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        loop  txqueuelen 1000  (Local Loopback)`,
  "uname -a": "Linux rtechlab-sandbox 6.5.0-35-generic #35~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC x86_64 GNU/Linux",
  "cat /etc/os-release": `NAME="Ubuntu"
VERSION="24.04 LTS (Noble Numbat)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 24.04 LTS"
VERSION_ID="24.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"`,
  "pwd": "/home/student/rtechlab-workspace",
  "ls -la": `total 32
drwxr-xr-x 4 student student 4096 Nov 10 09:00 .
drwxr-xr-x 3 root    root    4096 Nov 10 08:30 ..
-rw-r--r-- 1 student student  220 Nov 10 08:31 .bash_logout
-rw-r--r-- 1 student student 3771 Nov 10 08:31 .bashrc
-rw-r--r-- 1 student student  807 Nov 10 08:31 .profile
drwxr-xr-x 2 student student 4096 Nov 10 09:01 ccna_labs
drwxr-xr-x 2 student student 4096 Nov 10 09:02 scripts
-rwxr-xr-x 1 student student  512 Nov 10 09:03 ping_subnet.py`,
  "netstat": `Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State      
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN     
tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN     
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN     
tcp6       0      0 :::22                   :::*                    LISTEN     
tcp6       0      0 :::443                  :::*                    LISTEN     
udp        0      0 0.0.0.0:68              0.0.0.0:*                          
udp        0      0 0.0.0.0:123             0.0.0.0:*                          `
};
