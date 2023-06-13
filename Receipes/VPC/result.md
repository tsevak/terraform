## After deployment of VPC , for testing purpose added SG and EC2 instance and then tried to access via SSH
```
$ ssh -i syd.pem ec2-user@3.106.170.114
The authenticity of host '3.106.170.114 (3.106.170.114)' can't be established.
ED25519 key fingerprint is SHA256:vupL/dI783nWgbGWAXV6/o1AYDWnUzTsOdusdp7Av20.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '3.106.170.114' (ED25519) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-192-168-101-15 ~]$ ifconfig
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 9001
        inet 192.168.101.15  netmask 255.255.255.0  broadcast 192.168.101.255
        inet6 fe80::e7:51ff:fee7:75d8  prefixlen 64  scopeid 0x20<link>
        ether 02:e7:51:e7:75:d8  txqueuelen 1000  (Ethernet)
        RX packets 588  bytes 66945 (65.3 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 854  bytes 90194 (88.0 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 48  bytes 3888 (3.7 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 48  bytes 3888 (3.7 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

[ec2-user@ip-192-168-101-15 ~]$
```
