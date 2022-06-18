MVN_FLAGS=--global-toolchains `pwd`/toolchains.xml
MVN=mvn $(MVN_FLAGS)

.PHONY: default
default:
	$(MVN) compile

.PHONY: package
package:
	$(MVN) package

.PHONY: test
test:
	$(MVN) test

.PHONY: clean
clean:
	$(MVN) clean

