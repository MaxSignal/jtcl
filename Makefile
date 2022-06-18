MVN_FLAGS=--global-toolchains `pwd`/toolchains.xml
MVN=mvn $(MVN_FLAGS)

.PHONY: default
default: help

help:
	@echo "make package: build the package"
	@echo "make package-skip-tests: build the package after skipping the tests"
	@echo "make compile: compile the classes"
	@echo "make test: run the tests"
	@echo "make clean: clean the build artifacts"
	@echo "make clean-jar: delete the generated jars"

.PHONY: package
package:
	$(MVN) package

.PHONY: package-skip-tests
package-skip-tests:
	$(MVN) -DskipTests package

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
