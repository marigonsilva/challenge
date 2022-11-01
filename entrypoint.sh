#!/bin/sh
gunicorn --log-level debug --keep-alive 60 -b 0.0.0.0:8000 app:app 