#!/usr/bin/python
import csv
import subprocess

def main():
	with open('diff.csv') as csvfile:
		readCSV = csv.reader(csvfile, delimiter=',')
		for row in readCSV:
			print(row)
			if (row[0][0] == '<'):
				print(row[0][2:] + "\t" + row[1])
			print(row[0], row[1], row[2])
main()