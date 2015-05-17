# turns our font manifest (in fonts.txt) into a google fonts API url parameter
import sys, urllib.parse
fonts = []
for line in sys.stdin:
	if line[0] == "#": continue
	if line[0] != "\t":
		fonts.append((line.strip(), []))
	else:
		fonts[-1][1].append(line.strip())
print("|".join(urllib.parse.quote_plus(name) + ":" + ",".join(styles) for name, styles in fonts))