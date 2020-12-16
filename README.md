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

## ip tables config example

Allow redit access on localhost & docker only
```
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 6379 -j ACCEPT
iptables -A INPUT -s 172.17.0.0/16 -p tcp -m tcp --dport 6379 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 6379 -j REJECT --reject-with icmp-port-unreachable
```
