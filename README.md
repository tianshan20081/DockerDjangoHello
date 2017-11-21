Docker Django HelloWorld 
-----

env

```
ECS: CentOS 7.4 64

```

### Install Docker
[CentOS更新Docker至最新版本](https://github.com/waylybaye/HyperApp-Guide/blob/master/zh/centos-upgrade-docker.md)

#### 卸载旧版本
```
yum remove docker \
                  docker-common \
                  container-selinux \
                  docker-selinux \
                  docker-engine \
                  docker-engine-selinux  
```

#### 使用仓库安装最新版Docker

##### 安装Docker的依赖

`sudo yum install -y yum-utils device-mapper-persistent-data lvm2`

##### 安装Docker官方仓库
```
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```

##### 更新仓库源

`sudo yum makecache fast`

注意.如果你是第一次安装Docker.会提示接受gpg密钥.接受即可
从仓库安装Docker-CE

`sudo yum install docker-ce`
安装制定版本的Docker

`sudo yum install docker-ce-<VERSION>`

##### 启动Docker

`sudo systemctl start docker.service`

##### 查看版本
```
docker --version
Docker version 17.09.0-ce, build afdb6d4
```

##### 设置Docker开机启动

`sudo systemctl enable docker`

EOF.

### Install Docker-compose
[Install Docker Compose](https://docs.docker.com/compose/install/)
[Install Last Docker-compose](https://github.com/docker/compose/releases)

```
curl -L https://github.com/docker/compose/releases/download/1.17.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

#### 查看版本信息
```
# docker-compose --version
docker-compose version 1.17.1, build 6d101fb
```

### Start With Django
[Quickstart: Compose and Django](https://docs.docker.com/compose/django/)

`Dockerfile`
```
FROM python:3.6.2
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
ADD . /code/
```

requirements.txt
```
Django>=1.8,<2.0
ujson==1.35
```

docker-compose.yml
```
version: '3'

services:
  web:
    build: .
    command: python3 manage.py runserver 0.0.0.0:8000
    ports:
      - "8000:8000"
    volumes:
      - .:/code
```

tree
```
[root@mz DockerDjangoHello]# tree
.
├── db.sqlite3
├── docker-compose.yml
├── DockerDjangoHello
│   ├── __init__.py
│   ├── __pycache__
│   │   ├── __init__.cpython-36.pyc
│   │   ├── settings.cpython-36.pyc
│   │   ├── urls.cpython-36.pyc
│   │   └── wsgi.cpython-36.pyc
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── Dockerfile
├── manage.py
└── requirements.txt
```

### 运行
```
docker-compose up
```

