
<div id="header" align="center">
<img src="src/assets/logo_transparent.png" alt="onyva logo" width="200" height="auto" />
</div>

# <p align="center"> Onyva Backend Service </p>

This application consumes external APIs to fetch information about any travel destination, whether it's a bustling city, a serene countryside, or a quaint village. With this data, we create personalized trip plans that cater to our users' unique interests and preferences. Onyva backend provides seamless integration with our frontend application, allowing users to effortlessly organize their trips with ease. By consuming our API, the frontend communicates with our application and unlocks a wealth of local recommendations for restaurants, attractions, and hidden gems.

## About Onyva

Onyva is an innovative travel application that aims to simplify the process of planning a trip and enhance the overall travel experience for users. With Onyva, users can easily create personalized itineraries for their trips, complete with local recommendations for restaurants and tourist attractions. Users can also invite their friends to join them on their trips and manage their trip details together.

At its core, Onyva is committed to providing an exceptional travel experience for users, and we believe that our application can be a valuable tool for anyone looking to plan their next adventure.


## RESTful Endpoints

<details close>


### Get a User


```http
GET /api/v1/users/:id
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
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "first_name": "Kaylah",
            "last_name": "Rose",
            "phone_number": null,
            "email": "kaylahrosem@gmail.com",
            "emergency_contact_name": null,
            "emergency_contact_phone_number": null,
            "google_uid": "12345678901234567890"
        }
    }
}
```

</details>

---

### Search for user


```http
GET /api/v1/users/find
```

<details close>
<summary>  Details </summary>
<br>
    
Parameters: <br>
```
GOOGLE_UID=12345678901234567890
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Example Value:

```json

{
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "first_name": "Kaylah",
            "last_name": "Rose",
            "phone_number": null,
            "email": "kaylahrosem@gmail.com",
            "emergency_contact_name": null,
            "emergency_contact_phone_number": null,
            "google_uid": "12345678901234567890"
        }
    }
}
```

</details>

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
            "last_name": "Potter",
            "phone_number": "123456789",
            "email": "harry@hogwarts.com",
            "emergency_contact_name": null,
            "emergency_contact_phone_number": null
        }
    }
}
```

</details>


---


### Edit a User

```http
PATCH /api/v1/users/:id
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
| 200 | `OK` |

Example Value:

```json
{
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "first name": "bob",
            "Last_name": "Jef",
            "phone_number": "123456789",
            "email": "jef@jef.com",
            "emergency_contact_name": null,
            "emergency_contact_phone_number": null
        }
    }
}
```


</details>


---


### Get a Trip


```http
GET /api/v1/trips/:id
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
    "data": {
        "id": "1",
        "type": "trip",
        "attributes": {
            "name": "Girl's Trip",
            "city": "Denver",
            "country": "United States",
            "postcode": "80020",
            "place_id": "21fqirl123b1278",
            "start_date": "2023-03-14",
            "end_date": "2023-03-17",
            "image_url": "https://live.staticflickr.com/65535/52190921778_23ed1cc279_w.jpg",
            "events": [
                {
                    "id": 236,
                    "trip_id": 21,
                    "event_date": null,
                    "event_time": null,
                    "event_id": "515dc823b891e357c059ae4731ce3ad34040f00102f901af846c1000000000920315546865204465706f74204261722026204772696c6c",
                    "votes": null,
                    "confirmed": false,
                    "created_at": "2023-03-03T04:24:25.625Z",
                    "updated_at": "2023-03-03T04:24:25.625Z",
                    "name": "The Depot Bar & Grill",
                    "address": "East Hearne Avenue, Paris, TX 75460, United States of America",
                    "category": "restaurant"
                },
                {...},
                {...},
                {...},
                {etc},
            ]
        },
        "relationships": {
            "events": {
                "data": [
                    {
                        "id": "236",
                        "type": "event"
                    },
                    {...},
                    {etc},
                ]
            }
        }
    },
    "included": [
        {
            "id": "236",
            "type": "event",
            "attributes": {
                "id": 236,
                "trip_id": 21,
                "event_date": null,
                "event_time": null,
                "event_id": "515dc823b891e357c059ae4731ce3ad34040f00102f901af846c1000000000920315546865204465706f74204261722026204772696c6c",
                "votes": null,
                "confirmed": false,
                "name": "The Depot Bar & Grill",
                "address": "East Hearne Avenue, Paris, TX 75460, United States of America",
                "category": "restaurant"
            },
            "relationships": {
                "trip": {
                    "data": {
                        "id": "21",
                        "type": "trip"
                    }
                }
            }
        },
        {etc},
    ]
}
```


</details>


---


### Create a Trip

```http
POST /api/v1/trips
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
| 201 | `CREATED` |

Example Value:

```json
{
    "data": {
        "id": "1",
        "type": "trip",
        "attributes": {
            "name": "Girl's Trip",
            "city": "Denver",
            "country": "United States",
            "postcode": "80020",
            "place_id": "21fqirl123b1278",
            "start_date": "2023-03-14",
            "end_date": "2023-03-17",
            "image_url": "https://live.staticflickr.com/65535/52190921778_23ed1cc279_w.jpg",
            "events": [
                {
                    "id": 236,
                    "trip_id": 21,
                    "event_date": null,
                    "event_time": null,
                    "event_id": "515dc823b891e357c059ae4731ce3ad34040f00102f901af846c1000000000920315546865204465706f74204261722026204772696c6c",
                    "votes": null,
                    "confirmed": false,
                    "created_at": "2023-03-03T04:24:25.625Z",
                    "updated_at": "2023-03-03T04:24:25.625Z",
                    "name": "The Depot Bar & Grill",
                    "address": "East Hearne Avenue, Paris, TX 75460, United States of America",
                    "category": "restaurant"
                },
                {...},
                {...},
                {...},
                {etc},
            ]
        },
        "relationships": {
            "events": {
                "data": [
                    {
                        "id": "236",
                        "type": "event"
                    },
                    {...},
                    {etc},
                ]
            }
        }
    },
    "included": [
        {
            "id": "236",
            "type": "event",
            "attributes": {
                "id": 236,
                "trip_id": 21,
                "event_date": null,
                "event_time": null,
                "event_id": "515dc823b891e357c059ae4731ce3ad34040f00102f901af846c1000000000920315546865204465706f74204261722026204772696c6c",
                "votes": null,
                "confirmed": false,
                "name": "The Depot Bar & Grill",
                "address": "East Hearne Avenue, Paris, TX 75460, United States of America",
                "category": "restaurant"
            },
            "relationships": {
                "trip": {
                    "data": {
                        "id": "21",
                        "type": "trip"
                    }
                }
            }
        },
        {etc},
    ]
}
```


</details>


---


### Edit a Trip

```http
PATCH /api/v1/trips
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
| 200 | `OK` |

Example Value:

```json
{
    "data": {
        "id": "1",
        "type": "trip",
        "attributes": {
            "name": "Girl's Trip",
            "city": "Denver",
            "country": "United States",
            "postcode": "80020",
            "place_id": "21fqirl123b1278",
            "start_date": "2023-03-14",
            "end_date": "2023-03-17",
            "image_url": "https://live.staticflickr.com/65535/52190921778_23ed1cc279_w.jpg",
            "events": [
                {
                    "id": 236,
                    "trip_id": 21,
                    "event_date": null,
                    "event_time": null,
                    "event_id": "515dc823b891e357c059ae4731ce3ad34040f00102f901af846c1000000000920315546865204465706f74204261722026204772696c6c",
                    "votes": null,
                    "confirmed": false,
                    "created_at": "2023-03-03T04:24:25.625Z",
                    "updated_at": "2023-03-03T04:24:25.625Z",
                    "name": "The Depot Bar & Grill",
                    "address": "East Hearne Avenue, Paris, TX 75460, United States of America",
                    "category": "restaurant"
                },
                {...},
                {...},
                {...},
                {etc},
            ]
        },
        "relationships": {
            "events": {
                "data": [
                    {
                        "id": "236",
                        "type": "event"
                    },
                    {...},
                    {etc},
                ]
            }
        }
    },
    "included": [
        {
            "id": "236",
            "type": "event",
            "attributes": {
                "id": 236,
                "trip_id": 21,
                "event_date": null,
                "event_time": null,
                "event_id": "515dc823b891e357c059ae4731ce3ad34040f00102f901af846c1000000000920315546865204465706f74204261722026204772696c6c",
                "votes": null,
                "confirmed": false,
                "name": "The Depot Bar & Grill",
                "address": "East Hearne Avenue, Paris, TX 75460, United States of America",
                "category": "restaurant"
            },
            "relationships": {
                "trip": {
                    "data": {
                        "id": "21",
                        "type": "trip"
                    }
                }
            }
        },
        {etc},
    ]
}
```

</details>

---


### Delete a Trip

```http
DELETE /api/v1/trip/:id
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
| 204 | No Content |

Example Value:

```json
""
```

</details>



---



### Get a User's Trips

```http
GET /api/v1/users/:id/trips/find_all?status=status
```

<details close>
<summary>  Details </summary>
<br>
    
Parameters: <br>
```
STATUS=status
```

| Code | Description |
| :--- | :--- |
| 200 | 'OK' |

Example Value:

```json
{
    "data": [
        {
            "id": "9",
            "type": "trip",
            "attributes": {
                "name": "Trippin",
                    "city": "Cabo",
                    "country": "Mexico",
                    "postcode": "00123",
                    "place_id": "518120e5cc1b8441c0594f07b29e5a9120c0f00101f90188a2040000000000c00208",
                    "start_date": "2023-02-28",
                    "end_date": "2023-03-09",
                    "image_url": "https://live.staticflickr.com/65535/5716766064_64559491a3_w.jpg",
                    "events": [
                        {
                            "id": 121,
                            "trip_id": 9,
                            "event_date": null,
                            "event_time": null,
                            "event_id": "51d30736b1098341c0596f03fc1c808e20c0f00102f90139476d250000000092030a41204368c3a163617261",
                            "votes": null,
                            "confirmed": false,
                            "created_at": "2023-03-01T02:55:00.282Z",
                            "updated_at": "2023-03-01T02:55:00.282Z",
                            "name": "A Chácara",
                            "address": "Rua Trapiche, Cabo de Santo Agostinho - PE, 54515-330, Brazil",
                            "category": "restaurant"
                        },
                        {etc}
                    ]
            "relationships": {etc}
            }
        }
    ] 
}
```

</details>



---
### Create Trip Attendee (Trip Invitation)

```http
POST /api/v1/trips/:id/users
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
| 204 | No Content |

Example Value:

```json
""
```

</details>



---
### Get Trip Attendees

```http
GET /api/v1/trips/:id/users
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
| 200 | 'OK' |

Example Value:

```json
{
    "data": [
        {
            "id": "7",
            "type": "user",
            "attributes": {
                "first_name": "Kaylah",
                "last_name": "Rose",
                "phone_number": "123456789",
                "email": "kaylahrosem@gmail.com",
                "emergency_contact_name": null,
                "emergency_contact_phone_number": "720938547",
            }
        },
        {
            "id": "3",
            "type": "user",
            "attributes": {
                "first name": "Harry",
                "last_name": "Potter",
                "phone_number": "123456789",
                "email": "harry@hogwarts.com",
                "emergency_contact_name": null,
                "emergency_contact_phone_number": null
            }
        }
    ]
}
```

</details>



---


### Update Trip Attendee (Accept Trip Invitation)

```http
PATCH /api/v1/users/:id/trips/:id
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
| 204 | No Content |

Example Value:

```json
""
```

</details>


---

### Delete Trip Attendee (Decline Trip Invitation)

```http
DELETE /api/v1/users/:id/trips/:id
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
| 204 | No Content |

Example Value:

```json
""
```

</details>
</details>




## Status Codes

Onyva returns the following status codes in its API:

| Status Code | Description |
| :--- | :--- |
| 200 | `OK` |
| 201 | `CREATED` |
| 400 | `BAD REQUEST` |
| 404 | `NOT FOUND` |
| 500 | `INTERNAL SERVER ERROR` |

## Prerequisites
Running this project requires:
- Rails 5.2.8
- Ruby 2.7.4
- External APIs:
  - This application required external API keys which are stored in a <i>.env</i> file at the top level of the program directory
    - API keys can be requested but must be named as follows:
      - :round_pushpin: GEOAPIFY_KEY - [Geoapify](https://myprojects.geoapify.com/projects)
      - :camera: FLICKR_KEY - [FLICKR](https://www.flickr.com/services/api/misc.api_keys.html)

## Installation

1. Fork and clone this repository
2. `cd` into the root directiory
3. `bundle install`
4. `rails db:{drop,create,migrate,seed}`
5. Run the test suite with `bundle exec rspec`
6. Start the local server by running `rails s`
7. Visit the app on `localhost:5000` in your web browser

Pull down the [Front-end repo](https://github.com/On-y-va/onyva_fe). Set up instructions are in that repository's README.

## Database Schema

![Screen Shot 2023-03-03 at 15 30 07](https://user-images.githubusercontent.com/111713452/222853257-e6106237-b246-4a5e-b9d2-5379cb8cfe51.png)


## Contributors

<i>All participants in this project are graduates from the Turing School of Software & Design.</i> <br> <br>
  
<b>Anhnhi Tran, PT, DPT</b> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GitHub: <a href="https://github.com/anhtran811">@anhtran811</a> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LinkedIn: <a href="https://www.linkedin.com/in/anhtran8/">anhtran8</a> <br>

<b>Kaylah Rose Mitchell</b> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GitHub: <a href="https://github.com/kaylahrose">@kaylahrose</a> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LinkedIn: <a href="https://www.linkedin.com/in/kaylahrose/">kaylahrose</a> <br>

<b>Matisse Mallette</b> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GitHub: <a href="https://github.com/MatisseMallette">@MatisseMallette</a> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LinkedIn: <a href="https://www.linkedin.com/in/matisse-mallette/">matisse-mallette</a> <br>

<b>Braxton Eddings</b> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GitHub: <a href="https://github.com/beddings81">@beddings81</a> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LinkedIn: <a href="https://www.linkedin.com/in/braxton-eddings/">braxton-eddings</a> <br>

<b>Alastair Lloyd</b> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GitHub: <a href="https://github.com/Adrlloyd">@Adrlloyd</a> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LinkedIn: <a href="https://www.linkedin.com/in/adrlloyd/">adrlloyd</a> <br>
