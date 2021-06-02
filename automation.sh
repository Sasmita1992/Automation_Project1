###########################This is for TASK 2#######################
#########################This will be updated by Dev Branch by Pull request####################
#Update package#
sudo apt update -y
#Check If Apache2 is installed or not#
dpkg --get-selections | grep apache2
#Install Pacage apache2#
sudo apt install apache2
#Check for apache2 status#
service apache2 status
#Restart apache2 Service#
sudo systemctl start apache2
# Installing awscli
sudo apt update
sudo apt install awscli
#Code for transfering the tar log file to S3#
cd /var/log/
myname='sasmita'
timestamp=$(date '+%d%m%Y-%H%M%S')
sudo tar -cvf ${myname}-httpd-logs-${timestamp}.tar --exclude=other_vhosts_access.log  apache2/*.log 
cp /var/log/${myname}-httpd-logs-${timestamp}.tar /tmp 
s3_bucket=upgrad-sasmita
aws s3 \
cp /tmp/${myname}-httpd-logs-${timestamp}.tar \s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar
#Creating Inventory.html iand apend all the data every time#
size=$( (du -k /tmp/${myname}-httpd-logs-${timestamp}.tar | cut -f1) )
