# ex_Rs2

## Description

### What is it?

This programm works like an Rss agragator but support html pages from websites. So when a source (rss or html) is updated, it will be notified in a personalized interface, which is a html page giving you the links of your sources.

The rss files will be stored locally after getting converted to html and the html pages of websites provided won't be downloaded for usage but will be refered in your html interface.

You will be able to see if the content of each source has changed since the the last update. 

## How it works

Basically, the programm will download the source and compare to the previous one to see if it has changed, and will notify you in a html file (your interface for the programm).

## Why?

If you want to control what you see on the internet, not based on an algorythm, and have a full control on the interface since it's just an html file with some css, which is easily customizable.

## Configuration

### Rss sources

Just put the **rss links** in _new-rss/code_/sources.txt 

### Html sources 

Put the **html** links in _new-rss/code_/sources_pages.txt  

### Update


       $ bash new-rss/init.sh

Remember to do this each time you want to see if someone has posted in the links provided. 

## Usage

Open new-rss/welcome/welcome.html with your favorite web browser and you will see all the sources provided and updated.

## Support

It is a bunch of shell scripts, so you can run the program everywhere there is a shell (sh, bash).

