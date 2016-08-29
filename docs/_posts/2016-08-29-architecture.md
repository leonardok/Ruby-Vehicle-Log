---
layout: page
title: "Architecture"
category: ref
date: 2016-08-29 18:39:07
---

Used gems:

- FactoryGirl for test factories
- RSpec for TDD
- Active Record as ORM
- Travis as CI
- Postgres as database
- Pry for interactive debugging
- Sinatra as the framework

The app was built using Sinatra for the simplicity and lightweightness. The chosen ORM was Active Record, this decision was only based on familiarity with the library.

The database structure is represented by the diagram bellow:

<img src="/backend-code-challenge/img/database.png" width="80%"/>


It allow the application to be more flexible as new cities are enabled. To
allow a more flexible city geometry (other than circular) the PostGIS extension
can be enabled. For now the distance between the vehicle position from the
center of the city is being calculated by the Haversine formula.
