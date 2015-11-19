# Spotifycaster #
Twitter Bot that tweets a random song from followed artist per hour.

Used ruby on rails app here instead of plain ruby,
becuase I'm saving the tweets and determine whether it was mentioned or
unmentioned.


# Stacks #
* Rails 4.1.6
* ruby 2.1.4p265
* Sass
* Rspec3
* Node.js
* Twitter Api
* Spotify Api
* Bower
* Humane JS

### Features: ###
1. It tweets a random song per hour.

![screenshot 2015-09-05 12 57
46](https://cloud.githubusercontent.com/assets/2100728/9704259/0c2171ee-54d2-11e5-97b6-ee35a612f289.png)

2. You can request for a random song from your favorite artist.
![screenshot 2015-09-05 12 55
38](https://cloud.githubusercontent.com/assets/2100728/9704265/218e295a-54d2-11e5-9f5f-945d49271802.png)


### Heroku Scheduler: ###
* It tweets a random song per hour
* Responds to requested mentions every 10 minutes

### Installation ###
- Clone the project:
```
git clone git@github.com:ChunAllen/Spotify-Caster.git
```
- Copy ***secrets.yml.template*** and fill up Twitter and Spotify Credentials:
```
cp config/secrets.yml.template config/secrets.yml
```
- Fill Up Spotify and Twitter Api Credentials in config/secrets.yml

```
default: &default
  TWITTER_CONSUMER_KEY: ''
  TWITTER_CONSUMER_SECRET: ''
  TWITTER_ACCESS_TOKEN: ''
  TWITTER_ACCESS_TOKEN_SECRET: ''
  SPOTIFY_CLIENT_ID: ''
  SPOTIFY_CLIENT_SECRET: ''
```


- Deploy to Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

- Add rake task to your Heroku Scheduler:
```
rake tweet:random_song
```
```
rake tweet:request
```


### Demo: ###
You can also check an video demo by clicking the link below:
[Link for Demo](https://vimeo.com/138433160)

### Resource Links: ###
[Twitter] (https://twitter.com/spotifycaster)

[Web App] (spotifycaster.herokuapp.com)
