#!/usr/bin/env bats

@test "ruby is correct version" {
  run ruby -v
  echo "$output" | grep 'ruby 2.0'
}
