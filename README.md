ZOLI Motivation Postcard Service
Welome to ZOLI POST! If you would like to send motivation postcards to your loved ones, you are in the right place. In this CLI application, you will be able to see your current postcards, send a new postcard, revise your postcard and cancel your postcard.

Models and Associations
In this CLI application, We have built a postcard domain model to deliver this service. We have a sender, receiver and postcard model. They are associated in the following way:

A sender has many postcards and has many receivers through postcards
A postcard belongs a sender and a receiver
A receiver has many postcards and has many senders through postcards
Getting Started
Fork and clone this repository to your local machine. Bedore you run the application, make sure you run bundle install first in your terminal to install all the gems required in the Gemfile Then you can start running the program!

Running the application
We've set up the migrations in the db/migrate directory to create the senders, postcards and receivers table. Indb/migrate directory, we've also set up some data in the seeds file for you to play around with.

Run ruby ./bin/run.rb in your terminal, you will start with a greeting message and a login prompt

Contributor's Guide
Program Structure
Database connection and files connectio can be are set up in environment file in config/environment.rb
You can find database schema and data in db, and models in app/models
All deliverables and methods are located in app/controllers
