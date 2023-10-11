# frecq

App for reading data from the face recognition database

### Getting Started

to run server:

```cd server```

```docker compose up```

```cat ./facerecdb.dump | PGPASSWORD=postgres psql -h localhost -d frecqdb -U frecquser -p 8008```
(имя бд, пользователь и пароль должны совпадать с переменными, определенными в `server/.env`)

to run app:

```flutter run```
