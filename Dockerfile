# inherit python image
FROM python:3.13.1-slim

# setup directories
RUN mkdir /applications
WORKDIR /applications

# copy python dependencies and install these
COPY requirements.txt .
RUN pip install -r requirements.txt

#Copy the rest of the application
COPY . .

# Environment variables
ENV PYTHONUNBUFFERED 1

#Expose port 8000 to allow communication to/from server
EXPOSE 8001
STOPSIGNAL SIGINT

#ENTRYPOINT["", "--", "app","" ]
CMD ["flask --app app --host=0.0.0.0 run "]