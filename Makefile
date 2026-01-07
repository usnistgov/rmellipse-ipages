# Define variables for compiler and flags (optional but recommended)
# A phony target to clean up generated files
.PHONY: clean build

# Rule to build the object file from the source file
# Note: The command line MUST start with a physical TAB character, not spaces
build: .
	# clone rmellipse and run the multiversioned docs on stable
	# checkout the development and stable branches so local
	# copies are made for use by the documentation builder
	git clone https://github.com/usnistgov/rmellipse && \
	cd rmellipse && \
	git checkout stable && \
	git checkout development  && \
	tools/docs.sh html-multiversioned && \
	cd .. && \
	cp -R rmellipse/docs/build/* .


clean:
	# clean build files
	rm -rf ./rmellipse
	rm -rf ./stable
	rm -rf ./development
	# removes any folder with index.html in its root
	# which describes each independent version of the documentation
	rm -rf $(find . -name index.html -execdir pwd \;)
	rm index.html