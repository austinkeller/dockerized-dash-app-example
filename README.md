# Dockerized Plotly Dash App

This is an example application that uses the structure of a
[Dash](https://dash.plot.ly/) app for use in Dash Enterprise or Heroku, but also
allows Dockerized deployment.

This project complies with the structure recommended for Dash Enterprise/Heroku
from https://dash.plot.ly/deployment

## Running

1. Create your Docker image

```
docker build -t my_dashboard .
```

2. Run app in container

```
docker run -it -e PORT=8080 -p 8080:8080 my_dashboard
```

This will run the app on http://localhost:8080/
