#!/bin/bash
users=$(cat tiktok/tiktok_all_2k.txt)
for user in $users;do
    echo $user
    f2 tk -M post -c tiktok/tk.yaml  -u $user
done