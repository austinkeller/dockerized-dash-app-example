FROM python:3.7


# psutil requires gcc, so we'll install build-essential.
RUN apt-get update -y -q && \
    apt-get install --no-install-recommends -y -q \
        build-essential \
        python3-wheel && \
    apt-get clean && \
    rm /var/lib/apt/lists/*_*

# Copy over the application source and install all requirements into the
# virtualenv.
WORKDIR /app

ENV VIRTUAL_ENV=/env
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Add requirements file separately to avoid rerunning pip when any of the
# app directory changes
ADD requirements.txt /app/requirements.txt
RUN pip install --upgrade pip \
    && pip install -r /app/requirements.txt

# Add rest of application directory
ADD . /app

EXPOSE 8080

# Start all honcho processes
CMD ["honcho", "start"]
