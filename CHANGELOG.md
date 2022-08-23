# Changelog
All notable changes to this project will be documented in this file. To know better on how to write and maintain a changelog, refer to [this link](https://keepachangelog.com/en/1.0.0/).

## [1.1.0] - IBAN

This new release focuses on polishing what was built with `1.0.0`, and fixing minor visual bugs specifically in the country selection. In addition it introduces support for 2 new features: cancel payment, and IBAN additional input.

ATTENTION: This minor update contains necessary breaking fixes. However, we opted for a minor change because those breaking changes are rather irrelevant and should not impact already integrated SDKs.

### Added

- Support for [cancel payment](https://docs.truelayer.com/reference/cancel-payment). When the user dismisses the payment, an API call is made to cancel it on the backend as well.
- Support for IBAN input required by some banks.

### Fixed

- Fix country picker not automatically showing in providers list when no country is selected.
- Fix country picker not displaying which country is selected.
- Fix countries not displayed in alphabetical order in country picker.
- Fix remote image cropped out randomly on certain OS versions.
- Fix tableviews displaying empty rows in prior to iOS 15.
- [BREAKING] Fix the order of parameters in `configure` making `environment` first, followed by `visualSettings`.
- [BREAKING] Fix the type of completion from `AuthorizationFlowResult` to `Result<PaymentState, Error>` since the former referenced `TrueLayerUI` which should not be used by the merchant.
- Fix parsing of the `status: failed` response expected from authorization flow related network calls, and return the correct error to the merchant.
- Fix recently used providers showing all providers regardless of the selected country.

## [1.0.0] - Rebirth

### Added

- Possibility to process a one time payment using a user selected provider.
- Possibility to process a one time payment with a pre-selected provider.
- Possibility to customize the UI colors.
- Support for the following languages:
  - Dutch
  - English
  - Finnish
  - French
  - German
  - Italian
  - Polish
  - Portuguese
  - Spanish
