---

```markdown
# Ansible AWS EC2 Dynamic Inventory Setup

This project demonstrates how to use Ansible's `aws_ec2` dynamic inventory plugin to manage EC2 instances in AWS.

---

## 🔧 Requirements

- Python 3.x
- Ansible
- boto3
- botocore
- AWS credentials (configured via environment variables or `~/.aws/credentials`)

---

## 🧪 Virtual Environment Setup

To ensure a clean, isolated environment for Ansible and its AWS dependencies, use a Python virtual environment.

### 1. Create and Activate a Virtual Environment

```bash
cd ~
python3 -m venv ansible-env
source ansible-env/bin/activate
```

### 2. Install Required Packages Inside the Venv

```bash
pip install ansible boto3 botocore
```

> ⚠️ It's **crucial** that Ansible is installed inside the virtual environment. Otherwise, Ansible may default to the system Python, which won’t have the AWS libraries installed.

---

## 📁 Project Structure

```text
lab10/
├── ansible.cfg
├── aws_ec2.yml
├── install_git.yml
```

---

## ⚙️ Configuration Files

```

---

## ✅ Running the Inventory

Activate your environment and run:

```bash
source ~/ansible-env/bin/activate
cd ~/lab10
ansible-inventory -i aws_ec2.yml --list
```

---

## 📁 ansible.cfg Configuration

```ini
[defaults]
inventory = aws_ec2.yml
private_key_file = ~/.ssh/your PEM file
remote_user = <your ec2 user>
host_key_checking = False
interpreter_python = ~/ansible-env/bin/python
```

> 🔁 `interpreter_python` ensures Ansible uses the right Python from your virtual environment.

---


## 🔐  SSH Key Setup

Ensure your AWS `.pem` key is present and secure:

```bash
Copy your aws pem file to ssh directory
cp  yourpem.pem~/.ssh/
chmod 400 ~/.ssh/your pem .pem
```

Manually verify access:

```bash
ssh -i ~/.ssh/your pem key .pem ubuntu@<your-ec2-public-ip>
```

---

## 🧪  Test Ansible Connection

Once `aws_ec2.yml` and `ansible.cfg` are set up correctly, test connection to your EC2 instances:

```bash
ansible all -i aws_ec2.yml -m ping
```


---

## 💾 Install Software with a Playbook


```

Run playbook to install git on your aws ec2 instances :

```bash
ansible-playbook -i aws_ec2.yml install_git.yml
```

---



## 📎 References

- [Ansible aws_ec2 Plugin Docs](https://docs.ansible.com/ansible/latest/collections/amazon/aws/aws_ec2_inventory.html)
- [boto3 GitHub](https://github.com/boto/boto3)

