#
# Rock R Server Dockerfile with DataSHIELD
#
# https://github.com/obiba/docker-rock-demo
#

FROM datashield/rock-base:latest

ENV DSMTL_VERSION main

ENV ROCK_LIB /var/lib/rock/R/library

# Additional system dependencies
#RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y ???

# Update R packages
#RUN Rscript -e "update.packages(ask = FALSE, repos = c('https://cloud.r-project.org'), instlib = '/usr/local/lib/R/site-library')"

# Install new R packages
# dsMTLBase
RUN Rscript -e "remotes::install_github('transbioZI/dsMTLBase', ref = '$DSMTL_VERSION', dependencies = TRUE, upgrade = FALSE, lib = '$ROCK_LIB')"

RUN chown -R rock $ROCK_LIB
