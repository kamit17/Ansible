# NGINX Load Balancer with Apache Web Servers (Ansible + Vagrant)

This project further extends lab02 by implementing TLS  and  sets up a simple load-balanced environment using **NGINX** to distribute HTTP(S) requests between two Apache web servers (`web01` and `web02`, provisioned in `ansible_lab1`). Provisioning is done using **Vagrant**, and configuration is automated with **Ansible**.

---

## 🔧 Setup Overview

- `web01` and `web02` run Apache (`apache2`) and serve a static HTML file.
- `loadbalancer` runs NGINX and distributes traffic between the two web servers using a `round-robin` strategy.
- TLS (HTTPS) is optionally enabled for secure access via `https://localhost:8443`.
- `db01` is included as a placeholder database server.
- Each VM uses port forwarding to expose services to the host machine.

---

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

 ## 🚀 Accessing the Load Balancer
 Via HTTP:
http://localhost:8048

Via HTTPS (TLS enabled):
https://localhost:8443

You may see a browser warning for the self-signed certificate — that's expected in local dev.

## 🚀 TLS support  Notes

For HTTP only:
ansible-playbook nginx_lb.yml -i inventory.ini -e "hostname=loadbalancer tls_enabled=false"

For HTTPS (TLS enabled):
ansible-playbook nginx_lb.yml -i inventory.ini -e "hostname=loadbalancer tls_enabled=true"
