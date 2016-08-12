#!/bin/bash

diff <(sort curr_enroll_fall.csv) <(sort curr_enroll_spring.csv) > differences.csv