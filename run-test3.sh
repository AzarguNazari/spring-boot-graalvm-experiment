#!/usr/bin/env bash

while :
do
  curl -X POST -H "Content-Type: application/json" -d '{"id" : 3, "title" : "Somethign title 3","description": "this course is about something 1","published" : true}' http://localhost:8081/v1/api/tutorials
	echo "before delete : " >> output3.txt
  curl -X GET http://localhost:8081/v1/api/tutorials >> output3.txt
	echo -e "\n------------\n"

	echo -e "\nGet Tutorial: " >> output3.txt
	curl -X GET http://localhost:8081/v1/api/tutorials >> output3.txt

	echo -e "\n------------\n"
	echo -e "\nafter delete : " >> output3.txt
	curl -X DELETE http://localhost:8081/v1/api/tutorials
	curl -X GET http://localhost:8081/v1/api/tutorials >> output3.txt
	echo -e "\n------------\n\n\n" >> output3.txt
done
