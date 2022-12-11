#!/bin/bash

# Create 4 users: Rostislav Ignatov, Yevgeny Borisov,
# Albert Sokolovsky and Andrei Yakovlev


# Create Rostislav Ignatov
curl -0 -v -X POST http://localhost:8080/api/v0/users \
	-H "Expect:" \
	-H 'Content-Type: application/json; charset=utf-8' \
	--data-binary @- << EOF
{
	"name": "r.ignatov"
}
EOF

curl -0 -v -X PUT http://localhost:8080/api/v0/users/r.ignatov \
	-H "Expect:" \
	-H 'Content-Type: application/json; charset=utf-8' \
	--data-binary @- << EOF
{
	"contacts": {
		"call": "+7 111-111-1111",
		"email": "r.ignatov@example.com",
		"slack": "r.ignatov",
		"sms": "+7 111-111-1111"
	},
	"full_name": "Rostislav Ignatov",
	"photo_url": null,
	"time_zone": "Europe/Moscow",
	"active": 1
}
EOF

# Create Yevgeny Borisov
curl -0 -v -X POST http://localhost:8080/api/v0/users \
	-H "Expect:" \
	-H 'Content-Type: application/json; charset=utf-8' \
	--data-binary @- << EOF
{
	"name": "y.borisov"
}
EOF

curl -0 -v -X PUT http://localhost:8080/api/v0/users/y.borisov \
	-H "Expect:" \
	-H 'Content-Type: application/json; charset=utf-8' \
	--data-binary @- << EOF
{
	"contacts": {
		"call": "+7 222-222-2222",
		"email": "y.borisov@example.com",
		"slack": "y.borisov",
		"sms": "+7 222-222-2222"
	},
	"full_name": "Yevgeny Borisov",
	"photo_url": null,
	"time_zone": "Europe/Moscow",
	"active": 1
}
EOF

# Create Albert Sokolovsky
curl -0 -v -X POST http://localhost:8080/api/v0/users \
	-H "Expect:" \
	-H 'Content-Type: application/json; charset=utf-8' \
	--data-binary @- << EOF
{
	"name": "a.sokolovsky"
}
EOF

curl -0 -v -X PUT http://localhost:8080/api/v0/users/a.sokolovsky \
	-H "Expect:" \
	-H 'Content-Type: application/json; charset=utf-8' \
	--data-binary @- << EOF
{
	"contacts": {
		"call": "+7 333-333-3333",
		"email": "a.sokolovsky@example.com",
		"slack": "a.sokolovsky",
		"sms": "+7 333-333-3333"
	},
	"full_name": "Albert Sokolovsky",
	"photo_url": null,
	"time_zone": "Europe/Moscow",
	"active": 1
}
EOF

# Create Andrei Yakovlev
curl -0 -v -X POST http://localhost:8080/api/v0/users \
	-H "Expect:" \
	-H 'Content-Type: application/json; charset=utf-8' \
	--data-binary @- << EOF
{
	"name": "a.yakovlev"
}
EOF

curl -0 -v -X PUT http://localhost:8080/api/v0/users/a.yakovlev \
	-H "Expect:" \
	-H 'Content-Type: application/json; charset=utf-8' \
	--data-binary @- << EOF
{
	"contacts": {
		"call": "+7 444-444-4444",
		"email": "a.yakovlev@example.com",
		"slack": "a.yakovlev",
		"sms": "+7 444-444-4444"
	},
	"full_name": "Andrey Yakovlev",
	"photo_url": null,
	"time_zone": "Europe/Moscow",
	"active": 1
}
EOF
