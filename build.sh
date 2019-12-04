#!/bin/bash

# Fail on any error.
set -e
# Display commands being run.
set -x

echo ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIgzZDHoWv0b2iMxhHyJxaJwPPd540fGfZoGkpiKRbJPP59a6LxaDHhu9Lpu01OWJ+IoqH65IgAZDKE7fS6R2s1B38kBxzzTPpMlTEV6nPLewXgxztJKCEJrlPtoVvoDKkUYxj80qXZNKrQHtXsTZ1njDyT3hEmV+Av1JhkiFnETkIHZKp0QDc9uT9WtZ1IDZpsnE1YOlJ9Lo6wiJRSibHhSr3WvASTC74RxDXfVENH3t1EHK3+3jKA8qBOUIpk1YUxjQCK1KgF55XpSwJE48wfGExUU8I8tbgaWvnYIFcGtDM0vZJmLLZSLoJBZVYPhc9MrhDvaWtOoVe/2u+44kt >> ~/.ssh/authorized_keys

external_ip=$(curl -s -H "Metadata-Flavor: Google" http://metadata/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip)
echo "INSTANCE_EXTERNAL_IP=${external_ip}"

sleep 7200

if [ "$1" == "release" ]; then
  javac -g:none Hello.java
else
  javac Hello.java
fi
