#!/bin/bash

nice -n 6 ./multi.bash&

nice -n 0 ./multi.bash&
