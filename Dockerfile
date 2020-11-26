FROM continuumio/miniconda:4.7.12
MAINTAINER Daniel Fischer <daniel.fischer@luke.fi>

LABEL description="Docker image containing all requirements for the nextflow-bcl pipeline"

COPY environment.yml .
RUN conda env update -n root -f environment.yml && conda clean -afy
RUN apt-get update && apt-get install -y procps