<p align="center">
  <img src="symbol-logo.svg" /> 
</p>

![Made with Love by Icalia Labs](https://img.shields.io/badge/With%20love%20by-Icalia%20Labs-ff3434.svg)
[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)


It is an online learning platform that allows users to create content, manage progress and spread culture remotely

## Table of contents

* [Client Details](#client-details)
* [Environment URLS](#environment-urls)
* [Da Team](#team)
* [Management resources](#management-resources)
* [Setup the project](#setup-the-project)
* [Running the stack for development](#running-the-stack-for-development)
* [Stop the project](#stop-the-project)
* [Restoring the database](#restoring-the-database)
* [Debugging](#debugging)
* [Running specs](#running-specs)


### Client Details

| Name  | Email | Role | Slack |
| ------------- | ------------- | ------------- | ------------- |
| Pablo Rocha | pablorocha@icalialabs.com | Organizational Development | @pablorocha |


### Environment URLS

* **Production** - [https://www.calmecac.icalialabs.com](https://www.calmecac.icalialabs.com)
* **Staging** - [https://sandbox.calmecac.icalialabs.com](https://sandbox.calmecac.icalialabs.com)

### Da team 

| Name  | Email | Role |
| ------------- | ------------- | ------------- |
| Luis Ignacio | cejas@icalialabs.com | Development |
| Misael | misael@icalialabs.com | Development |
| Luigi | luismnzr@icalialabs.com | Design |
| Ana Marcela | ani.villarrealmtz@gmail.com | Design |

### Management tools

You should ask for access to this tools if you don't have it already:

* [Github repo](https://github.com/IcaliaLabs/calmecac)
* [Heroku Staging](https://dashboard.heroku.com/apps/epick-staging)
* [Heroku Production](https://dashboard.heroku.com/apps/epick-production)

## Development

### Setup the project

You'll definitely want to install [`plis`](https://github.com/IcaliaLabs/plis), as in this case will
let you bring up the containers needed for development. This is done by running the command
`plis start`, which will start up the services in the `development` group (i.e. rails
and sidekiq), along with their dependencies (posgres, redis, etc).

After installing please you can follow this simple steps:

1. Clone this repository into your local machine

```bash
$ git clone git@github.com:IcaliaLabs/calmecac.git
```

2. Fire up a terminal and run:

```bash
$ plis run web bash
```

3. Inside the container you need to migrate the database:

```
$ rake db:migrate
```

### Running the stack for Development

1. Fire up a terminal and run: 

```
$ plis run web bash
```

2. Run Calmecac:

```
$ plis start
```

That command will lift every service Calmecac needs, such as the `rails server`.

It may take a while before you see anything, you can follow the logs of the containers with:

```
$ docker-compose logs
```

Once you see an output like this:

```
web_1          | 21:16:12 web.1       | => Booting Puma
web_1          | 21:16:12 web.1       | => Rails 5.1.2 application starting in development on http://0.0.0.0:3000
web_1          | 21:16:12 web.1       | => Run `rails server -h` for more startup options
web_1          | 21:16:12 web.1       | Puma starting in single mode...
web_1          | 21:16:12 web.1       | * Version 3.9.1 (ruby 2.4.2-p198), codename: Private Caller
web_1          | 21:16:12 web.1       | * Min threads: 5, max threads: 5
web_1          | 21:16:12 web.1       | * Environment: development
web_1          | 21:16:12 web.1       | * Listening on tcp://0.0.0.0:3000
web_1          | 21:16:12 web.1       | Use Ctrl-C to stop
```

This means the project is up and running.

### Stop the project

In order to stop Calmecac as a whole you can run:

```
% plis stop
```

This will stop every container, but if you need to stop one in particular, you can specify it like:

```
% plis stop web
```

`web` is the service name located on the `docker-compose.yml` file, there you can see the services name and stop each of them if you need to.

### Setup Badges
Calmecac has a very simple gamification process based on points and kinds.
To setup the basics run as follows:

```bash 
$ rails gioco:add_badge[noob,0,student,true]
$ rails gioco:add_badge[the_playground,1,student]
$ rails gioco:add_badge[the_spark,10,student]
$ rails gioco:add_badge[the_know_it_all,30,student]
$ rails gioco:add_badge[the_ai,100,student]
```

The badges names are based on image badges that Calmecac has default. For more information about the gamification system
please visit [link](https://github.com/thelastinuit/gioco/tree/1.1.1).

### Restoring the database

You probably won't be working with a blank database, so once you are able to run Calmecac you can restore the database, to do it, first stop all services:

```
% plis stop
```

Then just lift up the `db` service:

```
% plis start db
```

The next step is to login to the database container:

```
% docker exec -ti calmecac_db_1 bash
```

This will open up a bash session in to the database container.

Up to this point we just need to download a database dump and copy under `calmecac/backups/`, this directory is mounted on the container, so you will be able to restore it with:

```
$ /bin/restoredb calmecac_dev db/backups/<databaseDump>
```

If you want to see how this script works, you can find it under `bin/restoredb`

Once the script finishes its execution you can just exit the session from the container and lift the other services:

```
% plis start
```

### Debugging

We know you love to use `debugger`, and who doesn't, and with Docker is a bit tricky, but don't worry, we have you covered.

Just run this line at the terminal and you can start debugging like a pro:

```
% plis attach web
```

This will display the logs from the rails app, as well as give you access to stop the execution on the debugging point as you would expect.

**Take note that if you kill this process you will kill the web service, and you will probably need to lift it up again.**

### Running specs

To run specs, you can do:

```
$ plis run test rspec
```

Or for a specific file:

```
$ plis run test rspec spec/models/user_spec.rb
```
