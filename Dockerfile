FROM mikefarah/yq AS yq

FROM python:3.7

RUN pip install pipenv

RUN curl -o /usr/local/bin/jq -L https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
RUN chmod +x /usr/local/bin/jq

COPY --from=yq /usr/bin/yq /usr/local/bin/yq

ENTRYPOINT pipenv
