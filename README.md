
# Messaging app 

## To run the app :

- clone the repository and cd into the project folder
- run bundle
- run rackup
- visit localhost at 9292

## To set up your database from scratch :

- run psql
- create the database using the psql command CREATE DATABASE messages_manager_development (for development) and CREATE DATABASE messages_manager_test (for testing);
- running rake db:auto_migrate (rake db:auto_migrate RACK_ENV = test for testing) will update the databases with the necesarry tables to save the app data
- connect to the database using the pqsl command \c messages_manager_development(_test) 

## User stories

```
As a user, 
So I am able to revisit a specific idea in the future,
I want to be able to submit a message and see the content and when it was created.
```

```
As a user,
So I can keep track of all my ideas,
I want to be able to see previous messages with the newest message displayed at the top.
```

```
As a user,
So that it's easy for me to navigate the home page, 
I want to see each message displayed on the home page abbreviated to 20 characters.
```

```
As a user,
So that I can see the full message I wrote,
I want to click on each message of the list from the home page and be taken to a page showing the whole text of the message
```

```
As a user, 
So that I can update my ideas, 
I want to be able to edit each of the messages I have submitted.
```

```
As a user, 
So that I can remove messages that are not relevant anymore, 
I want to be able to delete each of the messages I have submitted.
```

```
As a user,
So that it's easier to identify what the message is about without reading the entire message, 
I want to be able to add tags to messages.
```

```
As a user,
So that I can see which messages have common themes,
I want to be able to click on a tag and be taken to a page showing all the messages that share the same tag. 
