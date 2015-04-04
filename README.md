# README #

MyWebcam is an aggregators for online webcams. Logged users can manage theirs list of favorites. Webcams are represented in a grid or on a map.

## Features ##

- Map and grid of webcams
- Search
- User authentication
- Favorite with order
- Click to select webcam's location

## Demo ##

<http://srvz-isic04.he-arc.ch/MyWebCams>

## Installation ##

### Requirements ###
- Ruby 2.1+
- Rails 4.1+
- PostgreSql 9+

### Preparation ###

Copy [config/app.yml.stample](config/app.yml.stample) to config/app.yml and replaces TODO's

Launch for install bundles and gems :

    bundle install

Prepare the database :

	rake db:create db:migrate

And enjoy !

PS : Capistrano can be used


## Contributors : ##

[Chabana](https://github.com/Chabana)

[fa18swiss](https://github.com/fa18swiss)

[PocketTrout](https://github.com/PocketTrout)

## License ##

[GNU General Public License](LICENSE)
