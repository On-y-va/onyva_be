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
| 200 | `OK` |

Example Value:

```json
{
   
   }
```

</details>

---

### Get a User


---


### Create a User



```http
POST /api/v1/users
```

<details close>
<summary>  Details </summary>
<br>
    
Parameters: <br>
```
CONTENT_TYPE=application/json
```

| Code | Description |
| :--- | :--- |
| 201 | Created |

Example Value:

```json
{
    "data": {
        "id": "3",
        "type": "user",
        "attributes": {
            "first name": "Harry",
            "Last_name": "Potter",
            "phone_number": "123456789",
            "email": "harry@hogwarts.com",
            "password digest": "$2a$12$fluERN41F2GOxWGW08JPmOh7AwL]rdDJo4fXyrLukj5yzGKIG/Kpiv"
            "emergency_contact_name": null,
            "emergency_contact_phone_number": null
        }
    }
}
```

</details>


---


### Edit a User

---


### Delete a User

---


### Get a Trip


---


### Create a Trip

---


### Edit a Trip

---


### Delete a Trip


---




## Status Codes

Onyva returns the following status codes in its API:

| Status Code | Description |
| :--- | :--- |
| 200 | `OK` |
| 201 | `CREATED` |
| 400 | `BAD REQUEST` |
| 404 | `NOT FOUND` |
| 500 | `INTERNAL SERVER ERROR` |
