thingsthattastegoodafterbrushingyourteeth.com
=============================================

What to eat when you've got clean teeth.

# Bootstrap

```
psql

> create database things_development;
> \q

rake db:migrate db:seed
ruby app.rb
```

# Setting up data on Heroku

```
heroku run rake db:migrate
heroku run rake db:seed
```

# Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

# More Importantly, How Do I Add More Things That Taste Good?

Do all the things under `contributing` except add your new thing that tastes
good to `db/seeds/things.rb`
