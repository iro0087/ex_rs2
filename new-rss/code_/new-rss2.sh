#!/bin/bash

####CONF VARIABLE###

check_certificate="no"

####################

t=1

a=$(cat ~/new-rss/code_/sources_pages.txt | wc -l)

a=$((a+1))

echo "" > ~/new-rss/code_/cache/data2/names_still_pages.txt

while (( t < a ))
do

        file_to_download=$(sed -n ${t}p ~/new-rss/code_/sources_pages.txt)

        file_downloaded=$(echo $file_to_download | cut -d "/" -f 3)

        file_downloaded="${file_downloaded}.html"

        echo /home/${USER}/new-rss/html_lst/$file_downloaded >> ~/new-rss/code_/cache/data2/names_still_pages.txt

        if [ "$check_certificate" = "yes" ]
        then

                wget -O ~/new-rss/html_lst/$file_downloaded $file_to_download

        else

                wget --no-check-certificate -O ~/new-rss/html_lst/$file_downloaded $file_to_download

        fi

        file_downloaded_data=${file_downloaded//.html}

        file_downloaded_data="${file_downloaded_data}.txt"

        if [ ! -f ~/new-rss/code_/cache/data/html_/$file_downloaded_data ]
        then
                
                touch ~/new-rss/code_/cache/data/html_/$file_downloaded_data

                echo $(cat ~/new-rss/html_lst/$file_downloaded | wc -l) > ~/new-rss/code_/cache/data/html_/$file_downloaded_data

        fi

        response=$(cat ~/new-rss/html_lst/$file_downloaded | wc -l)

        ancient_l=$(cat ~/new-rss/code_/cache/data/html_/$file_downloaded_data)

        if [ "$ancient_l" -ne "$response" ]
        then

                echo $file_downloaded >> ~/new-rss/code_/cache/status_/updated.txt

        fi

        echo $(cat ~/new-rss/html_lst/$file_downloaded | wc -l) > ~/new-rss/code_/cache/data/html_/$file_downloaded_data

        t=$((t+1))

done

ls ~/new-rss/html_lst/*html | xargs -I X echo X > ~/new-rss/code_/cache/data2/names_to_compare_pages.txt

a=$(cat ~/new-rss/code_/cache/data2/names_to_compare_pages.txt | wc -l)

a=$((a+1))

t=1

while [ "$t" -ne "$a" ]
do

        file=$(sed -n ${t}p ~/new-rss/code_/cache/data2/names_to_compare_pages.txt)

        if grep -q $file ~/new-rss/code_/cache/data2/names_still_pages.txt; then echo "yes" > /dev/null ; else rm $file; fi

        t=$((t+1))

done



