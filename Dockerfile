FROM ubuntu:latest

ARG user=user
ARG tz=Europe/Warsaw

RUN ln -snf /usr/share/zoneinfo/"$tz" /etc/localtime && echo "$tz" > /etc/timezone

RUN apt-get update \
    && apt-get install -y curl git make python3-pip wget axel librsvg2-2 \
    apt-utils texlive \
    && apt-get clean

RUN pandoc_deb=pandoc-2.11.2-1-amd64.deb \
    && url=https://github.com/jgm/pandoc/releases/download/2.11.2/"$pandoc_deb" \
    && wget --quiet -c "$url" \
    && apt-get install -y ./"$pandoc_deb" \
    && rm "$pandoc_deb"

RUN useradd --create-home "$user"

USER $user

RUN tlmgr init-usertree
