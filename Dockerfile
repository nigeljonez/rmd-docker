FROM r-base:latest

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
           chromium \
           pandoc \
           libjs-mathjax \
           fonts-mathjax-extras \
           openssh-client \
           git \
      && rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages(c('knitr', 'revealjs', 's20x', 'tinytex')); library(tinytex); tinytex::install_tinytex()" \
      && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

CMD ["R"]
