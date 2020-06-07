FROM ubuntu:18.04 AS steam-install

USER 0

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y curl vim lib32stdc++6 lib32gcc1
RUN echo steam steam/question select "I AGREE" | debconf-set-selections
RUN echo steam steam/license note '' | debconf-set-selections
RUN apt-get install -y steamcmd
RUN /usr/games/steamcmd +login anonymous +quit

