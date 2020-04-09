#!/bin/bash
test_command="$@"
$test_command && git commit -am "WIP" || git checkout -- .
