#!/usr/bin/env python

import socket

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(("3dttt_87277cd86e7cc53d2671888c417f62aa.2014.shallweplayaga.me", 1234))

board = {}

class MyMove(Exception):
	def __init__(self, move):
		self.move = move

def is_empty(b, t):
	if b[t] == ' ':
		raise MyMove(t)
	else:
		return False

def pick(b):
	try:
		is_empty(b, (1,1,1))

		is_empty(b, (0,0,0))
		is_empty(b, (2,2,2))

		is_empty(b, (2,0,0))
		is_empty(b, (0,2,2))

		is_empty(b, (0,2,0))
		is_empty(b, (2,0,2))

		is_empty(b, (0,0,2))
		is_empty(b, (2,2,0))

		for x in [0, 1, 2]:
			for y in [0, 1, 2]:
				for z in [0, 1, 2]:
					is_empty(b, (x,y,z))
	except MyMove as e:
		return e.move

while True:
	msg = b''
	chunk = s.recv(4096)
	if chunk == b'':
		break
	row = 0
	for l in chunk.split("\n"):
		if row == 0 and l[-5:-1] != '  z=':
			print " ", l
			continue
		print ":", l
		row += 1
		if row == 1:
			z = int(l[-1:])
		elif row in [3, 5, 7]:
			y = (row - 3) / 2
			board[0,y,z] = l[3]
			board[1,y,z] = l[7]
			board[2,y,z] = l[11]
			if row == 7:
				row = 0
				if z == 2:
					t = pick(board)
					if (t):
						s.send("%d,%d,%d\n" % t)
