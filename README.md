# Truelayer Payments SDK
Welcome to the **Truelayer Payments SDK**.

This is the iOS version of the SDK that allows the integration of iOS apps with the Truelayer Payment System.  
Thanks to the **Truelayer Payment SDK** it's possible to process a payment using the latest [Open Banking technology](https://truelayer.com/openbanking), choose which bank to use to carry out the payment, and pay. Everything with the utmost security and following the latest Open Banking standards. 

The Android version of the SDK can be found [here]().

## Table of Contents

1. [How to install the SDK](#how-to-install-the-sdk)
	1. [Manual Installation](#manual-installation)
	1. [SwiftPM](#swiftpm)
		1. [Xcode 12](#xcode-12)
		1. [Xcode 13](#xcode-13)
	1. [Cocoapods](#cocoapods)
1. [Setup](#setup)
1. [How To Use The SDK](#how-to-use-the-sdk)
	1. [Starting the SDK](#starting-the-sdk)
	1. [Processing the payments](#processing-the-payments)
1. [How to Report Issues](#how-to-report-issues)

## How to install the SDK

The SDK is released as a compiled binary in the form of an `XCFramework` artifact.

There are three way in which it can be installed: manually, using Swift Package Manager (SwiftPM) or using Cocoapods

### Manual Installation

To install the SDK manually, follow these steps:

1. Download the XCFramework at [this link](https://github.com/TrueLayer/truelayer-ios-sdk/releases/download/v1.0.0-private-beta/TruelayerPaymentsSdk.xcframework.zip)
1. Unzip the archive
1. Open your app in Xcode
1. Select your project file
1. In the Target Pane select your app
1. In the General tab, scroll down until you find the **Frameworks, Libraries, and Embedded Content** section
1. Drag and drop the TruelayerPayments framework
1. Make sure that the **Embed** option is set to **Embed and Sign**

### SwiftPM

To install the SDK using the SwiftPM, follow these steps:

#### Xcode 12

1. Open your app in Xcode
1. Click on **File > Swift Packages > Add Package Dependencies...**
1. Insert the `https://github.com/Truelayer/truelayer-ios-sdk` url in the search bar and press **Enter**
1. Follow the Xcode's dialog to install the SDK

#### Xcode 13

1. Open your app in Xcode
1. In the **Project Navigator**, click on the project
1. in the Project panel, click on the project
1. Go to the **Package Dependencies** tab
1. Click on the `+` button
1. Insert the `https://github.com/Truelayer/truelayer-ios-sdk` url in the search bar and press **Enter**
1. Click on the `Add Package` button
1. Follow the Xcode's dialog to install the SDK

### Cocoapods

1. Open your Podfile
1. Add the line `pod 'TruelayerPayments', '~> 1.0.0'` with all your other pods


## Setup
The first step to start using the SDK, is to create an account in the [Truelayer console](https://console.truelayer.com/).
Follow [this guide]() to set it up correctly.

Secondly, you need a backend which is able to retrieve an access token and actually create a payment on behalf of the client. This step has been though like this to enforce security on the client, avoiding completely the need to store static secrets in your app.
If you need help or inspiration, you can check our [mobile example backend](https://github.com/TrueLayer/example-mobile-backend). The API documentation can be found [here](https://docs.truelayer.com/#payments-api-v2).

Finally, your app should setup a payment. Once the payment has been setup, its possible to delegate all the remaining parts of the process to the SDK. To setup a payment, the backend should:

1. Authenticate with Truelayer, following [this documentation](https://docs.truelayer.com/#authentication113)
2. Create a Payment using [this documentation](https://docs.truelayer.com/#single-immediate-payment114)
3. Return the payment identifier and the resource token to the app 

## How To Use The SDK

The SDK has a very slim interface, with only two methods: `start()` and `processPayments()`. 

The complete documentation can be found [here](https://truelayer.github.io/truelayer-ios-sdk).

### Starting the SDK

The interface that exposes all the functions is the `TruelayerPaymentsManager` protocol. You can obtain a reference to an instance that implements the protocol by using the `TruelayerPayments.Manager.shared` instance.

The first step that is required to use the SDK is to invoke its `start()`() method. The method accepts two parameters:

* an environment, which can be `.production` or `.sandbox`. The environment determines which Truelayer backends your app will use to process the payment.
* [Optional] a `UIStyle` object. This can be used to give a unique look at the payment experience in your app, matching your app main colours, for example. If not provided, the app will use system colours. More information about styling the app can be found [here](https://truelayer.github.io/truelayer-ios-sdk/Protocols/TLPUICoordinatorType.html#/s:17TruelayerPayments20TLPUICoordinatorTypeP9viewStyleAA10TLPUIStyleCvp)

We strongly suggests to initialize the SDK as soon as possible, within you `AppDelegate`, `SceneDelegate` or any container for your dependencies. The following example shows how this can be done using the `SceneDelegate`:

```swift
import TruelayerPaymentsSdk

class SceneDelegate: UIResponder, UIWindowSceneDelegate {


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }

        do {
            try TruelayerPayments.Manager.shared.start(environment: .production)
        } catch {
            // Handle the TruelayerPayments.Error
        }
    }

    // Other UIWindowSceneDelegate method implementation
}
```

As you can see, the `start()` method may throw a [TruelayerPayments.Error]() if something goes wrong with the initialization.

### Processing the payments 

Once your app has obtained the payment id and the resource token from the backend (see the [setup](#setup) section of the README to learn how), it can use the **TruelayerPayments SDK** to process the payment.

This is as simple as invoking the [`processPayment`]() passing a properly populated [`PaymentContext`]() object.

The SDK requires both the `paymentId` and the `resourceToken` to process the payment. Furthermore, you can specify how the SDK should presents its `ViewControllers`, using the [`presentationStyle`]() property.

Finally, the `processPayment` method can receive a callback that the SDK uses to return a success, if everything went well, or a failure, in case something went wrong.

An exmple on how to process a payment is the following:

```swift
import TruelayerPaymentsSdk

class ProductViewController: UIViewController {

	func processPayment() {
		// this function will invoke the backend to authenticate the app and create the payment in the truelayer backend
		createPayment(for: product) { [weak self] payment in

			let paymentId = payment.id
			let resourceToken = payment.resourceToken

			do {
				try TruelayerPayments.Manager.shared.processPayment(
					context: .init(
						paymentId: paymentId,
						resourceToken: resourceToken,
						presentationStyle: .present(on: self)
					),
					callback: self?.handlePayment
				)
			} catch {
				// Handle processPayment errors
			}
		}
	}

	func handlePayment(result: Result<TruelayerPayments.Model.PaymentProcessingStep, TruelayerPayments.Error>) {
		// handle the result
	}
}

```

## How to Report Issues

Are you using the TruelayerPayments SDK and you found a bug?

Please, [open an issue](https://github.com/TrueLayer/truelayer-ios-sdk/issues/new) in this repository, filling the provided template.

