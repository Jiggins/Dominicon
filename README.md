Dominicon Website
=================

## Setup

### Requirements
- Ruby >= 2.1
- ImageMagick

### Installation
```console
bundle install
rake db:migrate
```

### Environment Variables
These are the environment variables that need to be set when the site goes
live. The AWS variables only need to be set when using the production
environment. The Google variables can be found in Google Calendar.

```sh
AWS_ACCESS_KEY_ID=
AWS_REGION=eu-west-1
AWS_SECRET_ACCESS_KEY=
DOMINICON_CALENDAR_ID=
GOOGLE_CUSTOM_SEARCH_API_KEY=
GOOGLE_CUSTOM_SEARCH_ENGINE_KEY=
RACK_ENV=development
RAILS_SKIP_ASSET_COMPILATION=false
RAILS_SKIP_MIGRATIONS=false
SECRET_KEY_BASE=$(rake secret)
```

Copy the above into a file called `.env`. Here's a quick script to set all the
variables:

```sh
while read line; do export ${line}; done < .env
```

### Run a local server
Use puma:

```console
puma
```

Then open `http://localhost:9292` in some browser.

### Upload to AWS
We are using Amazon Elastic Beanstalk to host the server, to upload to AWS
simply:

```console
eb init
eb create production
eb deploy
eb open
```

## Gems
The notable Gems used in this project are:
- [`aws-sdk`](https://aws.amazon.com/sdk-for-ruby/)
- [`friendly_id`](http://norman.github.io/friendly_id/)
- [`google-api-client`](https://developers.google.com/api-client-library/ruby/)
- [`googleauth`](https://developers.google.com/api-client-library/ruby/)
- [`paperclip`](https://thoughtbot.com/open-source)

### `aws-sdk`
Used to communicate with Amazon AWS, also a dependency for Paperclip.
Configuration handled in `config/environments/production.rb`.

### `friendly_id`
Used to give all resources (games, rpgs, events, etc.) a nicer url. For
example; the url for the Cards Against Humanity page looks like
`dominicon.info/games/boardgames/cards-against-humanity` rather than
`dominicon.info/games/boardgames/3` 

### `google-api-client` and `googleauth`
Used to connect this site with the Society's Google calendar. See
`config/environments/production.rb` for Configuration.

### `paperclip`
Used to store images associated with resources, uses AWS S3 to store images.
See `config/environments/production.rb` for Configuration.

## TODO
[ ] Gallery
[ ] Timetable
[ ] About
[ ] Games
    - Board Games
    - Card Games (Adam Fallon)
    - Console Games (Shane/DJ Dennis)
    - RPGs (Fionn Collender)
    - Wargames (Ethan Day-Jones)

[ ] Events
    - Table Quiz
        - Who wants to be a millionaire
    - Charity Auction
    - Cosplay Competition

[ ] Sponsors & Traders (possibly separate)
[ ] [Good Game Ireland](http://goodgameireland.com)
    - Ask them (Cormac Finn or Aaron Quinn)


Framed Posters (ask Carmel)
Old posters/last year posters

## Game Database
Fields:
- Name
- Description
- Image

Board Games, Console Games, RPGs
- Number of players

## Events
- Main Events
- Board Games
- CCG
- Consoles
- GGI
- RPG
- Wargames

Full timetable for large screen, tabs for medium, Single tab for mobile, PDF
for full timetable.
