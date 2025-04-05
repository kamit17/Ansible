# Simple Node.js Development VM

This project aims to make spinning up a simple local Node.js test/development environment incredibly quick and easy, and to introduce new developers to the wonderful world of Node.js development on local virtual machines.

It will install the following on a Rocky Linux  8 VM:

  - Node.js (latest version in EPEL repository)
  - Express
  - A simple demonstration Node.js app

# Run the Playbook
ansible-playbook  -i hosts nodejs.yml -e "node_apps_location=/usr/local/opt/node"