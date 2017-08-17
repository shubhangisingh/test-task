
* Create a clean ruby on rails application using twitter bootstrap.  -- done

* Create User model with fields first, last, email. -- done

* Install and setup devise gem to use the User model for auth (email used as a user name).-- done

* Generate devise views via rake command -- done

* On the register new user view add a new text field called Secret Code. -- done

* Restrict user registration so a hard coded secret code must be entered, eg. 'foobar'. --done

* Create a new user with seeds called 'admin' --done

* Create a controller/model SecretCode (1-to-1 relationship to Users which can be null, plus code string and usual created/updated). --done

* The controller needs to provide a view and actions to generate a number of secret codes. --done

* Index page shows secret codes available, and the associated user email address for ones that have an association. --done

* Index page also has a button to generate more secret code models which by default have no associated user and a randomly generated secret code (some short hash or guid). --done

* The index page also has a drop down filled with 1, 10, 20, 50, 100 which determines how many secret codes to generate (default selection on drop down is 10).

* link secret code field on user registration page to only allow available secret code models (one with no current user associated). -- done

* registering a user will create association between user and the valid secret code they used. --done

* secret code index page should show user email address for a secret code after they use it for registration in a table next to the code. --done

* setup CanCan ACL gem. --done

* create a role called :admin and manually in DB associate it with the admin user created manually earlier (no UI needed for this config). --done

* configure so that SecretCode page link and entire controller is only accessible to :admin role users. --done
