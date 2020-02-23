FROM r-base:latest

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
           chromium \
           pandoc \
           libjs-mathjax \
           fonts-mathjax-extras \
           openssh-client \
           git \
      && rm -rf /var/lib/apt/lists/* \
      && wget https://github.com/jgm/pandoc/releases/download/2.7.2/pandoc-2.7.2-1-amd64.deb \\
      && dpkg -i pandoc-2.7.2-1-amd64.deb

RUN R -e "install.packages(c('knitr', 'revealjs', 'tinytex')); library(tinytex); tinytex::install_tinytex()" \
      && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

CMD ["R"]
