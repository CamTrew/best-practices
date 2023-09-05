STITCHMD := $(stitchmd)
install:
	go install go.abhg.dev/stitchmd@latest

build:
	stitchmd -o README.md md/SUMMARY.md
