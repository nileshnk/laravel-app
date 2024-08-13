mysql --user=mysql --password="password" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS laravel;
    GRANT ALL PRIVILEGES ON \`laravel%\`.* TO 'mysql'@'%';
EOSQL