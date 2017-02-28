#!/bin/bash

PATH=Bin/:$PATH

Bin/protoc --swift_out=Sources/MusicNotationKit/GeneratedModels --proto_path=Proto/ Proto/*.proto
swift package generate-xcodeproj