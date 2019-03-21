#!/bin/sh
cp -r ../dice_lambda_layer/nodejs ./nodejs
zip -r dice-layer.zip nodejs
ARN=`aws lambda publish-layer-version --layer-name dice-layer --zip-file fileb://dice-layer.zip --compatible-runtimes nodejs8.10 | jq -r .LayerVersionArn`
aws lambda update-function-configuration --function-name diceUpdateName --layers $ARN
aws lambda update-function-configuration --function-name diceUpdatePlace --layers $ARN
aws lambda update-function-configuration --function-name diceUpdateDice --layers $ARN
aws lambda update-function-configuration --function-name diceGetUser --layers $ARN
aws lambda update-function-configuration --function-name diceCreateUser --layers $ARN
aws lambda update-function-configuration --function-name diceGetBoard --layers $ARN

rm -rf nodejs
rm dice-layer.zip

