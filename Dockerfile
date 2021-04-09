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

# Fix tlmgr error (https://tex.stackexchange.com/a/528635)
#RUN curl -fsSL https://www.preining.info/rsa.asc | tlmgr key add -
#RUN wget http://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.sh \
#    && chmod +x update-tlmgr-latest.sh \
#    && sudo env PATH="/usr/share/texlive:$PATH" ./update-tlmgr-latest.sh

USER $user

RUN echo 'export PATH="$HOME"/.local/bin:"$PATH"' | tee -a ~/.profile
ENV PATH="$HOME/.local/bin:$PATH"

RUN tlmgr init-usertree

RUN pip3 install --user \
    pandoc-fignos \
    pandoc-eqnos \
    pandoc-tablenos \
    pandoc-secnos \
    pandoc-crossref \
    pandoc-plantuml-filter

#RUN tlmgr update --all

#RUN tlmgr install \
#    texliveonfly \
#    caption \
#    epstopdf \
#    biblatex-ieee \
#    parskip \
#    luaotfload \
#    luatexbase \
#    ctablestack \
#    pdfpages \
#    algorithm2e \
#    ifoddpage \
#    relsize \
#    opensans \
#    slantsc \
#    caption \
#    mathtools \
#    parskip \
#    listings \
#    float \
#    lualatex-math
