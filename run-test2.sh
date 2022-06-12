#!/usr/bin/env bash

while :
do
  curl -X POST -H "Content-Type: application/json" -d '{"id" : 2, "title" : "Somethign title 2","description": "this course is about something 1","published" : true}' http://localhost:8081/v1/api/tutorials
	echo "before delete : " >> output2.txt
  curl -X GET http://localhost:8081/v1/api/tutorials/2 >> output2.txt
	echo -e "\n------------\n"

	echo -e "\nGet Tutorial: " >> output2.txt
	curl -X GET http://localhost:8081/v1/api/tutorials/2 >> output2.txt

	echo -e "\n------------\n"
	echo -e "\nafter delete : " >> output2.txt
	curl -X DELETE http://localhost:8081/v1/api/tutorials
	curl -X GET http://localhost:8081/v1/api/tutorials >> output2.txt
	echo -e "\n------------\n\n\n" >> output2.txt
done
