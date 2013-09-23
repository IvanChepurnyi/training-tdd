#!/bin/bash
MAGE_DIR=magento
MAGE_VERSION=1.7.0.2
PHPUNIT_MODULE="https://github.com/EcomDev/EcomDev_PHPUnit.git --branch dev"
composer install
bin/mage-ci install $MAGE_DIR $MAGE_VERSION magento -c -t -r http://mage-ci.ecomdev.org
bin/mage-ci install-module $MAGE_DIR $PHPUNIT_MODULE
ln -s ./src $MAGE_DIR/training-modules 
bin/mage-ci install-module $MAGE_DIR ./training-modules
bin/mage-ci shell $MAGE_DIR ecomdev-phpunit.php -a magento-config --db-name magento_test --base_url http://training-tdd.dev/
