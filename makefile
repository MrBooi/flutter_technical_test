
clean: ## Cleans the environment
	rm -rf pubspec.lock
	flutter clean

format: ## Formats the code
	dart format .

lint: ## Lints the code
	dart analyze .

#analyze entails linting
flutter_analyze:
	flutter analyze --no-fatal-infos --no-fatal-warnings

get_pub: clean ## Getting pubspec dependencies
	flutter pub get

flutter_test:  ## Runs unit tests
	flutter test test 

run_mobile: ## Runs the mobile application in dev
	flutter run



flutter_cov_report: # Run test and see code coverage
	flutter test --coverage
	genhtml coverage/lcov.info -o coverage/html
	open coverage/html/index.html

