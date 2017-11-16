# EPICK

![Made with Love by Icalia Labs](https://img.shields.io/badge/With%20love%20by-Icalia%20Labs-ff3434.svg)


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

* **Production** - [http://epick.icalialabs.com](http://epick.icalialabs.com)
* **Staging** - [https://epick-staging.herokuapp.com](https://epick-staging.herokuapp.com)

### Da team 

| Name  | Email | Role |
| ------------- | ------------- | ------------- |
| Luis Ignacio | cejas@icalialabs.com | Development |
| Misael | misael@icalialabs.com | Development |
| Luigi | luismnzr@icalialabs.com | Design |
| Ana Marcela | ani.villarrealmtz@gmail.com | Design |

### Management tools

You should ask for access to this tools if you don't have it already:

* [Github repo](https://github.com/IcaliaLabs/epick)
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
$ git clone git@github.com:IcaliaLabs/epick.git
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
2. Inside the container you need to install dependencies from `package.json`:

```
$ yarn install # --force is needed
```
3. Run Epick:

```
$ plis start
```

That command will lift every service Epick needs, such as the `rails server`.

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
web_1          | 21:16:13 webpacker.1 |  10% building modules 3/3 modules 0 active                                         
web_1          | 21:16:13 webpacker.1 | Project is running at http://0.0.0.0:8080/
web_1          | 21:16:13 webpacker.1 | webpack output is served from http://0.0.0.0:8080/packs/
web_1          | 21:16:13 webpacker.1 | Content not from webpack is served from /usr/src/app/public/packs
web_1          | 21:16:13 webpacker.1 | 404s will fallback to /index.html
Hash: ac6f700c45b1c1576888                                                              
web_1          | 21:16:26 webpacker.1 | Version: webpack 3.3.0
web_1          | 21:16:26 webpacker.1 | Time: 12967ms
web_1          | 21:16:26 webpacker.1 |          Asset       Size  Chunks                    Chunk Names
web_1          | 21:16:26 webpacker.1 |     counter.js    3.19 MB       0  [emitted]  [big]  counter
web_1          | 21:16:26 webpacker.1 | hello_react.js     2.9 MB       1  [emitted]  [big]  hello_react
web_1          | 21:16:26 webpacker.1 | application.js     872 kB       2  [emitted]  [big]  application
web_1          | 21:16:26 webpacker.1 |  manifest.json  186 bytes          [emitted]         
web_1          | 21:16:26 webpacker.1 |   [66] ./node_modules/react/react.js 56 bytes {0} {1} [built]
web_1          | 21:16:26 webpacker.1 |   [84] (webpack)-dev-server/client?http://0.0.0.0:8080 5.59 kB {0} {1} {2} [built]
web_1          | 21:16:26 webpacker.1 |   [85] ./node_modules/url/url.js 23.3 kB {0} {1} {2} [built]
web_1          | 21:16:26 webpacker.1 |   [93] (webpack)-dev-server/client/socket.js 856 bytes {0} {1} {2} [built]
web_1          | 21:16:26 webpacker.1 |  [125] (webpack)-dev-server/client/overlay.js 3.6 kB {0} {1} {2} [built]
web_1          | 21:16:26 webpacker.1 |  [130] (webpack)/hot/emitter.js 77 bytes {0} {1} {2} [built]
web_1          | 21:16:26 webpacker.1 |  [183] ./node_modules/react-dom/index.js 59 bytes {0} {1} [built]
web_1          | 21:16:26 webpacker.1 |  [279] multi (webpack)-dev-server/client?http://0.0.0.0:8080 ./app/javascript/packs/application.js 40 bytes {2} [built]
web_1          | 21:16:26 webpacker.1 |  [280] ./app/javascript/packs/application.js 515 bytes {2} [built]
web_1          | 21:16:26 webpacker.1 |  [281] multi (webpack)-dev-server/client?http://0.0.0.0:8080 ./app/javascript/packs/counter.js 40 bytes {0} [built]
web_1          | 21:16:26 webpacker.1 |  [282] ./app/javascript/packs/counter.js 258 bytes {0} [built]
web_1          | 21:16:26 webpacker.1 |  [283] ./app/javascript/counter/index.js 73 bytes {0} [built]
web_1          | 21:16:26 webpacker.1 |  [319] multi (webpack)-dev-server/client?http://0.0.0.0:8080 ./app/javascript/packs/hello_react.js 40 bytes {1} [built]
web_1          | 21:16:26 webpacker.1 |  [320] ./app/javascript/packs/hello_react.js 256 bytes {1} [built]
web_1          | 21:16:26 webpacker.1 |  [321] ./app/javascript/hello_react/index.js 56 bytes {1} [built]
web_1          | 21:16:26 webpacker.1 |     + 308 hidden modules
web_1          | 21:16:26 webpacker.1 | webpack: Compiled successfully.
```

This means the project is up and running.

### Stop the project

In order to stop EPICK as a whole you can run:

```
% plis stop
```

This will stop every container, but if you need to stop one in particular, you can specify it like:

```
% plis stop web
```

`web` is the service name located on the `docker-compose.yml` file, there you can see the services name and stop each of them if you need to.

### Restoring the database

You probably won't be working with a blank database, so once you are able to run EPICK you can restore the database, to do it, first stop all services:

```
% plis stop
```

Then just lift up the `db` service:

```
% plis start db
```

The next step is to login to the database container:

```
% docker exec -ti epick_db_1 bash
```

This will open up a bash session in to the database container.

Up to this point we just need to download a database dump and copy under `epick/backups/`, this directory is mounted on the container, so you will be able to restore it with:

```
$ /bin/restoredb epick_dev db/backups/<databaseDump>
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
