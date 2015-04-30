# sellf.org

This is the source code for the application at [https://sellf.org](https://sellf.org).

If you want to make a website where people can sell stuff, this might be a good place to start.

## Structure

![uml diagram](uml.png)

Accounts are planned but not yet implemented.

## develop

    git pull
    psql --command 'CREATE_DATABASE sellf_development;'
    bundle exec rake bower:install
    bundle exec rake db:migrate
    bundle exec rails s

## deploy

You'll need:

*   MRI Ruby 2.2.2, with bundler
*   A Stripe account, configured to use Stripe Connect
*   A Heroku account, and the heroku toolbelt installed
*   An s3 bucket
*   A typekit kit with the following faces:
    *   inconsolata regular
    *   chaparral pro regular
    *   chaparral pro bold
    *   futura pt book
*   A unique string to use as a salt for id hashing

Then do the following:

    git clone git@github.com:sellf-dot-org/sellf.git
    cd sellf
    heroku create <name>
    git push heroku
    heroku run bundle exec rake db:migrate
    heroku config:add \
        HOST=https://<name>.herokuapp.com \
        STRIPE_PUBLISHABLE_KEY=something \
        STRIPE_SECRET_KEY=something \
        STRIPE_CLIENT_ID=something \
        S3_BUCKET_NAME=something \
        AWS_ACCESS_KEY_ID=something \
        AWS_SECRET_ACCESS_KEY=something \
        TYPEKIT=something \
        SALT=something
    heroku open

## resources

### stripe test info

*   **routing number**: `110000000`
*   **account number (success)**: `000123456789`
*   **VISA (success)**: `4242424242424242`
