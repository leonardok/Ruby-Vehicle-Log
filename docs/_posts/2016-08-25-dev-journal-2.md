---
layout: page
title: "Dev Journal #2"
category: post
date: 2016-08-25 19:12:20
---

# Load Requirements

Today was the day of testing the load requirement. I know Sinatra would be very
good in terms of performance but I still have to guarantee that in a way that
proof is easy to get. First step was doing a bit of research about current
tools for load balancing the app. I have used JMeter beforehand, so this is
kind of a safe ground for me.

## The App

Ok, before actually TDDing my API I want to prove that I am not starting from
an unsustainable infrastructure choice. For that I built a very trivial Sinatra
app that just responds to a POST where it will go the actual position logger 
"/vehicles/log" (`/vehicles` is mapped in the `config.ru`):

	{% highlight ruby %}

	require 'sinatra/base'
	require 'json'

	# This class exposes the supported vehicle APIs
	class VehicleController < Sinatra::Base
	    # This logs a vehicle position
	    #
	    # params:
	    #   uuid        the vehicle uuid
	    #   type        vehicle type
	    #   lat         current latitude
	    #   lgt         current longitude
	    #   timestamp   time when recorded position
	    #   heading     Number between 0 and 359: 0 is true North. 180 is true
	    #               South. 90 is true East. 270 is true West
	    #
	    post '/log' do
		{'message': 'ok'}.to_json
	    end
	end

	{% endhighlight %}

The app was deployed into Heroku and I was ready to the tests.


## Tools I have used to load test

Tools that caught my attention (other than JMeter, that was in ALL load testing apps list):

- WRK - https://github.com/wg/wrk - they say it is a benchmarking tool. I
compiled it, made a few tries and I couldn't find a way for generation
concurrent traffic. It has an option that simulates a number of open
connections, but it doesn't make it clear if they are actually generating
traffic - it might just establish the connection and wait.

- SoapUI - a desktop client that is EXTREMELY slow and very little intuitive.
Dropped in the first 15 minutes.

- Vegeta - written in Go. Too much trouble for something that I can get with
JMeter.

So after a few clicks I was using JMeter to load test this small API. Before
jumping into the result I feel that I have to clarify why I looked into
alternatives for a tool that I knew would do the job: 1. Because a lot can
change in no time, so I just went to check if there were new tools that are
better; 2. I dislike JMeter UI.

I installed Ubuntu JMeter (2.8.x), created the test case, `scripts/load.jmx`,
and was up and running. I configured to run 1000 threads with 20 seconds of
rampup for 2 minutes. What I got was a very bad result: around 5 seconds
average response. That to me was unacceptable.

It also gave me very bad graphs, so installing JMeter 3.0 adds additional
charts. As a side effect it started showing up very high rates of errors
(around 5% calls). To summarize:

- JMeter 2.8 was showing confusing charts (response over time). I wanted a
  clear chart to report clearly what was going on
- 3.0 was having issues with false errors (timeouts). I knew for a fact that
  the load was low at the time of failures, as this was by the ramping down
  stop. My guess: problems killing threads.

By that time I also looked at `loader.io` that has a nice plugin for heroku
with exactly what I needed: concurrent users per second. I configured for 1000
concurrent users for 1 minute.
That is the first run:

![](/backend-code-challenge/img/loader_io_first_run.png)

By far the most concise chart, but very frustrating result. My JMeter wasn't
that wrong. So I had 2 problems at hand: the performance was horrific and the
errors. Next logic decision: change the application server.

Ok, in the past I have tested a lot of application servers and in my findings
Unicorn was very good and I am also familiar with. Conclusion let's move to
Unicorn. The next figure show the results:

![](/backend-code-challenge/img/loader_io_run_unicorn.png)

Much better! Now this will serve as our baseline and make sure we are not
starting with an environment that makes it impossible to fill the requisites.
Next is adding a database and see how bad this gets.
