#!/bin/bash
grep -E -o -r -h -s "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b" /etc/ > emails.txt

