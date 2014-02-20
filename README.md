RaspAP_Nixhost
==============
# version 1.0
#
# File list pulled:
# /etc/network/interfaces contains the network config.
#	- there is a fallback IP address that the Rpi can be reached on even if the DHCP lease from the Eth0 does not come.
#	- Running IP is on Eth0 with DHCP enabled (IP unknown before the system is running).
#	- Fallback IP (eth0:0): 192.168.100.100 / 255.255.255.0
#	- Wlan IP (wlan0): 192.168.199.1 / 255.255.255.0
#
# Wlan info:
#	- ESSID: RaspAP
#	- WPA key: MyWPAKEYHERE
#	- AP IP: 192.168.199.1
#
# Packaging files.
# tar acf /root/raspap.tar.gz /etc/network/interface /etc/hostapd/hostapd.conf /etc/iptables.ipv4.nat /etc/udhcpd.conf /etc/sysctl.d/raspap.conf
# MD5sum for package: 947a8216c0ecb2c3dfa1f093c47a5afe  raspap.tar.gz
# 
# File list:
# /etc/network/interface
# /etc/hostapd/hostapd.conf
# /etc/iptables.ipv4.nat
# /etc/udhcpd.conf
# /etc/sysctl.d/raspap.conf
