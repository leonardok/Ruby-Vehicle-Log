---
layout: page
title: "Dev Journal #3"
category: post
date: 2016-08-29 18:38:55
---

# Wrapping up

In the overall this was a really nice project. I have never done something like
this in Sinatra, just a "Hello world!" light years ago.

I think that the next steps for this app are:

- Experiment with other ORM and compare with Active Record. I really liked
  integrating it with Sinatra and I think Active Record is one of the most
  elegant ORMs out there. I knew there would be a performance drop when I start
  to save stuff in the database, and I think a more lightweight choice would
  have been better.
- I wasn't able to dockerize the app. That would have been a better choice as,
  in the end, it would be better to test the app in another cloud environment.
  Heroku dynos are really expensive!
- Missing profile the save method. One of the tests were to just validate the
  log entry but not saving it. For 1000 concurrent users the average response
  was around 600ms. That is not perfect, but that is a universe apart from the
  average of ~3400ms with SIX dynos. Changing ORM or making the save method a
  bit faster is really important. One thing to note is the Postgres plugin from
  Heroku that only let you keep 20 connections.
