#!/bin/bash

# Script commonly used during image building to defined secure CHMOD permissions to folders and files by a given path.
# @authors Yuri Koster, Marcos Freitas

# Run as:
# bash this-script.sh /var/www and again passing your project folder /var/www/project-path

FILE_PATH=$1;

if [[ ! -d "$FILE_PATH" ]]; then
    echo 'Path argument not defined';
    exit;
fi;

echo "Fixing permissions at ${FILE_PATH}";

chmod 775 ${FILE_PATH} -R && \
chmod 2775 ${FILE_PATH} -R && \
chown -R nginx:nginx ${FILE_PATH} -R;

cd ${FILE_PATH};

if [[ ! -z $(ls -A .) ]]; then
    find * -type d -exec chmod -R 775 {} \; && find * -type f -exec chmod -R 664 {} \;
else
    echo 'Path is empty, not running commands for children.';
fi;
