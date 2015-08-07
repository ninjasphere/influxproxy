#NAME
ninjasphere/influxproxy

#DESCRIPTION
This project produces a docker image which can be used as an
unauthenticated reverse proxy to an authenticated influxdb instance.

The use case for this proxy is to allow unauthenticated access to an influxdb
instances from trusted source IP addresses while requiring authenticated access
for non-trusted source addresses.

In particular, it allows an instance of chronograph running in a trusted docker container
to have unauthenticated access to an influxdb instance running in a neighbouring container
while still requiring authenticated access to the influxdb instance from external
clients.

#ENVIRONMENT

##INFLUX_HOST
The name of the influx host.

##INFLUX_URL
The URL of the influx server, including the port.

##INFLUX_USER
The influx user.

##INFLUX_PASSWORD
The password associated with the influx user.

#PORTS

##18086
The port that must be exposed to trusted clients of the container.

#LINKS or HOSTS

A --link or --add-host parameter must be used to map an IP address to ${INFLUX_HOST}

#EXAMPLES

Start an unauthenticated proxy to a secured influx instance ('secureinflux') using the credentials 'query/querysecret'. Clients from trusted networks should connect to port 18086 of the docker host.

```
docker run \
	-d \
	-p 18086:18086 \
	--add-host influx:secureinflux \
	-e INFLUX_USER=query \
	-e INFLUX_PASSWORD=querysecret \
	ninjasphere/influxproxy
```

#SECURITY

The docker administrator is responsible (via unspecified mechanisms) for ensuring that access to the exposed port (18086) of containers created from the ninjasphere/influxproxy image is restricted to trusted source IP addresses.