FROM alpine:3.6

RUN apk add --no-cache gcc musl-dev git make gfortran &&\
  cd / && git clone -b experimental --depth=1 https://github.com/at-wat/RTKLIB.git &&\
  cd RTKLIB/app && make CC=gcc && make install &&\
  cd / && rm -rf /RTKLIB &&\
  apk del --no-cache gcc musl-dev git make gfortran

EXPOSE 6000

STOPSIGNAL SIGTERM

COPY entrypoint.sh /entrypoint.sh
COPY ubx_m8t_glsb_raw_5hz.cmd /usr/local/share/rtklib/data/

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
CMD []
