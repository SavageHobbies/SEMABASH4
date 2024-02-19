#!/bin/bash

# Get some random facts about the Universe
# Using a reputable external API to avoid generating potentially wrong facts
FACTS_URL="https://api.factbrowser.com/fact?limit=1"
FACTS_JSON=$(curl -s "$FACTS_URL")

# Extract the text of the first fact
FACT=$(echo "$FACTS_JSON" | jq -r '.facts[0]')

# Check if the fact is actually interesting
if [[ $FACT =~ (black hole|galaxy|space|alien|dinosaur|ocean|planet) ]]; then
  # Display the fact in a cool way
  echo "Did you know? "
  echo "----------------"
  echo "$FACT"
  echo "----------------"
else
  echo "Hmm, that fact wasn't interesting enough. Trying again..."
  # Recursively call the script to try for another fact
  sh "$0"
fi

#Written in Gemini