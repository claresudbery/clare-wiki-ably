```make
.PHONY: ui-test-specific
ui-test-specific:
	node test/ClarevilleWebappTests/UI/configureGlobals.js host=$(UI_TEST_HOST)
	@if [[ -z "$$BUSINESS_ID" ]]; then echo "[FAIL] BUSINESS_ID not set" && exit 1; fi
	test/ClarevilleWebappTests/UI/node_modules/nightwatch/bin/nightwatch --env $(TEST_OS) --group $(BUSINESS_ID) --test test/ClarevilleWebappTests/UI/specs/stockportgov/userjourney.tests.js --testcase "$(testname)"
```