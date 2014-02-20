#!/bin/bash
#
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

## WIP
# Installing needed applications
	echo -e "Installing needed applications: hostpapd,udhcpd and iw";
	sudo apt-get -y hostapd udhcpd iw > /dev/null 2>&1 ; &&

# Downloading and installing config files:
	echo -e "Downloading needed configuration";
	sudo cd /root/
	sudo wget http://nixhost.co/raspap/raspap.tar.gz &&
	# Sleeping to make sure the file is downloaded.
	sleep 10
	# Extracting needed configuration files:
	echo -e "Extracting needed config files";
	sudo tar -xzf /root/raspap.tar.gz > /dev/null 2>&1 ; &&

# Changing configs
sed -i 's/^DHCPD_ENABLE/#DHCPD_ENABLE/' /etc/default/udhcpd
#sed -i '/^DHCPD_ENABLE/ s/^/#/' /etc/default/udhcpd
/etc/default/hostapd - DAEMON_CONF="/etc/hostapd/hostapd.conf"

## /WIP

# Starting services
if [ -f /etc/hostapd/hostapd.conf ]
 then
	sudo service hostapd start
 else
	echo -e "HostAPD config missing";
fi

if [ -f /etc/udhcpd.conf ]
 then
	sudo service udhcpd start
 else
	echo -e "Udhcpd config missing";
fi

# Adding Services to startup
echo -e "Adding services to startup!"
sudo update-rc.d hostapd enable
sudo update-rc.d udhcpd enable
sleep 10
echo -e "All done, now you can reboot and the Access Point should come up automagically!"
