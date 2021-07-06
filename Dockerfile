#
# Rock R Server Dockerfile with DataSHIELD
#
# https://github.com/obiba/docker-rock-demo
#

FROM datashield/rock-base:latest

ENV MEAL_VERSION master
ENV DSOMICS_VERSION master

ENV ROCK_LIB /var/lib/rock/R/library

# Additional system dependencies
#RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y ???

# Update R packages
#RUN Rscript -e "update.packages(ask = FALSE, repos = c('https://cloud.r-project.org'), instlib = '/usr/local/lib/R/site-library')"

# Install new R packages
# dsOmics
RUN Rscript -e "BiocManager::install(c('Biobase', 'SNPRelate', 'GENESIS', 'GWASTools', 'GenomicRanges', 'SummarizedExperiment', 'DESeq2', 'edgeR'), update = FALSE, ask = FALSE, dependencies = TRUE, lib = '$ROCK_LIB')"
RUN Rscript -e "remotes::install_github('isglobal-brge/MEAL', ref = '$MEAL_VERSION', dependencies = TRUE, upgrade = FALSE, lib = '$ROCK_LIB')"
RUN Rscript -e "remotes::install_github('isglobal-brge/dsOmics', ref = '$DSOMICS_VERSION', dependencies = TRUE, upgrade = FALSE, lib = '$ROCK_LIB')"

RUN chown -R rock $ROCK_LIB
