Role Name
=========

The role now uses a modular structure with dedicated directories for defaults, vars, tasks, handlers, templates, and tests:
roles/
└── httpd/
    ├── defaults/
    │   └── main.yml        # Contains default variable values (e.g., TLS settings)
    ├── vars/
    │   └── main.yml        # Contains role-specific variables (e.g., backend_servers list)
    ├── tasks/
    │   └── main.yml        # Contains the main configuration tasks
    ├── handlers/
    │   └── main.yml        # Contains handlers (e.g., to restart services)
    ├── templates/
    │   └── nginx.conf.j2   # Jinja2 template for NGINX configuration
    └── tests/
        └── test.yml        # Contains tasks to test the configuration


Requirements
------------

N/A

Role Variables
--------------

This role provides several settable variables defined in both defaults/main.yml and vars/main.yml. The key variables include:

tls_enabled: Boolean to enable or disable TLS configuration.

tls_dir: The directory where TLS certificates are stored.

key_file: The filename for the TLS key.

cert_file: The filename for the TLS certificate.

conf_file: The file path for the NGINX configuration.

backend_servers: A list of backend servers used by the role. This variable is now defined in roles/httpd/vars/main.yml and looks like:
---
backend_servers:
  - name: web01
    address: "{{ hostvars['web01'].ansible_host }}"
    port: 8080
  - name: web02
    address: "{{ hostvars['web02'].ansible_host }}"
    port: 8081

Variables can be overridden by extra vars, inventory files, or higher precedence variable files if needed.
Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

---
- name: Configure NGINX Load Balancer (Optional TLS)
  hosts: loadbalancer
  become: true
  gather_facts: false
  roles:
    - httpd

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
