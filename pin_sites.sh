#!/bin/bash

# Function to ping a host and extract the average time
get_ping_time() {
    host=$1
    ping_result=$(ping -c 3 $host | tail -1)
    echo $ping_result | awk -F/ '{print $5}'
}

# Array of websites to ping
websites=("google.com" "facebook.com" "twitter.com" "tiktok.com" "instagram.com")

# Associative array to store ping times
declare -A ping_times

# Ping each website and store the average time in the associative array
for site in "${websites[@]}"; do
    ping_time=$(get_ping_time $site)
    ping_times[$ping_time]=$site
done

# Sort the ping times in ascending order
sorted_times=($(for time in "${!ping_times[@]}"; do echo $time; done | sort -n))

# Output the sorted list of ping times with their corresponding URLs
for time in "${sorted_times[@]}"; do
    echo "Ping time for ${ping_times[$time]}: $time ms"
done

#written with Perplexity