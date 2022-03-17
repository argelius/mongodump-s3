# mongodump-s3

Dumps MongoDB database to S3 with timestamp.

```
docker run -e MONGODB_URI="mongodb://mongo" -e S3_PREFIX="s3://my-bucket/backups" argelius/mongodump-s3
```
