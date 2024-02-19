#!/bin/bash

# Array to store city populations
declare -a city_pops

# Get city population data from database/API and store in array
# Example data only:
city_pops=(
"New York:8500000"  
"Los Angeles:4000000"
"Chicago:2700000"
"Houston:2300000"
"Philadelphia:1500000"
"Phoenix:1500000"
"San Antonio:1500000" 
"San Diego:1400000"
"Dallas:1300000"
"San Jose:1000000"
"Jacksonville:900000" 
"Indianapolis:850000"
"Austin:850000"
"San Francisco:830000"  
"Columbus:830000"
"Fort Worth:810000"
"Charlotte:790000"
"Detroit:730000"
"El Paso:680000"
"Memphis:650000"
"Seattle:650000"
)

# Sort array by population number in descending order
city_pops=($(for city in "${city_pops[@]}"; do echo $city; done | sort -t: -k2 -nr))

# Print top 20 most populated cities
for ((i=0;i<20;i++)); do
  city=${city_pops[$i]%:*} # Remove population number
  pop=${city_pops[$i]#*:} # Get only population number
  echo "#$((i+1)): $city - $pop" 
done

#written in Claude