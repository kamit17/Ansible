# NGINX Load Balancer with Apache Web Servers (Ansible + Vagrant)

This project further extends lab5  by implementing Ansible vault to encrypt the certificate and key for NGINX TLS encryption . 

---

## 🔧 Setup Overview

- `web01` and `web02` run Apache (`apache2`) and serve a static HTML file.
- `loadbalancer` runs NGINX and distributes traffic between the two web servers using a `round-robin` strategy.
- TLS (HTTPS) is optionally enabled for secure access via `https://localhost:8443`.
- `db01` is included as a placeholder database server.
- Each VM uses port forwarding to expose services to the host machine.

---
## 🔧 Generate local cert on ansible controller under lab3/files directory by running this command
openssl req -x509 -nodes -days 365 -newkey rsa:2048   -keyout nginx.key   -out nginx.crt   -subj "/CN=localhost"


## 🚀 Apache Configuration Notes

Apache is reconfigured on each web server to listen on **non-standard ports** to avoid conflicts when running multiple VMs:

- `web01` listens on **port 8080**
- `web02` listens on **port 8081**

### Apache Config Changes (via Ansible or manually):

- Update `/etc/apache2/ports.conf`:
  ```bash
  Listen 8080   # or 8081 on web02

## 🚀 TLS support  Notes
  TLS is supported by the load balancer via self-signed certificates. These are provided via the files/ directory and copied to the VM using Ansible.
  - `files/nginx.crt - self signed certificate
  - `files/nginx.key - corresponding privatge key
  These are deployed to /etc/nginx/ssl on the loadbalancer VM.
  The Playbook will configure NGINX to :
  Redirect HTTP to HTTPS.
  Use TLS for secure connections when tls_enabled=true

## � TLS support  Notes
Create a vault.yml (or similar) file with contents like
tls_cert: |
  -----BEGIN CERTIFICATE-----
  <your cert content here>
  -----END CERTIFICATE-----

tls_key: |
  -----BEGIN PRIVATE KEY-----
  <your private key here>
  -----END PRIVATE KEY-----

cert_file: server.crt
key_file: server.key

Then encrypt this file with :
ansible-vault encrypt vars/vault.yml


 ## 🚀 Accessing the Load Balancer
 Via HTTP:
http://localhost:8048

Via HTTPS (TLS enabled):
https://localhost:8443

You may see a browser warning for the self-signed certificate — that's expected in local dev.

## 🚀 Running the playbook
For Apache only:
ansible-playbook site.yml -i inventory.ini -e  --tags apache

For HTTP only:
ansible-playbook -i hosts site.yml --tags nginx -e "tls_enabled=false" --ask-vault-pass

For HTTPS (TLS enabled):
ansible-playbook -i hosts site.yml --tags nginx -e "tls_enabled=true" --ask-vault-pass
