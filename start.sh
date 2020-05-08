#!/bin/bash
echo "Starting Mysql..."
service mysql start
echo "Mysql [OK]"
echo "Starting Apache..."
service apache2 start
echo "Apache2 [OK]"
echo "Container has been initialized!"
