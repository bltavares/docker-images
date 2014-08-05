FROM bltavares/java

MAINTAINER Bruno Tavares <@bltavares>

ENV LEIN_ROOT "ok"
RUN kickstart local clojure
RUN lein upgrade

CMD /usr/bin/lein repl
