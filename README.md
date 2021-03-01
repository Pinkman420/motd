<b> For Proxmox Welcome Message </b>

cd /opt </br>

curl -o /opt/proxmox-welcome-message.sh https://github.com/Pinkman420/motd/blob/main/proxmox-welcome-message.sh <br>

chmod +x /opt/proxmox-welcome-message.sh <br>

ln -s /opt/proxmox-welcome-message.sh /etc/update-motd.d/11-proxmox-welcome-message <br>

chmod -x /etc/update-motd.d/10-uname <br>
<br>
<br>
<br>
<b> For RaspberryPi4 Welcome Message </b>

cd /opt </br>

curl -o /opt/raspberrypi-welcome-message.sh https://github.com/Pinkman420/motd/blob/main/raspberrypi-welcome-message.sh <br>

chmod +x /opt/raspberrypi-welcome-message.sh <br>

ln -s /opt/raspberrypi-welcome-message.sh /etc/update-motd.d/11-proxmox-welcome-message <br>

chmod -x /etc/update-motd.d/10-uname <br>
