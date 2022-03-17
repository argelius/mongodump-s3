#!/usr/bin/env bash

set -e

warn () {
    echo "$0:" "$@" >&2
}
die () {
    rc=$1
    shift
    warn "$@"
    exit $rc
}

echo "Dumping database..."

if [[ -z "${MONGODB_URI}" ]]; then
  die 128 "The MONGODB_URI environment variable must be set"
fi

if [[ -z "${S3_PREFIX}" ]]; then
  die 128 "The S3_PREFIX environment variable must be set"
fi

mongodump --uri="${MONGODB_URI}" --archive=dump.archive
gzip dump.archive

aws s3 cp dump.archive.gz "${S3_PREFIX}/dump-$(date "+%Y-%m-%d-%H:%M:%S").sql.gz"
