.PHONY: cover

BIN_PATH:=node_modules/.bin/

all:	bitcore-wallet-client-hush.min.js

clean:
	rm bitcore-wallet-client-hush.js
	rm bitcore-wallet-client-hush.min.js

bitcore-wallet-client-hush.js: index.js lib/*.js
	${BIN_PATH}browserify $< > $@

bitcore-wallet-client-hush.min.js: bitcore-wallet-client-hush.js
	uglifyjs   $<  -o $@

cover:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha -- --reporter spec test
