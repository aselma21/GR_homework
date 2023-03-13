#!/bin/bash
while [ ! -e /dev/xvdf ]; do sleep 1; done
sudo mkfs.ext4 /dev/xvdf
sudo mkdir /mnt/data
sudo mount /dev/xvdf /mnt/data
echo "/dev/xvdf /mnt/data ext4 defaults 0 0" >> /etc/fstab
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2.service
echo "Hello GR World" | sudo tee /var/www/html/index.html
sudo mv /var/www/html /mnt/data/
sudo sed -i 's|DocumentRoot /var/www/html|DocumentRoot /mnt/data/var/www/html|' /etc/apache2/apache2.conf
    
