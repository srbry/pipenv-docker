FROM mikefarah/yq AS yq

FROM python:3.7

RUN pip install pipenv

RUN apt-get update && apt-get install -y \
  jq
RUN apt-get clean

COPY --from=yq /usr/bin/yq /usr/local/bin/yq

ENTRYPOINT pipenv
