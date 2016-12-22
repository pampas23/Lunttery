# Lunttery 

Quick recommendation for lunch, solving the tiring and repetitive decision of office workers.

Created the Back-end system and admin with authority control with RoR, built database with Google Place API, developed API for iOS app. Keywords:PostgreSQL、geokit、paperclip、devise、omniauth-facebook、bootstrap.


* Ruby version 2.3.1
* Rails version 5.0

```
git clone git@github.com:pampas23/Lunttery.git
```
```
bundle install
```

```
cp config/facebook.yml.sample config/facebook.yml
```
if you want to use Facebook log_in, be sure to apply Facebook API KEY in https://developers.facebook.com/
```
bundle exec rake db:migrate
```