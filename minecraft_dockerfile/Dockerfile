# Java Version
ARG JAVA_VERSION=11

FROM openjdk:${JAVA_VERSION}

# Define envs
ENV HOME_PATH=/opt/minecraft
ENV SERVER_PATH=$HOME_PATH/server
ENV SPIGOT_JAR="https://yivesmirror.com/api/file/paper/Paper-1.16.2-latest.jar"
ENV JAVA_ARGS="-Dcom.mojang.eula.agree=true"
ENV SPIGOT_ARGS=""


# User creation
RUN addgroup minecraft && \
    useradd -ms /bin/bash minecraft -g minecraft -d ${HOME_PATH} && \
    chown -R minecraft:minecraft ${HOME_PATH}

# Change the current user
USER minecraft

# Change working directory
WORKDIR ${HOME_PATH}

RUN mkdir ${SERVER_PATH}

ADD shells/entrypoint.sh entrypoint.sh

# Volumes
VOLUME $SERVER_PATH

EXPOSE 25565

ENTRYPOINT ["./entrypoint.sh"]

CMD ["start"]
