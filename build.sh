#!/bin/sh

# 実行時に指定された引数の数、つまり変数 $# の値が 1 でなければエラー終了。
if [ $# -ne 1 ]; then
  echo "指定された引数は$#個です。" 1>&2
  echo "実行するには1個の引数が必要です。build.sh dir" 1>&2
  exit 1
fi

echo $1
cp ../dice_lambda/$1/index.js index.js
zip package.zip index.js
aws lambda update-function-code --function-name $1 --zip-file fileb://package.zip
rm index.js
rm package.zip

