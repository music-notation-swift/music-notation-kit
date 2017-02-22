#!/bin/bash

PATH=Bin/:$PATH

Bin/protoc --swift_out=Sources/MusicNotationKit/ --proto_path=Proto/ Proto/*.proto