# haproxy-public (Dockerized HAProxy with Let's Encrypt)
public load balancer,  Haproxy with Let's Encrypt and Consul template (service discovery) 

This container provides a HAProxy 1.6 application with Let's Encrypt certificates generated at startup,as well as renewed (if necessary) once a week.

also act like load balancer for your public services thanks to consul.

Usage

```
docker run \
    -e CERTS=my.domain,my.other.domain \
    -e EMAIL=my.email@my.domain \
    -e APP_DOMAIN=domain.x
    -e APP_PREFIX: dev,prod,test
    -v /etc/letsencrypt:/etc/letsencrypt \
    -p 80:80 -p 443:443 -p 1936:1936\
    nebtex/haproxy-public
```    
    
based on https://github.com/BradJonesLLC/docker-haproxy-letsencrypt
and https://github.com/CiscoCloud/haproxy-consul
