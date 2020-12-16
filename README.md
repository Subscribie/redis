Shops (sites) announce their Stripe connect account id to a redis server. 

The key is their stripe connect account id
The value is their web address

e.g The shop's (via a cron) report their account id by sending:

```
set account_abc123hdf https://example.com

```

When a webhook is recieved, another service, 
the router: https://github.com/Subscribie/stripe-connect-webhook-endpoint-router
can get the shop's web address by looking it up by its account id. 

e.g:

```
get account_abc123hdf
```
(And then sends the webhook payload to the correct shop)
