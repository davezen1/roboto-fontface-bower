#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for FILE in $DIR/css/*/*.scss; do
  echo "sass $FILE"
  cssfile="${FILE:0:${#FILE}-5}"
  node-sass "$FILE" --output-style expanded > "${cssfile}.css"
  node-sass "$FILE" --output-style compressed > "${cssfile}.min.css"
done
