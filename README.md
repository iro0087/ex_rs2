# ex_Rs2

## Description

This programm works like an Rss agragator but support html pages. So when a source (rss or html) is updated, it will be notified in a personalized interface, which is a html page giving you the links of your sources.

The rss files will be stored locally and the html pages won't be downloaded but will be refered in your html interface.

You will be able to see if the content of each source has changed since the the last update. 

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



