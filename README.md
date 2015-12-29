##rails s

runs the rails server

##bundle exec guard

sets up auto-reload for when you save on views

#####after pulling if you get errors try some of the following things:

- there may have been new gems installed
  run `bundle`
- there may have been migrations to the db
  run `rake db:migrate`
- if you get error about wrong ruby version
  run `rvm use 2.2.3`  
