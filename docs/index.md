---
layout: default
title: "Snowdonia Tracker Documentation"
---

### Get Started

#### To Deploy

Deployment is done through Heroku. The requirements to deploy this project are:

- Install heroku-toolbelt and run `heroku login` to log into your heroku account
- git and vim (-:
- clone the repo: https://github.com/leonardok/backend-code-challenge
- enter the repo directory
- create the heroku app with `heroku create`
- run `git push heroku master` to deploy the code to heroku
- provision the database with `heroku addons:create heroku-postgresql:hobby-dev`
- run the database migrations with `heroku run rake db:migrate`
- load the default data with `heroku run rake db:fixtures:load`

Now, there is no automatic way for getting the saved vehicles, but you can create a data clip on heroku with the following statement:

    select v.id, vt.id as type_id, vt.name as type_name, ec.name as city_name, ec.id as city_id from vehicles as v
      left join vehicle_types as vt on v.vehicle_type_id = vt.id
      left join enabled_cities as ec on v.enabled_city_id = ec.id;

Or you can check in the fixtures, I fixed the ID of the 4 sample vehicles there.


#### API for Logging Position

The following APIs are exposed to the world:

----

    GET '/'

    Redirects to the docs site.

----

    POST '/vehicles/log'

    Save a new vehicle position. There are a few requirements that the data
    must conform in order to be valid. Those are:
    - latitude and longitude must be inside a 50km radius from the city center
    - vehicle associated must exist
    - associated vehicle must have the same type as the type in the json

    The body description is:
    - vehicle_id:       [uuid]     id (in corformation with uuid standart) of
                                   the associated vehicle
    - vehicle_type_id:  [integer]  type id of the associated vehicle
    - lat:              [float]    latitude on the recorded position
    - lgt:              [float]    longitude on the recorded position
    - recorded_at:      [datetime] datetime when the position was recorded
    - heading:          [integer]  the direction where the vehicle was going in
                                   the range of 0..359

    Sample (change your server accordingly):
        {% highlight bash %}
        curl -X POST -H "Accept: application/json" -H "Content-Type:
          application/json" -H "Cache-Control: no-cache" -H "Postman-Token:
          227855aa-6f12-23f1-c4d0-ba76e4651de9" -d '{
            "vehicle_id": "3e6d1bcb-30a9-47ad-aa61-37c643c46b5f",
            "vehicle_type_id": "1",
            "lat": "-30.0158953",
            "lgt": "-51.1908712",
            "recorded_at": "2016-08-29T10:14:02.254-03:00",
            "heading": "67"
        }' "http://<YOUR SERVER URL>/vehicles/log"
        {% endhighlight %}
