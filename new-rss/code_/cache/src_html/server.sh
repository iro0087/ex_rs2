#!/bin/bash

while true 
do { \ 

        echo -ne "HTTP/1.0 200 OK\r\nContent-Length: $(wc -c < src_.html)\r\n\r\n"; \
       
        cat src_.html; } | nc -l -p 8080 ; \

done
