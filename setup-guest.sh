#!/bin/bash

cd /vagrant/
MAGE_DIR=magento
MAGE_VERSION="1.7.0.2"
MAGE_URL="training-tdd.dev"
PHPUNIT_MODULE="https://github.com/EcomDev/EcomDev_PHPUnit.git --branch dev"
/home/vagrant/bin/composer install 
bin/mage-ci install $MAGE_DIR $MAGE_VERSION magento -c -t -r http://mage-ci.ecomdev.org -b "http://$MAGE_URL/"
bin/mage-ci install-module $MAGE_DIR $PHPUNIT_MODULE
bin/mage-ci install-module $MAGE_DIR $(pwd)/src
bin/mage-ci shell $MAGE_DIR ecomdev-phpunit.php -a magento-config --db-name magento_test --base_url "http://$MAGE_URL/"

sed 's/training.dev/training-tdd.dev/g' /etc/nginx/sites-available/training.dev > /tmp/training.dev 
sudo cp -f /tmp/training.dev /etc/nginx/sites-available/training.dev
sudo service nginx reload

