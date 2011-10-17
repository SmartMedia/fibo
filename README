Fibo
===========

Provides rails helpers for interfacing with Facebook permissions and canvas page age restrictions.

Requires the mogli, facebooker2 and ruby-hmac gems.


Example
-------

0- Prerequisite: You need a facebook app.  Have your API Key, Application
Secret, and Application ID handy.

1- Install fibo as a plugin in your rails app.

2- Create `config/fibo.yml` with the appropriate environment.

    production:
      canvas_page: <canvas url>
      scope: <facebook permissions>
      minimal_age: <age>

3- Create `config/initializers/fibo.rb` and place the following line in it

    Fibo.load_fibo_yaml

4- Add the following line to your `app/controllers/application_controller.rb`
   (add it right after the line class `ApplicationController < ActionController::Base` so as to add the Fibo instance methods to the Application controller)

    include Facebooker2::Rails::Controller
    include Fibo::Rails::Controller

    before_filter :valdiate_age!    
    before_filter :authenticate_facebook_user!
