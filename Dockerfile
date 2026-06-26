FROM python:3.11

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

ENV YOUR_NAME=Zakiyah

EXPOSE 5500

ENTRYPOINT ["python","app.py"]