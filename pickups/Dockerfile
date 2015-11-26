FROM python:latest

WORKDIR /app
RUN git clone https://github.com/mtomwing/pickups.git .
RUN pip install -r requirements.txt
CMD python -m pickups --port 6667 --address 0.0.0.0
