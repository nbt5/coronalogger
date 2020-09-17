#!/bin/bash

# This script gets the day's COVID-19 stats for the UK using the service provided by trackercli at https://github.com/trackercli/covid19-tracker-cli, then adds it to the coronastats.csv log.
# The final command builds the latest version of the coronagraph.png using gnuplot and coronagraph.gnuplot config file.
# You will need to edit the paths to coronastats.csv and coronagraph.gnuplot to point them towards the local files on your machine, e.g. /home/username/coronalogger/coronastats.csv.
# You will need to put this script somewhere it can be accessed by root, and then edit your crontab file to execute it automatically once a day. I recommend in the evening, but remember that the computer needs to be on for it to run.
# Dependencies: curl, gnuplot

date=$(date +"%Y-%m-%d")
cases=$(curl -L covid19.trackercli.com/basic/UK 2>&1 | grep "Today Cases" | sed 's/[^0-9]*//g')
deaths=$(curl -L covid19.trackercli.com/basic/UK 2>&1 | grep "Today Deaths" | sed 's/[^0-9]*//g')
echo "$date,$cases,$deaths" >> coronastats.csv
gnuplot -p coronagraph.gnuplot
