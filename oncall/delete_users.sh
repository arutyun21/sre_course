#!/bin/bash

# Delete all users
curl -X DELETE http://localhost:8080/api/v0/users/r.ignatov
curl -X DELETE http://localhost:8080/api/v0/users/y.borisov
curl -X DELETE http://localhost:8080/api/v0/users/a.sokolovsky
curl -X DELETE http://localhost:8080/api/v0/users/a.yakovlev