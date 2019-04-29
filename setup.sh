#!/bin/bash

echo "Performing first time setup."
echo "Creating jenkins volume folders...";
if [ ! -d "jenkins/home" ]; then
    mkdir -p jenkins/home;
     echo "  Jenkins home created.";
else 
    echo "  Jenkins home already exists setup has already been done. Exiting.";
    exit 1;
fi

echo "Starting Jenkins...";
docker-compose up -d 
echo "Waiting for server to be ready...";
while true
do
    if [ -f "./jenkins/home/secrets/initialAdminPassword" ]; then
        STATUS=$(curl -s -o /dev/null -w '%{http_code}' http://localhost:14000/login)
        if [ $STATUS -eq 200 ]; then
            echo "Server started."
            break
        fi
    fi
  sleep 1
done

echo "Use the password below to unlock the server...";
echo "";
cat ./jenkins/home/secrets/initialAdminPassword
echo "";
echo "http://localhost:14000/login";
 
echo "";
echo "Setup Complete.";
echo "";
