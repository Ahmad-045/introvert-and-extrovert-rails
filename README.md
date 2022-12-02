## Introvert or an Extrovert

This is a simple personality test application, that takes 3-5 different questions, map them into a score and produces a personality trait of either Introvert or an Extrovert


Below is some rails specifc versions and instructions to run the project

### Ruby version <br />
 * The Ruby Version that is used in the development of this project is **v2.7.2** <br />
 * The Rails Version that is used in the development of this project is **v5.2** <br />
 
 ### Set Up Rails app <br />
 * Before running or installing the application on your system, make sure that you have installed all the important dependecies i.e., Ruby, Rails or bundler.<br />
 * Simply go to the root directory of the application and run the **bundle** command to install all the gem dependencies of the rails application. [ You can find all the gems (that are used in the application) in **GemFile** ] <br />
 * Use this command to run all the migration file. This will basically create the database, load the schema, and initialize it with the seed data. <br />
 >'bundle exec rake db:setup',
  * No need to run any kind of migrations, because final version is not using any kind of table from the database
  
  ### Start the Application <br />

 * To start the Rails application, you can use the following command to run it.
  >bundle exec rails server<br />
 * You can find your app now by pointing you browser to https://localhost:3000. If everything worked, you can then start signing up or using the application.<br />
