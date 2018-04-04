# README

An application for users to see gifs sorted by category and save their favorites.

Admins can type a word and in the navbar click generate gif. This will add a random gif (powered by Giphy api) associated with the typed word to the application. It will also create a new category of that word if one does not exist already

Application Deployed to Heroku at : https://calm-brook-77558.herokuapp.com/

To open on your own computer: git clone, run bundle, rails s, run rake db:setup and open your browser in localhost:3000

Run the test suite by typing rake db:test:prepare then RSpec

Ruby version 2.5.0

Database postgresql
