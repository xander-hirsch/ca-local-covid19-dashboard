#!/bin/bash
NAME='ca-local-covid-19-dashboard'
docker build --tag $NAME . \
    && docker tag $NAME "registry.heroku.com/$NAME/web" \
    && docker push "registry.heroku.com/$NAME/web" \
    && heroku container:release web --app $NAME \
    || echo "-------- Something went wrong! --------"
