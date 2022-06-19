MVN_FLAGS=--global-toolchains `pwd`/toolchains.xml
MVN=mvn $(MVN_FLAGS)

# read the version dynamically from maven-build.properties (requires sed)
JTCL_VERSION=$(shell sed -ne 's/project.version=\(.*\)/\1/p' maven-build.properties)
JTCL_JAR=target/jtcl-$(JTCL_VERSION).jar
JTCL_GROUPID=com.github.fabriceducos
JTCL_ARTIFACTID=jtcl

.PHONY: default
default: help

help:
	@echo "make package: build the package"
	@echo "make package-skip-tests: build the package after skipping the tests (not recommended in normal circumstances)"
	@echo "make compile: compile the classes"
	@echo "make test: run the tests"
	@echo "make maven-install: install the jar in the local maven repository"
	@echo "make clean: clean the build artifacts"
	@echo "make clean-jar: delete the generated jars"
	@echo
	@echo "JTCL_VERSION: $(JTCL_VERSION)"
	@echo "JTCL_JAR: $(JTCL_JAR)"

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

.PHONY: maven-install
maven-install:
	$(MVN) install:install-file -Dfile=$(JTCL_JAR) -DgroupId=$(JTCL_GROUPID) -DartifactId=$(JTCL_ARTIFACTID) -Dversion=$(JTCL_VERSION) -Dpackaging=jar


.PHONY: clean
clean:
	$(MVN) clean

.PHONY: clean-jar
clean-jar:
	rm -f tjc.jar tjcsrc.jar $(JTCL_JAR)
