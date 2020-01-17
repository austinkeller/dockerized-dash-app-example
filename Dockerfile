FROM python:3.7


# psutil requires gcc, so we'll install build-essential.
RUN apt-get update -y -q && \
    apt-get install --no-install-recommends -y -q \
        build-essential && \
    apt-get clean && \
    rm /var/lib/apt/lists/*_*

# Copy over the application source and install all requirements into the
# virtualenv.
WORKDIR /app
RUN python -m venv /env
ADD requirements.txt /app/requirements.txt
RUN /env/bin/pip install -r /app/requirements.txt
ADD . /app

EXPOSE 8080

# Activate the virtualenv (so that python points to the right thing in honcho)
# and then start all honcho processes.
CMD . /env/bin/activate; /env/bin/honcho start
