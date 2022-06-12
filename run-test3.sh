#!/usr/bin/env bash

while :
do
  curl -X POST -H "Content-Type: application/json" -d '{"title" : "Somethign title 3","description": "this course is about something 3","published" : true}' http://localhost:8081/v1/api/tutorials
	echo "before delete : " >> output3.txt
  	curl -X GET http://localhost:8081/v1/api/tutorials >> output3.txt
	curl -X GET http://localhost:8081/v1/api/tutorials
	curl -X DELETE http://localhost:8081/v1/api/tutorials
	echo "after delete : " >> output3.txt
	curl -X GET http://localhost:8081/v1/api/tutorials >> output3.txt
done
