# NGINX Load Balancer with Apache Web Servers (Ansible + Vagrant)

This project sets up a simple load-balanced environment using **NGINX** to distribute HTTP requests between two Apache web servers (`web01` and `web02`). Provisioning is done using **Vagrant**, and configuration is automated with **Ansible**.

---

## 🔧 Setup Overview

- `web01` and `web02` run Apache (`apache2`) and serve a static HTML file.
- `loadbalancer` runs NGINX and distributes traffic between the two web servers using a `round-robin` strategy.
- `db01` is included as a placeholder database server.
- Each VM uses port forwarding to expose services to the host machine.

---

## 🚀 Apache Configuration Notes

Apache is reconfigured on each web server to listen on **non-standard ports** to avoid conflicts when running multiple VMs:

- `web01` listens on **port 8080**
- `web02` listens on **port 8081**

### Apache Config Changes (done via Ansible or manually):

- Update `/etc/apache2/ports.conf`:
  ```bash
  Listen 8080   # or 8081 on web02

- Update `/etc/apache2/sites-available/000-default.conf`:
  <VirtualHost *:8080>   # or *:8081

- Restart Apache
  ```bash
  sudo systemctl restart apache2

Access the Website at localhost:8048