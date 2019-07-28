ARG USER_NAME="developer"

FROM ubuntu
LABEL maintainer="D.futagi@vivaldi.net"
ARG USER_NAME
# entrypoint.sh用
ENV USER_NAME=$USER_NAME

# ENV DEBIAN_FRONTEND="noninteractive"
RUN apt update && \
      apt install -y --no-install-recommends \
      sudo \
      && \
      rm -rf /var/lib/apt/lists/*

# sudoを使用できるようにする
RUN echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${USER_NAME}

# entrypoint.sh用、ユーザー追加のパーミッション
# entrypoint.shで元に戻す
RUN chmod u+s /usr/sbin/useradd && \
    chmod u+s /usr/sbin/groupadd

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
