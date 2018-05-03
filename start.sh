#!/bin/sh

printf "Checking for Rserve connection."
until [ `ruby $HOME/rserve.rb` -eq "0" ]; do
  printf "."
  sleep 2
done
cd $HOME/lazar-gui &&
unicorn -p 8090 -E production
cd $HOME/lazar-public-data
if [ ! -d "$HOME/lazar-validation-reports" ]
then
  ruby $HOME/lazar-public-data/create_test_prediction_models.rb
fi
