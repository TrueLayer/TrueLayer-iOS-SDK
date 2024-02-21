# Changelog
All notable changes to this project will be documented in this file. To know better on how to write and maintain a changelog, refer to [this link](https://keepachangelog.com/en/1.0.0/).

## [3.0.0] - Horizon

### Added
- `shouldShowResultScreen` to `SinglePayment` and `Mandate` `Preferences` objects (default value is `true`). When this is enabled, a result screen is displayed at the end of the payment flow. When the user is redirected back from the bank, it is recommended to re-invoke the TrueLayer SDK to display the result screen, to show the user the status of their payment or mandate.
- `maximumResultScreenTimeout` to `SinglePayment` and `Mandate` `Preferences` objects. This is the maximum timeout for the payment or mandate result screen, until a final status. Once reached, the user is shown a button to dismiss the SDK and return to your app.
- Italian localisations for text displayed to the user.

### Changed
- Updated `TrueLayer.Payments.Models.Mandate.Error` and `TrueLayer.Payments.Models.SinglePayment.Error` cases. These more accurately match errors received from the TrueLayer Payments API V3.
- Merchant logo now appears on the right on the consent screen.

### Removed

- `useCase` from `TrueLayer.Payments.Models.SinglePayment.Preferences`. To enable Signup+ for a payment, refer to the API documentation when creating a payment.

## [2.7.1] - Tusk

### Fixed

- Removed requirement for thread locking to prevent possible crashes related to a semaphore not releasing in time during de-initialisation.
- Fixed some screens being retained after the payment processing is completed.

## [2.7.0] - Aurora

### Added

- Saved accounts selection and removal, for future users who decide to save their account with TrueLayer.
- Recently used providers are combined into the same section as other providers on the provider selection list.
- Possibility for the user to select the SEPA scheme when applicable. To enable it set `scheme_selection` is set to `user_selected` when creating the payment. Please refer to the [Create Payment](https://docs.truelayer.com/reference/create-payment) documentation for more information.
- Refinements to the user interface design.

## [2.6.0] - Rocky

### Added

- Better branch selection. If a user looks for a branch now in the provider screen he will be able to select it, and not have to input it again where additional inputs are required.
- Provider offline detection for pre-selected providers.

### Fixed

- Loader not showing when making certain network calls.

## [2.5.0] - Apollo

### Added

- A new screen for selected banks in France and Finland primes new users on how to enable international payments from their bank, when the payment is being sent internationally
- Providers are now sorted by market share on the provider selection screen.
- Providers now show when their connection is offline before the user selects them.
- New error cases:
  - `invalidRedirectURI` error case to `TrueLayer.Payments.Models.Mandate.Error` and `TrueLayer.Payments.Models.SinglePayment.Error`.
  - `providerOffline` error case to `TrueLayer.Payments.Models.Mandate.Error` and `TrueLayer.Payments.Models.SinglePayment.Error`. It will be thrown only if the provider is pre-selected.
- PISP license holders who are processing payments under their certificates can now choose to remove TrueLayer branding from the user interface. Contact us to enquire about enabling this feature.

## [2.4.0] - Signup+

### Added

- Support for Signup+ transactions via a new parameter `useCase` in the `TrueLayer.Payments.Models.SinglePayment.Preferences` initializer.

### Fixed

- A UI bug that prevented the users to use the SDK when accessibility was set > AX3.
- General minor UI fixes.

## [2.3.0] - DEUTSCHLAND

### Added

- General enhancements aiming to increase conversion in Germany based on collected data.
- IBAN validation on device to reduce possibility of encountering an error when an IBAN is inserted.
- Automatic retries on 500 errors to reduce the possibility of failure should the server recover.
- Support for search using alternative search terms (like BLZ with German banks) to make it easier for users to find their banks.
- A recurring payment displays the merchant's sort code and account number where applicable.
- Support for customising the SDK from the `ObjectiveC` layer.

### Fixed

- SDK animation when processing a payment between initial `UIActivityViewController` and first `SDK` screen.

## [2.2.0] - Old School II

### Added

- Added support for `Objective-C` via `Swift Package Manager`.

## [2.1.0] - Old School

### Added

- Added support for `Objective-C` via `Cocoapods`. 

## [2.0.0] - Boomerang

### Added

- Added `processMandate(context:then:)` to process a new payment mandate in the United Kingdom.
- Added `mandateStatus(mandateIdentifier:resourceToken:)` to retrieve the status of recurring payment mandate.

### Removed

- Removed the `push` presentation style as `present` was overwhelmingly the most used by users and it provided a far better animation.

### Changed

- All public APIs in frameworks other than TrueLayerSDK are now @_spi protected as they should not be used and can change without prior notice.
- Renamed `processPayment(context:then:)` to `processSinglePayment(context:then:)`.
- Renamed `paymentStatus(paymentIdentifier:resourceToken:)` to `singlePaymentStatus(paymentIdentifier:resourceToken:)`.
- Renamed `Context(paymentIdentifier:resourceToken:redirectURL:presentationStyle:)` to `Context(identifier:token:redirectURL:preferences:)`.
- Moved `presentationStyle` under the `Preferences` object.
- Changed `TrueLayer.Payments.Models.Payment.Context`, `TrueLayer.Payments.Models.Payment.Preferences`, and `TrueLayer.Payments.Models.Payment.Status` to  `SinglePayment` namespace.
- Changed `TrueLayer.Payments.PaymentState` to `TrueLayer.Payments.Models.SinglePayment.State`.
- Changed `TrueLayer.Payments.Error` to `TrueLayer.Payments.Models.SinglePayment.Error`.

## [1.4.2] - Mantis

### Fixed

- Fixed a crash when selecting a country on iOS 15.0
- Fixed a bug where the search result would not dismiss after selecting a country.

## [1.4.1] - Cricket

### Fixed

- Fixed the completion not invoked when the SDK is pushed.

## [1.4.0] - Sébastien

### Added

- Support to fetch the status of a payment given its identifier and resource token.
- Support for persisting previously selected options in a long list under additional inputs, and recommending it for returning users.

### Fixed

- Fix navigation bar background color for iOS 15+.

## [1.3.0] - Red light, green light

### Added

- Support for OTP validation via PhotoTan and SMS.
- Added a padlock symbol on additional inputs Continue button when there is a sensitive text field.
- Added new localized title and button text for the Review Payment screen, which changes depending if the next step are additional inputs or a redirect to bank.
- [BREAKING] Support for `wait` action. The user will see a screen `wait` screen while the `SDK` polls for an updated payment status. If the polling takes too long, the SDK will now return a `wait` action in the success phase.

### Fixed

- Fix consent screen beneficiary text not word wrapping when using large accessibility text sizes.

## [1.2.0] - Branches

### Added

- Added logic to make sure the `IBAN` additional input is displayed on its own screen.
- Added auto-capitalization for the `IBAN` additional input.
- Added support for additional inputs of `select` type. Example branch selection.

### Fixed

- Fix `continue` button being enabled on additional inputs even when text fields not valid. 
- Fix behavior of textfields to automatically limit the character count of a textfield based on its type.
- Fix keyboard type to match the type of the textfield.
- Fix callback not being invoked when dismissing a modal SDK on a navigation controller.
- Fix beneficiary name not showing on consent screen.

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
- Fix tableviews displaying empty rows in versions prior to iOS 15.
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
