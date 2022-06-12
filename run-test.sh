#!/usr/bin/env bash

while :
do
  curl -X POST -H "Content-Type: application/json" -d '{"id" : 1, "title" : "Somethign title 1","description": "this course is about something 1","published" : true}' http://localhost:8081/v1/api/tutorials

	echo "before delete : " >> output1.txt
  curl -X GET http://localhost:8081/v1/api/tutorials >> output1.txt
	echo -e "\n------------\n"

	echo -e "\nGet Tutorial: " >> output1.txt
	curl -X GET http://localhost:8081/v1/api/tutorials/1 >> output1.txt

	echo -e "\n------------\n"
	echo -e "\nafter delete : " >> output1.txt
	curl -X DELETE http://localhost:8081/v1/api/tutorials/1
	curl -X GET http://localhost:8081/v1/api/tutorials/1 >> output1.txt
	echo -e "\n------------\n\n\n" >> output1.txt
done
