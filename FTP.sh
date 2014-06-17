#!/bin/bash
	ftp -n<<!
	open {1} {2}
	user {3} {4}
	binary
	lcd {5}
	prompt off
	put ${6}
	close
	bye
	!