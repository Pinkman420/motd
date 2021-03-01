cd /opt <br>
curl -o /opt/proxmox-welcome-message.sh https://github.com/Pinkman420/motd/blob/main/proxmox-welcome-message.sh <br>
chmod +x /opt/proxmox-welcome-message.sh <br>
ln -s /opt/proxmox-welcome-message.sh /etc/update-motd.d/11-proxmox-welcome-message <br>
chmod -x /etc/update-motd.d/10-uname <br>
