FROM teamcloudyuga/python:alpine
COPY . /usr/src/app
WORKDIR /usr/src/app
ARG VERSION=1.0.0-dockerfile
ENV VERSION=$VERSION
ENV LINK http://www.meetup.com/cloudyuga/
ENV TEXT1 CloudYuga
ENV TEXT2 Garage RSVP!
ENV LOGO https://raw.githubusercontent.com/cloudyuga/rsvpapp/master/static/cloudyuga.png
ENV COMPANY CloudYuga Technology Pvt. Ltd.
RUN pip3 install -r requirements.txt
CMD python rsvp.py
