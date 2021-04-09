FROM ubuntu:latest

ARG user=user
ARG tz=Europe/Warsaw

RUN ln -snf /usr/share/zoneinfo/"$tz" /etc/localtime && echo "$tz" > /etc/timezone

RUN apt-get update \
    && apt-get install -y curl git make python3-pip wget axel librsvg2-2 \
    apt-utils texlive sudo \
    && apt-get clean

RUN pandoc_deb=pandoc-2.11.2-1-amd64.deb \
    && url=https://github.com/jgm/pandoc/releases/download/2.11.2/"$pandoc_deb" \
    && wget --quiet -c "$url" \
    && apt-get install -y ./"$pandoc_deb" \
    && rm "$pandoc_deb" \
    && apt-get clean

RUN echo "$user ALL=(ALL) NOPASSWD:ALL" | tee --append /etc/sudoers
RUN useradd --create-home "$user"

USER $user

RUN echo 'export PATH="$HOME"/.local/bin:"$PATH"' | tee -a ~/.profile

RUN tlmgr init-usertree

RUN tlmgr install \
    texliveonfly \
    caption \
    epstopdf \
    biblatex-ieee \
    parskip \
    luaotfload \
    luatexbase \
    ctablestack \
    pdfpages \
    algorithm2e \
    ifoddpage \
    relsize \
    opensans \
    slantsc \
    caption \
    mathtools \
    parskip \
    listings \
    float \
    lualatex-math

RUN pip3 install --user \
    pandoc-fignos
    pandoc-eqnos
    pandoc-tablenos
    pandoc-secnos
    pandoc-crossref
    pandoc-plantuml-filter
