# Simple Progress Bar (spb)

Just a small library for those who don't know how to make a progress bar in their code, it's fully customizable!

1. spb.bar(char(string),len(number),step(number),blankchar(string),start(number))

char=character that is used to make a single step. If not stated uses "#"

len=length of the bar. If not stated uses 50

step=how much to step. If bigger than length of the bar then use default number, which is 1

blankchar=character that is used to fill the rest of the bar. If not stated uses "-"

start=from where to start in the progress bar. If bigger then length of the bar uses default number, which is 0