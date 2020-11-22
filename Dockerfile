FROM node:latest
USER root
LABEL maintainer="Margarida Pedro"

WORKDIR /home/electricity-madeira

COPY src/ src/

# install plot digitizer
RUN npm install src/plot-digitizer/
# install tesseract OCR
RUN apt-get update && apt-get install -y tesseract-ocr

# install axis detection script
RUN chmod +x src/axis-detection/axis.sh
# install extraction script
RUN chmod +x src/extraction.sh

# acquire data
COPY data/raw/20201025.png data/20201025.png

# run data extraction
CMD src/extraction.sh data/20201025.png
