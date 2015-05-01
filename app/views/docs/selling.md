# Selling Your Data

When you put data up for sale on sellf.org, it can be purchased by anyone. You can <%= link_to "choose", docs_pricing_path %> what price it's sold for.

A <%= (100 * ENV['FEE_PERCENTAGE'].to_f).to_i %>%  fee will be deducted from the purchase amount when sales are made.

## What to Sell

Only you can know what data you're comfortable selling. Perhaps start by having a look at your <%= link_to "Facebook data", docs_facebook_path %>.

## Receiving Money

The most important part of selling stuff is getting money.

Any logged in user can put data up for sale, but before anyone can buy it, you'll need to connect to a US bank account. If you don't have an account connected, you'll be prompted to set one up on the <%= link_to "Sell page", sell_path %>.

Sellf uses [Stripe](https://stripe.com/help/security) for payment processing. Your bank account information goes directly to Stripe, without ever being saved on sellf.org servers.

Every business morning, any money you are owed will automatically be transferred into that account. The transfer can take a few days. If you do not have a bank account connected, the money will remain
