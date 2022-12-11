#!/bin/bash

# Update team 1
curl -0 -v -X PUT http://localhost:8080/api/v0/teams/ignatov_team \
	-H "Expect:" \
	-H 'Content-Type: application/json; charset=utf-8' \
	--data-binary @- << EOF
{
    "scheduling_timezone": "Europe/Moscow"
}
EOF

# Update team 1
curl -0 -v -X PUT http://localhost:8080/api/v0/teams/sokolovsky_team \
	-H "Expect:" \
	-H 'Content-Type: application/json; charset=utf-8' \
	--data-binary @- << EOF
{
    "scheduling_timezone": "Europe/Moscow"
}
EOF