FROM cooptilleuls/varnish:6.0

LABEL maintainer="rockzhang@ciandt.com"

ENV HTTP_RESP_SIZE '512k'

ENV HTTP_RESP_HDR_LEN '512k'

ENV WORKSPACE_BACKEND '1024k'

EXPOSE 6082

CMD ["sh", "-c", "varnishd -T 0.0.0.0:6082 -p workspace_backend=${WORKSPACE_BACKEND} -p http_resp_size=${HTTP_RESP_SIZE} -p http_resp_hdr_len=${HTTP_RESP_HDR_LEN} -S none -F -f /usr/local/etc/varnish/default.vcl"]
