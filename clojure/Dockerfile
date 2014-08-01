FROM dockerfile/java

MAINTAINER Bruno Tavares <@bltavares>

RUN wget -O /usr/bin/lein https://raw.github.com/technomancy/leiningen/stable/bin/lein && \
      chmod +x /usr/bin/lein && \
      LEIN_ROOT="ok" /usr/bin/lein upgrade

ENV LEIN_ROOT "ok"

CMD /usr/bin/lein repl
