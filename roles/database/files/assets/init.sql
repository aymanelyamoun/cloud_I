CREATE DATABASE IF NOT EXISTS {DB_NAME};

-- Create user with proper host specification
CREATE USER '{DB_USER}'@'%' IDENTIFIED BY '{DB_PASSWORD}';
GRANT ALL ON {DB_NAME}.* TO '{DB_USER}'@'%';

-- Set root password but allow remote connections
ALTER USER 'root'@'localhost' IDENTIFIED BY '{DB_ROOT_PASSWORD}';
FLUSH PRIVILEGES;

