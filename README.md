# futafi/docker-sudo

# 説明
いい感じにユーザーとsudoを追加したubuntu

# 使い方

set .env file
```bash
$ echo -e "UID=$(id -u)\nGID=$(id -g)" > .env
```

build docker image
```bash
$ docker-compose build --build-arg USER_NAME="developer"
```

run image
```bash
$ docker-compose run ubuntu
```
