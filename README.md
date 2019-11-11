# README

# BBQ

Using this web application, you can create events for your friends, as well as subscribe on and comment these and others events.

[BBQ](https://bbq-alex.site/) - vps deployed example

### Technologies used

- Authentication using the `devise` gem;

- Authentication through social networks `Vkontakte` and` Facebook`;

- Authorization using `pundit`;

- Design and layout using `bootstrap 4`;

- Image display implemented using `owlcarousel` and` lightbox`;

- `ActionMailer`,` ActiveJob` and `Sendgrid` for sending email notifications;

- `Carrierwave`,` rmagick` and `AWS S3` for loading and storing images;

- Yandex maps to determine the location of the event;

- Deploy on VPS using `Capistrano`.

### Requirements

`ruby >= 2.6.2`

`rails ~> 5.2.0`

### Installation & using

In `terminal` or `cmd`

- `$ git clone git@github.com:sas2job/bbq.git`

- `$ gem install bundler` - if needed

- `$ bundle install`

- `$ rails db:migrate`

- `$ rails s` for server starting

Then open `http://localhost:3000` at your web-browser
