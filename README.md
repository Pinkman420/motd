cd /opt
curl -o /opt/proxmox-welcome-message.sh https://github.com/Pinkman420/motd/blob/main/proxmox-welcome-message.sh
chmod +x /opt/proxmox-welcome-message.sh
ln -s /opt/proxmox-welcome-message.sh /etc/update-motd.d/11-proxmox-welcome-message
chmod -x /etc/update-motd.d/10-uname
