#!/bin/bash

# Simple Interest Calculator
# Formula: Simple Interest = (Principal * Rate * Time) / 100

echo "Simple Interest Calculator"

read -r -p "Enter principal amount: " principal
read -r -p "Enter annual interest rate (%): " rate
read -r -p "Enter time period (years): " time

# Validate inputs
for value in "$principal" "$rate" "$time"; do
    if ! [[ "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        echo "Error: Please enter valid non-negative numbers."
        exit 1
    fi
done

# Calculate simple interest
simple_interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" \
    'BEGIN {printf "%.2f", (p * r * t) / 100}')

echo "Simple Interest: $simple_interest"
