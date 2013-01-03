#!/bin/bash

test_count=0

for input_path in $(git ls-files "t/*.input")
do
  test_count=$((test_count + 1))

  filename="${input_path#t/}"
  basename="${filename%.input}"
  output_path="t/,$basename.output"
  expected_path="t/$basename.expected"
  diff_path="t/,$basename.diff"
  ( source "$input_path" &>"$output_path"; )
  diff -u "$expected_path" "$output_path" >"$diff_path"
  result=$?

  if [ $result = 0 ]
  then
    message='ok'
  else
    message='not ok'
  fi

  echo "$message $test_count - $basename"
  if [ $result != 0 ]
  then
    sed 's/^/# /' "$diff_path"
  fi
done

echo "1..$test_count"

# vim: filetype=sh
