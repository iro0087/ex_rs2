#!/bin/bash

echo "" > ~/new-rss/code_/cache/html_lst/src_.html

t=1

a=$(cat ~/new-rss/code_/cache/data2/names_still.txt)

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

        sed -i 's|X|<h4 style="margin-top:1cm"> <a href="html_lst/Y"> Y </a> (Z) </h4>\nX|g' ~/new-rss/code_/cache/src_html/src_.html        

        x=$(sed -n ${t}p ~/new-rss/code_/cache/status_/updated.txt)

        sed -i "s/Y/${x}/g" ~/new-rss/code_/cache/src_html/src_.html        



        x=$(sed -n ${t}p ~/new-rss/code_/cache/status_/updated2.txt)

        sed -i "s/Z/${x} news/g" ~/new-rss/code_/cache/src_html/src_.html        

        t=$((t+1))

done

t=1

a=$(cat ~/new-rss/code_/cache/data2/names_still_pages.txt)

a=$((a+1))

while (( t < a ))
do



        t=$((t+1))

done

cat ~/new-rss/code_/cache/src_html/src_.html > ~/new-rss/welcome.html




