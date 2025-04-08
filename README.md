# WordPress Stack Deployment with Ansible

This project provides an automated deployment solution for a complete WordPress environment using Ansible and Docker. It creates a production-ready stack with Nginx, WordPress, and MariaDB containers.

## Project Overview

The deployment consists of three main services:

1. **Webserver** - Nginx with SSL support
2. **Application** - WordPress PHP-FPM
3. **Database** - MariaDB

All components are containerized using Docker and orchestrated with Docker Compose.

## Prerequisites

- Ubuntu/Debian target system
- Ansible 2.9 or newer
- SSH access to target machine
- Sufficient permissions (sudo)

## Directory Structure
```markdown
cloud_I/
├── group_vars/           # Global variables
├── roles/                # Ansible roles
│   ├── docker/           # Docker installation
│   ├── database/         # MariaDB container
│   ├── webserver/        # Nginx with SSL
│   ├── application/      # WordPress
│   └── orchestration/    # Docker Compose deployment
├── wordpress-stack.yml   # Main playbook
└── inventory.ini         # Target hosts
```


## Configuration

The stack can be configured through variables in `group_vars/all.yml`:

```yaml
app_root_dir: "/opt/wordpress-stack"  # Installation directory
org_prefix: "1337"                    # Container naming prefix
image_tag: "stable"                   # Docker image tag
server_domain: "example.com"          # Website domain

# Database settings
db_name: "wordpress_db"               # WordPress database name
db_user: "wp_user"                    # Database username
```
## Secrets Management
To securely manage sensitive information like passwords, use Ansible Vault:

1.Create a vault file:
```bash
ansible-vault create group_vars/vault.yml
```
2.Add your secret variables:
```bash
# Database passwords
vault_db_password: "secure_user_password"
vault_db_root_password: "secure_root_password"

# WordPress admin/user credentials
vault_admin_password: "secure_admin_password"
vault_user_password: "secure_user_password"

# Other sensitive information as needed
```
3.Reference vault variables in your environment template or other files:
```bash
DB_PASSWORD: "{{ vault_db_password }}"
```

## Usage

1. **Update Inventory**  
    Edit the `inventory.ini` file to include your target hosts. Example:
    ```ini
    [wordpress]
    target_host ansible_user=your_user ansible_ssh_private_key_file=/path/to/private/key
    ```

2. **Run the Playbook**  
    Execute the playbook to deploy the stack:
    ```bash
    ansible-playbook -i inventory.ini wordpress-stack.yml --ask-vault-pass
    ```

3. **Access Your Site**  
    Once the deployment is complete, visit your WordPress site at:
    ```
    https://your-domain.com
    ```

### SSL Certificate

This deployment uses a self-signed SSL certificate for securing the Nginx webserver. While this provides encryption, it is not trusted by browsers by default. To avoid browser warnings, consider replacing the self-signed certificate with one from a trusted Certificate Authority (CA) like Let's Encrypt.
