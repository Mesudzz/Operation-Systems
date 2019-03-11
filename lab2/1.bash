#!/bin/bash
grep -r -h -s "ACPI:" /var/log/ > errors.log
