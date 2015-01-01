
all: test


test:
	xcodebuild -scheme SwiftEither test

.PHONY: all test
