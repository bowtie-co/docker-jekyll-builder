FROM ruby

RUN gem install bundler jekyll

ENV BUILD_DIR /build
ENV BOWTIE_BIN /bowtie/bin

RUN mkdir -p $BUILD_DIR && mkdir -p $BOWTIE_BIN

COPY bin/* $BOWTIE_BIN/

RUN chmod +x $BOWTIE_BIN/*

ENV PATH $BOWTIE_BIN:$PATH

WORKDIR $BUILD_DIR

CMD [ "build-jekyll" ]
