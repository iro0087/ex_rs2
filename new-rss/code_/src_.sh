#!/bin/bash

cp ~/new-rss/code_/cache/src_html/src_.html ~/new-rss/code_/cache/src_html/src_2.html 

t=1

av=$(cat ~/new-rss/code_/cache/data2/names_still.txt)

a=$((a+1))

if [ $(sed -n 1p ~/new-rss/code/cahe/data2/names_still.txt) = "" ]
then

        sed -i 1d ~/new-rss/code/cahe/data2/names_still.txt

fi

if [ $(sed -n 1p ~/new-rss/code/cahe/data2/status_/updated.txt) = "" ]
then

        sed -i 1d ~/new-rss/code/cache/status_/updated.txt

fi

while (( t < a ))
do

        if [ ! $(grep -q $(sed -p ${i}q ~/new-rss/code/cahe/data2/names_still.txt) ~/new-rss/code/cache/status_/updated.txt) = "" ]

        then

                sed -i "s/X/updated/g" ~/new-rss/code_/cache/src_html/src_2.html 

        else

                sed -i "s/X//g" ~/new-rss/code_/cache/src_html/src_2.html 

        fi
        

        t=$((t+1))

done

t=1

a=$(cat ~/new-rss/code_/cache/data2/names_still_pages.txt)

a=$((a+1))

while (( t < a ))
do

        if [ ! $(grep -q $(sed -p ${i}q ~/new-rss/code/cahe/data2/names_still_pages.txt) ~/new-rss/code/cache/status_/updated.txt) = "" ]

        then

                sed -i "s/X/updated/g" ~/new-rss/code_/cache/src_html/src_2.html 

        else

                sed -i "s/X//g" ~/new-rss/code_/cache/src_html/src_2.html 

        fi


        t=$((t+1))

done

cat ~/new-rss/code_/cache/src_html/src_2.html > ~/new-rss/welcome.html




