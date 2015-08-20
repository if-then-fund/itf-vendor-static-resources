#!/bin/bash
mkdir -p static/css static/js static/fonts

# bootstrap
BOOTSTRAP=3.3.0
wget -O static/css/bootstrap.min.css https://maxcdn.bootstrapcdn.com/bootstrap/$BOOTSTRAP/css/bootstrap.min.css
wget -O static/css/bootstrap-theme.min.css https://maxcdn.bootstrapcdn.com/bootstrap/$BOOTSTRAP/css/bootstrap-theme.min.css
wget -O static/js/bootstrap.min.js https://maxcdn.bootstrapcdn.com/bootstrap/$BOOTSTRAP/js/bootstrap.min.js

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

# webfonts
webfont-dl \
	"http://fonts.googleapis.com/css?family=`cat fonts.txt | python3 fonts.py`" \
	-o static/fonts/fonts.css

