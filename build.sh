#!/bin/bash
mkdir -p static/css static/js static/fonts

# bootstrap
BOOTSTRAP=3.3.5
wget -O /tmp/bootstrap.zip https://github.com/twbs/bootstrap/releases/download/v$BOOTSTRAP/bootstrap-$BOOTSTRAP-dist.zip
rm -rf /tmp/bootstrap
unzip -q -d /tmp/bootstrap /tmp/bootstrap.zip
cp /tmp/bootstrap/bootstrap-$BOOTSTRAP-dist/css/bootstrap.min.css static/css/bootstrap.min.css
cp /tmp/bootstrap/bootstrap-$BOOTSTRAP-dist/css/bootstrap-theme.min.css static/css/bootstrap-theme.min.css
cp /tmp/bootstrap/bootstrap-$BOOTSTRAP-dist/js/bootstrap.min.js static/js/bootstrap.min.js
cp /tmp/bootstrap/bootstrap-$BOOTSTRAP-dist/fonts/* static/fonts/
rm -rf /tmp/bootstrap

# jquery, etc.
wget -4 -O static/js/jquery.min.js https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js
wget -4 -O static/js/moment.min.js https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.3/moment.min.js

# font awesome
FONTAWESOME=4.4.0
wget -O /tmp/font-awesome.zip https://fortawesome.github.io/Font-Awesome/assets/font-awesome-$FONTAWESOME.zip
rm -rf /tmp/font-awesome
unzip -q -d /tmp/font-awesome /tmp/font-awesome.zip
cp /tmp/font-awesome/font-awesome-$FONTAWESOME/css/font-awesome.min.css static/css
cp /tmp/font-awesome/font-awesome-$FONTAWESOME/fonts/* static/fonts
rm -rf /tmp/font-awesome

# other resources
wget -qO static/js/jquery.payment.js https://raw.githubusercontent.com/stripe/jquery.payment/3dbada6a8c7fbb0d13ac121d0581a738d9576f53/lib/jquery.payment.js
wget -qO static/js/mailcheck.min.js https://raw.githubusercontent.com/mailcheck/mailcheck/v1.1.1/src/mailcheck.min.js

# webfonts
webfont-dl \
	"http://fonts.googleapis.com/css?family=`cat fonts.txt | python3 fonts.py`" \
	-o static/fonts/fonts.css

