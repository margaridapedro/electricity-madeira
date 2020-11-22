FROM node:latest
USER root
LABEL maintainer="Margarida Pedro"

WORKDIR /home/electricity-madeira

COPY src/ src/

# install plot digitizer
RUN npm install src/plot-digitizer/

# install extraction script
RUN chmod +x src/extraction.sh

# acquire data
COPY data/raw/ data/

# run data extraction
CMD src/extraction.sh
