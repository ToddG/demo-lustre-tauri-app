#!/bin/bash

gleam run -m lustre/dev build app --minify

cp ./index.html ./priv/static/index.html

sed -i 's/app\.css/app\.min\.css/' ./priv/static/index.html
sed -i 's/app\.mjs/app\.min\.mjs/' ./priv/static/index.html
sed -i 's/\/priv\/static/\./' ./priv/static/index.html

rm -rf ./dist
mkdir -p ./dist
cp -rv ./priv/static/* ./dist/.
