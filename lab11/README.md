```markdown
Uploading Custom SSH Key Pair using Ansible

Pre check:
--> You have a public key for your workstation
--> You have configured aws Credentails 
   Either via ~/.aws/credentials
   or using environment variables like
   export AWS_ACCESS_KEY_ID=your-key-id
   export AWS_SECRET_ACCESS_KEY=your-secret
 --> You have boto3 and botocore installed.

1. Create a vault file to store you public key
ansible-vault create vault_key.yml

2. Paste the ssh key
ssh_public_key: |
  ssh-rsa AAAAB3...your-public-key... user@host
3. Save and Exit

4.Run the playbook with vault password
ansible-playbook upload_keypair.yml --ask-vault-pass

5. After running the playbook, confirm the key was uploaded:
aws ec2 describe-key-pairs
```
