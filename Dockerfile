#
# Rock R Server Dockerfile with DataSHIELD
#
# https://github.com/obiba/docker-rock-demo
#

FROM datashield/rock-base:latest

ENV DSGEO_VERSION master

ENV ROCK_LIB /var/lib/rock/R/library

# Additional system dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libgdal-dev gdal-bin libproj-dev proj-data proj-bin libgeos-dev

# Update R packages
#RUN Rscript -e "update.packages(ask = FALSE, repos = c('https://cloud.r-project.org'), instlib = '/usr/local/lib/R/site-library')"

# Install new R packages

# dsGeo
RUN Rscript -e "remotes::install_version('rgdal', version = '1.5-12', repos = 'https://cloud.r-project.org', upgrade = 'never')"
RUN Rscript -e "remotes::install_github('tombisho/dsGeo', ref = '$DSGEO_VERSION', dependencies = TRUE, upgrade = FALSE, lib = '$ROCK_LIB')"

RUN chown -R rock $ROCK_LIB
