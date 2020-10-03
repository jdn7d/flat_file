Specifications for the Sinatra Assessment
Specs:

[x] Use Sinatra to build the app Built using Corneal gem

[x] Use ActiveRecord for storing information in a database. ActiveRecord was set up by: 1. Requiring 'activerecord' and 'sinatra-activerecord' in the gemfile and running bundle install in the terminal to install the gem. 2. Indicating to ActiveRecord that we are using SQL via the SQLite3 gem. 3. Setting up the connection to our database within our environment.rb file. 4. Setting the models within the app to inherit from ActiveRecord.

[x] Include more than one model class (e.g. User, Post, Category) 
--> FlatFile utilized 3 models: User, Artist and Artwork.

[x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) 
--> The user has_many artists and has_many artworks through artists

[x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) A Console belongs to a Collection 
--> Artworks belong to the artist and the artist belongs to the user

[x] Include user accounts with unique login attribute (username or email) Users have a unique username
--> Validations in the User model only allow unique email addresses to register.

[x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying Console Controller handles this
--> The Artists and Artworks Controllers utilize CRUD.

[x] Ensure that users can't modify content created by other users
--> A user must be logged in to view any artists and artworks. When creating, updating or deleting artists or artworks, FlatFile saves the changes only to that user

[x] Include user input validations 
--> Validations in the User model are setup for the username (can't be blank, must be unique, must be at least 4 characters, cannot contain blank space numbers, special characters), email (can't be blank, must be in format xxxx@xxxx.xxx), and password (can't be blank, must be between 6-20 characters).

[x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) I use an instance variable of @errors to hold error messages and display on the page to the user

[x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code 
--> README.md specifications met.

Confirm

[x] You have a large number of small Git

[x] Your commit messages are meaningful

[x] You made the changes in a commit that relate to the commit message

[x] You don't include changes in a commit that aren't related to the commit message