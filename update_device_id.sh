#!/bin/bash

# Get the first line and extract device_id and cookie
first_line=$(python docs/snippets/tiktok/device-id.py | head -n 1)
device_id=$(echo "$first_line" | grep -o 'device_id: [0-9]*' | cut -d' ' -f2)
tt_chain_token=$(echo "$first_line" | grep -o 'tt_chain_token=[^[:space:]]*' | cut -d'=' -f2)

# Update device_id in conf.yaml
sed -i '' "/tiktok:/,/^[^ ]/ s/id: \"[0-9]*\"/id: \"$device_id\"/" f2/conf/conf.yaml

# Update tt_chain_token in tk.yaml
awk -v token="$tt_chain_token" '{gsub(/tt_chain_token=[^;]*/, "tt_chain_token=" token)}1' tiktok/tk.yaml > tiktok/tk.yaml.tmp
mv tiktok/tk.yaml.tmp tiktok/tk.yaml

echo "Updated configurations:"
echo "Device ID: $device_id"
echo "Updated tt_chain_token to: $tt_chain_token"