FROM rocker/rstudio:4.4.1

RUN echo "rstudio ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/rstudio

RUN apt-get update && apt-get install -y \
  libcurl4-openssl-dev \
  libssl-dev \
  libxml2-dev \
  sudo \
  gdebi-core \
  && rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages('renv', repos='https://cran.rstudio.com')"

WORKDIR /home/rstudio/project

RUN mkdir -p /home/rstudio/project/output && chmod -R 777 /home/rstudio/project/output

COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN chmod -R 777 /home/rstudio/project/renv

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN R -e "renv::restore()"

RUN mkdir -p /home/rstudio/project/{code,dataset,output,final_report}

COPY code /home/rstudio/project/code
COPY dataset /home/rstudio/project/dataset
COPY report.Rmd /home/rstudio/project/report.Rmd
COPY makefile /home/rstudio/project/makefile
COPY README.md /home/rstudio/project/README.md

EXPOSE 8787

ENV PASSWORD=rstudio

CMD ["make","report.html"]


