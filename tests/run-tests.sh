#!/usr/bin/env bash
set -uo pipefail

PASS=0
FAIL=0

for file in $(find tests -name "*.typ"); do
  expected=$(grep -m1 "// EXPECT:" "$file" | sed 's/.*EXPECT: *//')
  expected_msg=$(grep -m1 "// EXPECT-MESSAGE:" "$file" | sed 's/.*EXPECT-MESSAGE: *//' || true)

  output=$(typst compile "$file" --root . "/tmp/$(basename "$file").pdf" 2>&1)
  status=$?

  if [ "$expected" = "ok" ]; then
    if [ $status -eq 0 ]; then
      echo "PASS: $file"
      PASS=$((PASS+1))
    else
      echo "FAIL: $file (expected ok, got error)"
      echo "  -> $output"
      FAIL=$((FAIL+1))
    fi
  elif [ "$expected" = "error" ]; then
    if [ $status -ne 0 ]; then
      if [ -n "$expected_msg" ] && ! echo "$output" | grep -qF "$expected_msg"; then
        echo "FAIL: $file (error occurred but message mismatch)"
        echo "  -> expected to contain: $expected_msg"
        echo "  -> got: $output"
        FAIL=$((FAIL+1))
      else
        echo "PASS: $file"
        PASS=$((PASS+1))
      fi
    else
      echo "FAIL: $file (expected error, got ok)"
      FAIL=$((FAIL+1))
    fi
  else
    echo "SKIP: $file (no EXPECT marker)"
  fi
done

echo ""
echo "Results: $PASS passed, $FAIL failed"
[ $FAIL -eq 0 ]