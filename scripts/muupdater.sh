#!/bin/bash

# Update MuPDF continuously

while :
do
	pkill -HUP mupdf
	sleep 1
done
