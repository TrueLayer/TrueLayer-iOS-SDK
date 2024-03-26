# TrueLayer Payments SDK
TrueLayer's iOS SDK allows you to quickly add open banking payments to your app. The SDK integrates with TrueLayer's Payments API, making it simple to get up and running.

The SDK presents native screens that allow your users to select their bank and consent to the payment. The user is then redirected to their banking app or website to authorise the payment. It also handles the network requests and errors, and gives you options to customise the user interface.

The Android version of the SDK can be found [here](https://docs.truelayer.com/docs/android-sdk-for-payments-v3).

**Note: If you are migrating from the beta version of the iOS SDK, checkout this [Migration Guide](docs/MIGRATION%20GUIDE.md).**

## Table of Contents

1. [How to Install the SDK](#how-to-install-the-sdk)
	1. [SwiftPM](#swiftpm)
	2. [Cocoapods](#cocoapods) 
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

### CocoaPods

 To install the SDK via Cocoapods, specify `TrueLayerPaymentsSDK` in your Podfile:

```
pod 'TrueLayerPaymentsSDK'
```

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

- Xcode 14.x
- Swift 5.7
- iOS 14.0

## How to Use the SDK

1. Import the SDK:

        import TrueLayerSDK

2. Configure the SDK with the given environment:

        Task {
          TrueLayer.Payments.manager.configure(environment: .sandbox)
        }

3. Checkout [Documentation](docs/DOCUMENTATION.md)

### Styling

You can style the SDK to match your app's UI. See [Styling](docs/STYLING.md).
