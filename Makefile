MVN_FLAGS=--global-toolchains `pwd`/toolchains.xml
MVN=mvn $(MVN_FLAGS)

.PHONY: default
default: package

.PHONY: package
package:
	$(MVN) package

.PHONY: compile
compile:
	$(MVN) compile

.PHONY: test
test:
	$(MVN) test

.PHONY: clean
clean:
	$(MVN) clean

.PHONY: clean-jar
clean-jar:
	rm -f tjc.jar tjcsrc.jar jtcl-?.?.?.jar
