[![Build Status](https://travis-ci.com/leonardok/backend-code-challenge.svg?token=8XAKKKyajnLR8cwYPUiC&branch=master)](https://travis-ci.com/leonardok/backend-code-challenge)

Project Docs at: [Project Docs](http://leok.me/backend-code-challenge)

The public transport authority of Snowdonia town has mandated that all transport modes in the town be equipped with GPS emitters, radiating a vehicle's position every 20 seconds. The mayor has come to you to devise a solution for collecting this information for appropriate use by the city council to make intelligent future decisions about their public transport policy.

You are tasked with constructing an API endpoint to collect all GPS emissions from the city's fleet of:

* buses
* taxis
* trams
* trains

Every emission from the new devices will always contain the following pieces of data:

* unique identifier for the emitting vehicle
* vehicle type
* position latitude
* position longitude
* timestamp of recorded position
* current heading
    * Number between 0 and 359: 0 is true North. 180 is true South. 90 is true East. 270 is true West


### Additional Business Requirements

* If a vehicle has exited the "city boundaries", disregard any emissions from that vehicle.
    * City Boundary is currently assumed to be a 50km radius around an the town centre, an arbitrary point you select.
    * Just ensure your town centre is not 0 lat, 0 lng

* All position data received must be stored somewhere for future analysis and consumption by the city council.

### Testing Requirements

Snowdonia town has ~1000 vehicles in active operation at any given moment. Each vehicle could theoretically emit their position at the exact same moment. The solution must demonstrate evidence of 1000 concurrent emissions (at maximum) being handled by your developed API without an error.

* clearly-readable performance benchmarking
* a video screen capture of your 1000 vehicle clients being received
* your creative choice

### Technical Assumptions

* The city will implement whatever data transport mechanism & protocol you recommend on the GPS emitters, as long as:
    * The data payload contains the GPS data elements listed above
    * The data payloads are all directed to the API endpoint you construct
* You are not limited in the API endpoint architecture, design, protocol, system or mechanism you wish to implement.
* Feel free to pre-seed your ecosystem with arbitrary vehicles and unique identifiers. API endpoints for registering vehicles in your ecosystem are not part of the challenge.
* Unique identifiers conform to the UUID identifier standard (https://en.wikipedia.org/wiki/Universally_unique_identifier)

