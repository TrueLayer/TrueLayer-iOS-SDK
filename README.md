# TrueLayer Payments SDK
TrueLayer's iOS SDK allows you to quickly add open banking payments to your app. The SDK integrates with TrueLayer's Payments API, making it simple to get up and running.

The SDK presents native screens that allow your users to select their bank and consent to the payment. The user is then redirected to their banking app or website to authorise the payment. It also handles the network requests and errors, and gives you options to customise the user interface.

The Android version of the SDK can be found [here](https://docs.truelayer.com/docs/android-sdk-for-payments-v3).

**Note: If you are migrating from the beta version of the iOS SDK, checkout this [Migration Guide](docs/Migration%20Guide.md).**

## Table of Contents

1. [How to Install the SDK](#how-to-install-the-sdk)
	1. [SwiftPM](#swiftpm)
2. [Setup](#setup)
	1. [Prerequisites](#prerequisites)
		1. [Setting Up Your Backend](#setting-up-your-backend) 
		2. [Minimum Xcode and iOS Versions](#minimum-xcode-and-ios-versions)
3. [How to Use the SDK](#how-to-use-the-sdk)
	1. [Starting the SDK](#starting-the-sdk)
	2. [Processing a Payment](#processing-a-payment)
	3. [Preferences](#preferences)
	4. [Styling](#styling)
1. [How to Report Issues](#how-to-report-issues)

## How to Install the SDK

### SwiftPM

To install the SDK using Swift Package Manager:

1. Open your app in Xcode.
2. In the **Project Navigator**, click on the project.
3. Click **File > Add Packages...**
4. Insert the `https://github.com/truelayer/truelayer-ios-sdk` URL in the search bar and click **Enter**.
5. Click on the **Add Package** button.
6. Follow the dialog to install the SDK.

## Setup

### Prerequisites

#### Setting Up Your Backend

- Create an account in the [TrueLayer console](https://console.truelayer.com/). 
Follow [this guide](https://docs.truelayer.com/docs/get-started-with-truelayer) to set it up correctly.

- You need a backend which is able to retrieve an access token and create a payment on behalf of the user. This is to enforce security on the client, avoiding the need to store static secrets in your app. The API documentation can be found [here](https://docs.truelayer.com/).

Finally, your app should setup a payment. Once the payment has been setup, it is possible to delegate all the remaining parts of the process to the SDK. To set up a payment, the backend should:

1. [Authenticate with TrueLayer](https://docs.truelayer.com/docs/retrieve-a-token-in-your-server-for-payments-v3).
2. [Create a Payment](https://docs.truelayer.com/docs/single-payments-for-payments-v3).
3. Return the payment identifier and the resource token to the app.

#### Minimum Xcode and iOS Versions

The iOS SDK has the following requirements:

- Xcode 13.4
- Swift 5.6
- iOS 13.0

## How to Use the SDK

### Starting the SDK
1. Import the SDK:

        import TrueLayerSDK

2. Configure the SDK with the given environment:

        TrueLayer.Payments.manager.configure(environment: .sandbox)

### Processing a Payment

Once your app has obtained the payment identifier and resource token from the backend (see [Setup](#setup)), you can use the iOS SDK to process the payment.

```
TrueLayer.Payments.manager.processPayment(
  context: TrueLayer.Payments.Models.Payment.Context(
    paymentIdentifier: // Your payment ID,
    resourceToken: // Your resource token,
    redirectURL: // Your redirect URL,
    presentationStyle: .present(on: yourViewController, style: .automatic)
  )) { result in
    switch result {
      case .success(let result):
        // Handle `TrueLayer.Payments.Result`. See below for the new handling logic.

      case .failure(let error):
        // Handle error. See below for the new handling logic.
    }
}
```

The parameters used in `TrueLayer.Payments.Models.Payment.Context` are explained below:

- `paymentIdentifier`: this is the payment identifier retrieved from your backend.
- `resourceToken`: this is the payment token retrieved from your backend.
- `redirectURL`: the destination where the user should be redirected once the authorization flow is done outside of the app (bank website, HPP). This is usually your app's redirect URI.
- `presentationStyle`: determines how the SDK should present the authorization flow. This can be either:
    - `present(on: UIViewController, style: UIModalPresentationStyle)` - modally presents the SDK in a new window.
    - `push(on: UINavigationController)` - pushes the SDK onto your `UINavigationController`.

#### Handling the Result
 
#### Success

| `TrueLayer.Payments.PaymentState` | Description |
| ------------- | ------------- 
| `.executed` | The bank confirmed the payment.
| `.authorized` | The user authorized the payment with the bank.
| `.redirect` | The user has been redirected to the bank to authorize the payment.
| `.settled` | The funds have reached the destination.
| `.wait` | The user did everything needed to do, but the merchant has to wait for the output.

#### Error

| `TrueLayer.Payments.Error` | Description |
| ------------- | -------------
| `.sdkNotConfigured`| The SDK `configure` method has not been called before using it.
| `.unexpectedBehaviour`| The `SDK` encountered an unexpected behavior.
| `.userCanceled` | The user canceled the payment.
| `.connectionIssues` | There was an issue while connecting to the internet. Either the user is offline, or the request timed out.
| `.authorizationFailed` | The authorization process failed on the user <-> bank side.
| `.generic(reason: String)` | A unexpected error, the error will be passed as a string parameter.
| `.invalidToken` | The token used to make the payment is not authorized to undergo such operation.
| `.paymentExpired` | The user took too long to complete the payment, and therefore it expired.
| `.paymentNotFound` | The requested payment was not found.
| `.paymentRejected` | The payment was rejected by the bank.
| `.serverError` | The server encountered an error while processing the answer.

### Getting a payment status

In order to get the status of a payment, the SDK offers the following method:

`func paymentStatus(paymentIdentifier:, resourceToken:) async throws -> TrueLayer.Payments.Models.Payment.Status`

This should be treated as the favorite source of truth for the status of the payment.

### Status

| `TrueLayer.Payments.Models.Payment.Status` | Description |
| ------------- | ------------- 
| `.authorizationRequired` | The payment requires authorisation.
| `.authorizing` | The user is authorizing the payment.
| `.authorized` | The payment has been authorized by the bank.
| `.executed` | The payment has been executed.
| `.settled` | The funds have reached the destination.
| `.failed` | The payment failed. This can be due to various reasons..

### Preferences

The `Context` object also takes a `preferences` parameter to allow you to customize the authentication flow. 

Currently, you can pass:

- `preferredCountryCode` - the preferred country to use when displaying the providers. If the country is invalid, or does not include any providers, the value will fallback to the user's locale.

### Styling

You can style the SDK to match your app's UI. See [Styling](docs/Styling.md).

## How to Report Issues

Please [open an issue](https://github.com/TrueLayer/truelayer-ios-sdk/issues/new) in this repository, filling the provided template. The SDK is worked on a private repository in tandem, and issues will be resolved there.

