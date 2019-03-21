#!/bin/sh
cp ../dice_static/index.html index.html
aws s3 cp index.html s3://dice2019/ --acl public-read
rm index.html

