# Docker Container with Fast.com CLI sending data to MySQL Server

The Docker needs the following ENV Variables:

SLEEP : Seconds between measures

MYSQL_SERVER : IP/Address of MySQL Server

MYSQL_USER: MySQL Username

MYSQL_PASS: MySQL Password

MYSQL_DATABASE: MySQL Database

MYSQL_TABLE: MySQL Table

LOC: Name of Probe (eg. network/core or network/edge)

Example:

```
 docker run -e MYSQL_SERVER=10.10.10.10 -e MYSQL_USER=USER -e MYSQL_PASS='PASSWORD' -e MYSQL_DATABASE=fastcom -e MYSQL_TABLE=results -e LOC='network/core' -e SLEEP=3600 simonjenny/fastcom-mysql:latest
```
