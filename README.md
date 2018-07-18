# Events Calendar

Team Satchel's recruitment coding task. The task is about:
* displaying a calendar view with current day highlighted
* displaying events in the calendar as continuous blocks spanning multiple days
* having the ability to add new event, which would be instantly displayed on the page (no reload)

Finished application looks like this:

![Application screenshot](https://raw.githubusercontent.com/pjg/smhw-event-calendar/master/doc/application.png)


## Installation

To install required backend dependencies run:

```bash
bin/setup
```

Note, that you might want to edit the defaults in `config/database.yml` afterwards.

To install required frontend dependencies run:

```bash
cd frontend && npm install
```


## Running

Start the backend server:

```bash
bin/rails server
```

Start the frontend app:

```bash
cd frontend
npm run serve
```

Then visit http://localhost:8080 to see the app running.


## Running specs

Backend specs:

```bash
bin/rspec spec
```

Frontend unit specs:

```bash
cd frontend && npm run test:unit
```

Frontend e2e specs:

```bash
cd frontend && npm run test:e2e
```
