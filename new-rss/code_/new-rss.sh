#!/bin/bash

####CONF VARIABLE###

check_certificate="yes"

####################

echo "" > ~/new-rss/code_/cache/status_/updated.txt

echo "" > ~/new-rss/code_/cache/status_/updated2.txt

echo "" > ~/new-rss/code_/cache/data2/names_still.txt

a=$(cat ~/new-rss/code_/sources.txt | wc -l)

a=$((a+1))

t=1

while [ "$t" -ne "$a" ]
do

        file_to_download=$(sed -n ${t}p ~/new-rss/code_/sources.txt)

        file_downloaded=$(echo $file_to_download | cut -d "/" -f 3)

        file_downloaded="${file_downloaded}.xml"

        echo /home/${USER}/new-rss/$file_downloaded >> ~/new-rss/code_/cache/data2/names_still.txt

        if [ "$check_certificate" = "yes" ]
        then

                wget -O ~/new-rss/code_/cache/$file_downloaded $file_to_download

        else

                wget --no-check-certificate -O ~/new-rss/code_/cache/$file_downloaded $file_to_download

        fi

        cp ~/new-rss/code_/cache/$file_downloaded ~/new-rss/code_/cache/cons/$file_downloaded

        file_downloaded_data=${file_downloaded//.xml}

        file_without=$file_downloaded_data

        if [ -d ~/new-rss/code_/cache/img/$file_without ]
        then

                echo "ok" > /dev/null

        else

                mkdir ~/new-rss/code_/cache/img/$file_without

        fi

        file_downloaded_data="${file_downloaded_data}.txt"

        if [ ! -f ~/new-rss/code_/cache/data/$file_downloaded_data ]
        then

                touch ~/new-rss/code_/cache/data/$file_downloaded_data

                echo $(cat ~/new-rss/code_/cache/data/$file_downloaded | wc -l) >  ~/new-rss/code_/cache/data/$file_downloaded_data

                file_downloaded2="${file_downloaded}2"

                touch ~/new-rss/code_/cache/data/$file_downloaded_data2

                echo $(grep "pubDate" ~/new-rss/code_/cache/data/$file_downloaded | wc -l) >  ~/new-rss/code_/cache/data/$file_downloaded_data2

                echo $file_downloaded >> ~/new-rss/code_/cache/status_/updated.txt

        fi

        response=$(cat ~/new-rss/code_/cache/$file_downloaded | wc -l)

        response2=$(grep "pubDate" ~/new-rss/code_/cache/$file_downloaded | wc -l)

        ancient_l=$(cat ~/new-rss/code_/cache/data/$file_downloaded_data)

        ancient_l2=$(grep "pubDate" ~/new-rss/code_/cache/data/$file_downloaded_data2)

        if [ "$ancient_l" -ne "$response" ]
        then

                echo $file_downloaded >> ~/new-rss/code_/cache/status_/updated.txt

                diff_=$((response2-ancient_l2))

                echo $diff_ > ~/new-rss/code_/cache/status_/updated2.txt

        fi

        xsltproc ~/new-rss/code_/cache/sour.xsl ~/new-rss/code_/cache/$file_downloaded > ~/new-rss/code_/cache/out.txt

        bash ~/new-rss/code_/cache/replace2.sh

        touch ~/new-rss/code_/cache/out2.txt

        if grep -q ".webp" ~/new-rss/code_/cache/out.txt; then grep -v ".webp" ~/new-rss/code_/cache/out.txt > ~/new-rss/code_/cache/out2.txt && mv ~/new-rss/code_/cache/out2.txt ~/new-rss/code_/cache/out.txt; fi

        iconv -c -t ascii ~/new-rss/code_/cache/out.txt -o ~/new-rss/code_/cache/out2.txt

        mv ~/new-rss/code_/cache/out2.txt ~/new-rss/code_/cache/out.txt

        pandoc ~/new-rss/code_/cache/out.txt -o ~/new-rss/code_/cache/out.html 

        echo $(grep http ~/new-rss/code_/cache/out.html | sed 's/http/\nhttp/g' | grep -E '.jpg|.svg|.png|.jpeg' | cut -d '"' -f 1 | cut -d "?" -f 1) > ~/new-rss/code_/cache/temp/temp.txt

        sed -i "s/ /\n/g" ~/new-rss/code_/cache/temp/temp.txt

        END=$(cat ~/new-rss/code_/cache/temp/temp.txt | wc -l)

        MUCH=$(ls ~/new-rss/code_/cache/img/$file_without | wc -l)

        while (( MUCH < END ))
        do

                url=$(sed -n ${MUCH}p ~/new-rss/code_/cache/temp/temp.txt)

                echo "downloading $url"

                sleep 0.1

                wget -O ~/new-rss/code_/cache/img/$file_without/$MUCH.jpg $url

                MUCH=$((MUCH+1))

        done

        for i in $(seq 1 $END)
        do

                frm=$(sed -n ${i}p ~/new-rss/code_/cache/temp/temp.txt)

                file=$i.jpg

                sed -i "s|${frm}|file:///home/${USER}/new-rss/code_/cache/img/$file_without/${file}|g" ~/new-rss/code_/cache/out.html

        done

        cp ~/new-rss/code_/cache/out.html ~/new-rss/${file_without}.html

        echo $(cat ~/new-rss/code_/cache/$file_downloaded | wc -l) > ~/new-rss/code_/cache/data/$file_downloaded_data

        echo $(grep "pubDate" ~/new-rss/code_/cache/$file_downloaded | wc -l) > ~/new-rss/code_/cache/data/$file_downloaded_data2

        t=$((t+1))

done

ls ~/new-rss/*html | xargs -I X echo X > ~/new-rss/code_/cache/data2/names_to_compare.txt

sed -i "s/.html/.xml/g" ~/new-rss/code_/cache/data2/names_to_compare.txt

a=$(cat ~/new-rss/code_/cache/data2/names_to_compare.txt | wc -l)

a=$((a+1))

t=1

while [ "$t" -ne "$a" ]
do

        file=$(sed -n ${t}p ~/new-rss/code_/cache/data2/names_to_compare.txt)

        file2=$(echo $file | sed "s/.xml/.html/g")

        if grep -q $file ~/new-rss/code_/cache/data2/names_still.txt; then echo "yes" > /dev/null ; else rm $file2; fi

        t=$((t+1))

done



