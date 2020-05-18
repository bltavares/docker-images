FROM java:8-jre-alpine

ENV LANG en_US.UTF-8
ENV PLANTUML_VERSION=1.2019.5

RUN apk update && apk upgrade && \
  apk add --no-cache bash git openssh

RUN \
  apk add --no-cache graphviz wget ca-certificates ttf-dejavu && \
  wget --quiet "https://downloads.sourceforge.net/project/plantuml/${PLANTUML_VERSION}/plantuml.${PLANTUML_VERSION}.jar" -O /plantuml.jar && \
  apk del wget

ADD requirements.txt /requirements.txt
RUN \
  apk add python3 python3-dev build-base --no-cache && \
  pip3 install --upgrade pip && \
  pip3 install -r /requirements.txt

ADD plantuml /usr/local/bin/plantuml
RUN chmod +x /usr/local/bin/plantuml

ADD mkdocs.yml /docs/mkdocs.yml

# Set working directory
WORKDIR /docs

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--livereload", "--dev-addr=0.0.0.0:8000"]
