#!/bin/python3

import datetime
import time
import itertools

import requests

def post_events(host, primary_user, secondary_user, unix_start, unix_end):
    requests.post(
        f"{host}/api/v0/events",
        json={
            "user": primary_user["name"],
            "team": team_name,
            "role": "primary",
            "start": unix_start,
            "end": unix_end,
        },
    )
    requests.post(
        f"{host}/api/v0/events",
        json={
            "user": secondary_user["name"],
            "team": team_name,
            "role": "secondary",
            "start": unix_start,
            "end": unix_end,
        },
    )
    


def create_schedule(
    host,
    initial_date, 
    team_name, 
    roster_name, 
    shift_change_hour, 
    days_in_shift,
    sum_days
):


    team_info = requests.get(f"{host}/api/v0/teams/{team_name}").json()
    roster_users = team_info["rosters"][roster_name]["users"]
    users_in_rotation = [user for user in roster_users if user["in_rotation"]]
    initial_dttm = datetime.datetime.strptime(f"{initial_date} {shift_change_hour}", "%Y-%m-%d %H")
    final_dttm = initial_dttm + datetime.timedelta(days=sum_days)

    cur_dttm = initial_dttm
    i = 0
    n = len(users_in_rotation)
    while cur_dttm < final_dttm:
        primary_user = users_in_rotation[i % n]
        secondary_user = users_in_rotation[(i+1) % n]
        cur_dttm_end = cur_dttm + datetime.timedelta(days=days_in_shift)
        unix_start = int(time.mktime(cur_dttm.timetuple()))
        unix_end = int(time.mktime(cur_dttm_end.timetuple()))
        post_events(host, primary_user, secondary_user, unix_start, unix_end)
        cur_dttm = cur_dttm_end
        i += 1

if __name__ == "__main__":
    host = "http://localhost:8080"
    initial_date = "2023-01-01"
    team_name = "ignatov_team"
    roster_name = "On Duty"
    shift_change_hour = 8
    days_in_shift = 3
    sum_days = 60
    create_schedule(
        host,
        initial_date, 
        team_name, 
        roster_name, 
        shift_change_hour, 
        days_in_shift,
        sum_days
    )