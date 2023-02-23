# Onyva Backend Service
API for Onyva Trip Planning Application

## RESTful Endpoints

### Get all Users

```http
GET /api/v1/users
```

<details close>
<summary>  Details </summary>
<br>
    
Parameters: <br>
```
No Parameters
```

| Code | Description |
| :--- | :--- |
| 200 | Successful Response |

Example Value:

```json
{
    "total_replies": 25,
    "attendance_start_time": "2022-11-30T16:00:59.999+00:00",
    "data": [
        {
            "first_name": "Meg",
            "last_name": "Stang",
            "full_name": "Meg Stang",
            "email": "mstang@turing.edu",
            "reply_timestamp": "2022-11-30T08:46:24.992-07:00",
            "status": "present"
        },
        {
            "first_name": "Erin",
            "last_name": "Pintozzi",
            "full_name": "Erin Pintozzi",
            "email": "epintozzi@turing.edu",
            "reply_timestamp": "2022-11-30T08:46:29.808-07:00",
            "status": "present"
        },
        {
            "first_name": "Brian",
            "last_name": "Zanti",
            "email": "brian@turing.edu",
            "reply_timestamp": "2022-11-30T08:46:36.756-07:00",
            "status": "present"
        },
        {
            "first_name": "Mike",
            "last_name": "Dao ",
            "email": "mike@turing.edu",
            "reply_timestamp": "2022-11-30T09:09:58.175-07:00",
            "status": "tardy"
        },
        {...},
        {...},
        ...
        ...
       ]
   }
```

</details>

### Get a User

### Create a User

### Edit a User

### Delete a User

### Get a Trip

### Create a Trip

### Edit a Trip

### Delete a Trip



## Status Codes

Onyva returns the following status codes in its API:

| Status Code | Description |
| :--- | :--- |
| 200 | `OK` |
| 201 | `CREATED` |
| 400 | `BAD REQUEST` |
| 404 | `NOT FOUND` |
| 500 | `INTERNAL SERVER ERROR` |
