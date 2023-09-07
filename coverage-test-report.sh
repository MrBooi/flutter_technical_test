run_coverage() {
  genhtml -o coverage coverage/lcov.info -q
}

if make flutter_coverage; then
  run_coverage true
else
  run_coverage false
  exit 1
fi