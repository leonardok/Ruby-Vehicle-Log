---
layout: page
title: "Dev Journal #1"
category: post
date: 2016-08-24 17:21:48
---

# First Day Stuff

This being the first log entry I just want to talk about some design decisions
I've made so far, beginning with language and framework of choice, together
with some sketched ideas for the database.

- Ruby and Sinatra - Two main reasons for that: 1. Ruby along with Sinatra were
  in the job description; 2. I was looking for something that wouldn't take to
  long to work with. Choosing Sinatra will add an extra fun step, learning a
  new thing. All I have done with Sinatra so far is a sample app around 7 years
  ago.

- Database - I plan on use Postgres. It is my prefered database, the one I'm
  more familiar with. It also has the benefit of having PostGIS, a spatial
  extension for Postgres. This also goes along one of the requirements:
  ignoring log entries that have a position outside the designed area. I still
  have to test the benefits of using it though.

- Deployment - This project will be deployed on Heroku. There is a lot of
  benefits using Heroku, plugins are one of the key benefits.

Some other requirements include hadling 1000 concurrent connections, this is
our worst case scenario. I will have to run load tests to see how the system
behaves from with the basic infrastructure and increase performance as needed
to ensure our worst case. Having said that, 1000 concurrent connections are not
something from outerspace, having picked Sinatra is already a step in the
performance direction.


Now as far as the database goes, this is a very simple project but I want to
ensure extensibility while keeping it clean. Well, this is the first draft, it
can evolve in the next days. That is what I am thinking right now:

<img src="/backend-code-challenge/img/database_first_draft.jpg" width="80%"/>
