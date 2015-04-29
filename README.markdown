# sellf.org

![uml diagram](uml.png)

## develop

    git pull
    psql --command 'CREATE_DATABASE sellf_development;'
    bundle exec rake bower:install
    bundle exec rake db:migrate
    bundle exec rails s

## deploy

    git pull
    heroku create <name>
    git push heroku
    heroku run bundle exec rake db:migrate
    heroku config:add HOST=https://<name>.herokuapp.com
    heroku open

## todo

### rent

*   $18 [rental coffee](http://www.chicagoeventrentals.com/services-products/party-banquets/coffee-tea-service.aspx)
*   $15 [projection screen](http://www.chicagoeventrentals.com/services-products/party-banquets/audio-visual-equipment-conference.aspx)
*   $10 [two card tables](http://www.chicagoeventrentals.com/services-products/chair-table-rentals/table-rentals/complete-table-list.aspx)
*   lav mic

rental bill: 95$

### buy

*   $40 [buttons](http://www.busybeaver.net/)
*   actual coffee grounds
*   paperware

## resources

### stripe test info

*   **routing number**: `110000000`
*   **account number (success)**: `000123456789`
*   **VISA (success)**: `4242424242424242`
