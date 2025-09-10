# TrueLayer iOS SDK Migration Guide

- [Migrating from 3.x.x to 4.x.x](#migrating-from-3xx-to-4xx)
- [Migrating from 3.0.x to 3.1.0](#migrating-from-30x-to-301)
- [Migrating from 2.x to 3.x](#migrating-from-2x-to-3x)
- [Migrating from 1.x to 2.x](#migrating-from-1x-to-2x)
- [Migrating from beta to 2.x](#migrating-from-beta-to-2x)

## Migrating from 3.x.x to 4.x.x

For the New UI, SDK now uses a single-screen, declarative state-driven navigation system under the hood. If you previously relied on imperative navigation APIs like `push`, `pop`, and `present` to handle navigating to and from the TrueLayer SDK, please re-test your implementation.

The previously deprecated `.redirect` success case has been removed. Check that there are no compiler errors and update your implementation if needed.

## Migrating from 3.0.x to 3.1.0

Previously:

```
TrueLayer.Payments.manager.processSinglePayment(
  context: TrueLayer.Payments.Models.SinglePayment.Context(
    identifier: // Your payment ID,
    token: // Your resource token,
    redirectURL: // Your redirect URL
    preferences: // Your possible preferences like type of presentation and country code.
  )) { result in
    switch result {
      case .success(let result):
        // Handle `TrueLayer.Payments.Models.SinglePayment.State`.

      case .failure(let error):
        // Handle `TrueLayer.Payments.Models.SinglePayment.Error`.
    }
}
```

Now:

```
TrueLayer.Payments.manager.processSinglePayment(
  context: TrueLayer.Payments.Models.SinglePayment.Context(
    identifier: // Your payment ID,
    token: // Your resource token,
    redirectURL: // Your redirect URL
    preferences: // Your possible preferences like type of presentation and country code.
  )) { processResult in
    switch processResult.result {
      case .success(let success):
        // Handle `TrueLayer.Payments.Models.SinglePayment.State`.
        print(success.state)

      case .failure(let failure):
        // Handle `TrueLayer.Payments.Models.SinglePayment.Error`.
        print(failure.error)
    }
    
    // Handle `resultShown`.
    print(processResult.resultShown)
}
```

Previously:

```
TrueLayer.Payments.manager.processMandate(
  context: TrueLayer.Payments.Models.Mandate.Context(
    identifier: // Your mandate ID,
    token: // Your resource token,
    redirectURL: // Your redirect URL
    preferences: // Your possible preferences like type of presentation and country code.
  )) { result in
    switch result {
      case .success(let result):
        // Handle `TrueLayer.Payments.Models.Mandate.State`.

      case .failure(let error):
        // Handle `TrueLayer.Payments.Models.Mandate.Error`.
    }
}
```

Now:

```
TrueLayer.Payments.manager.processMandate(
  context: TrueLayer.Payments.Models.Mandate.Context(
    identifier: // Your mandate ID,
    token: // Your resource token,
    redirectURL: // Your redirect URL
    preferences: // Your possible preferences like type of presentation and country code.
  )) { processResult in
    switch processResult.result {
      case .success(let success):
        // Handle `TrueLayer.Payments.Models.Mandate.State`.
        print(success.state)

      case .failure(let failure):
        // Handle `TrueLayer.Payments.Models.Mandate.Error`.
        print(failure.error)
    }
    
    // Handle `resultShown`.
    print(processResult.resultShown)
}
```

## Migrating from 2.x to 3.x

### Configuring the SDK

Previously:

```
TrueLayer.Payments.manager.configure(environment: .sandbox)
```

Now:

```
await TrueLayer.Payments.manager.configure(environment: .sandbox)
```

### Result Screen

In the `Preferences` object, `shouldShowResultScreen` is set to `true` by default. This tells the TrueLayer SDK to display the result of a payment or mandate at the end of the authorization flow. This screen automatically refreshes until the payment is creditable, or until a maximum timeout is reached (customizable by setting `maximumResultScreenTimeout`). By default this timeout is 10 seconds, and cannot be set longer (the SDK will use 10s if you pass a greater value).

It is recommended to re-invoke `processSinglePayment` or `processMandate` once the user is re-directed from their bank back to your application. Some banks require further input from the user, which the SDK can display. If there are no further inputs required, the SDK will either return a payment result to your app (`shouldShowResultScreen` is `false`), or show a result screen (`shouldShowResultScreen` is `true`).

### Failure Reasons

There are more failure reasons to handle in 3.0.0. Please see [DOCUMENTATION](../DOCUMENTATION.md) for a list of available reasons.

## Migrating from 1.x to 2.x

Xcode will suggest changes for objects that have modified namespaces and methods. For other changes, please see the steps below.

##### Processing a Single Payment

Previously:

```
TrueLayer.Payments.manager.processPayment(
  context: TrueLayer.Payments.Models.Payment.Context(
    paymentIdentifier: // Your payment ID,
    resourceToken: // Your resource token,
    redirectURL: // Your redirect URL,
    presentationStyle: .present(on: yourViewController, style: .automatic)
  )) { result in
    switch result {
      case .success(let authorizationFlowResult):
        // Handle `AuthorizationFlowResult`. See below for the new handling logic.

      case .failure(let error):
        // Handle error. See below for the new handling logic.
    }
}
```

Now:

```
TrueLayer.Payments.manager.processSinglePayment(
  context: TrueLayer.Payments.Models.SinglePayment.Context(
    identifier: // Your payment ID,
    token: // Your resource token,
    redirectURL: // Your redirect URL,
    preferences: TrueLayer.Payments.Models.SinglePayment.Preferences(
        presentationStyle: .present(on: yourViewController, style: .automatic)
      )
  )) { result in
    switch result {
      case .success(let authorizationFlowResult):
        // Handle `TrueLayer.Payments.Models.SinglePayment.State`.

      case .failure(let error):
        // Handle `TrueLayer.Payments.Models.SinglePayment.Error`.
    }
}
```

##### Retrieving a Single Payment Status

Previously:

```
TrueLayer.Payments.manager.paymentStatus(paymentIdentifier: paymentIdentifier, resourceToken: resourceToken)
```

Now:

```
TrueLayer.Payments.manager.singlePaymentStatus(paymentIdentifier: paymentIdentifier, resourceToken: resourceToken)
```

There are also type changes, with the underlying properties remaining the same:

| Previously | Now |
| ------------- | ------------- 
| `TrueLayer.Payments.Models.Payment.Context` | `TrueLayer.Payments.Models.SinglePayment.Context`
| `TrueLayer.Payments.Models.Payment.Preferences` | `TrueLayer.Payments.Models.SinglePayment.Preferences`
| `TrueLayer.Payments.Models.Payment.Status` | `TrueLayer.Payments.Models.SinglePayment.Status`
| `TrueLayer.Payments.PaymentState` | `TrueLayer.Payments.Models.SinglePayment.State`
| `TrueLayer.Payments.Error` | `TrueLayer.Payments.Models.SinglePayment.Error`

## Migrating from beta to 2.x

### Import the TrueLayer iOS SDK

Previously:

```
import TrueLayerPaymentsSDK
```

Now:

```
import TrueLayerSDK
```

###  Configure the SDK

Previously:

```
do {
  try TrueLayerPayments.Manager.shared.start(environment: .sandbox)
} catch {
  print(error)
  fatalError()
}    
```
    
Now:

```
TrueLayer.Payments.manager.configure(environment: .sandbox)
```
### Process Payment
Previously:

```
do {
  try TrueLayerPayments.Manager.shared.processPayment(
    context: .init(
      paymentId: // Your payment ID,
      resourceToken: // Your resource token,
      endOfFlowRedirectURI: // Your redirect URL,
      presentationStyle: .present(on: self, modalPresentationStyle: .automatic)
    ),
    callback: { result in
      switch result {
      case .success(let step):
        // Handle step
        
      case .failure(let error):
        // Handle error
      }
    })
} catch {
  // Handle error
}
```

Now:

```
TrueLayer.Payments.manager.processSinglePayment(
  context: TrueLayer.Payments.Models.SinglePayment.Context(
    identifier: // Your payment ID,
    token: // Your resource token,
    redirectURL: // Your redirect URL,
    preferences: TrueLayer.Payments.Models.SinglePayment.Preferences(
        presentationStyle: .present(on: yourViewController, style: .automatic)
      )
  )) { result in
    switch result {
      case .success(let authorizationFlowResult):
        // Handle `AuthorizationFlowResult`. See below for the new handling logic.

      case .failure(let error):
        // Handle error. See below for the new handling logic.
    }
}
```

#### Preferences

The preferences object type has changed, however the implementation remains the same.

Previously:

```
TrueLayer.Payments.Models.Payment.Context(preferredCountryCode: "GB")
```

Now:

```
TrueLayer.Payments.Models.SinglePayment.Preferences(preferredCountryCode: "GB")
```


### Handling the Result
#### Success

| Previously (`PaymentProcessingStep`) | Now (`TrueLayer.Payments.Models.SinglePayment.State`) | Description |
| ------------- | ------------- | ------------- 
| `.paymentCompleted` | `.executed` | The bank confirmed the payment.
| `.authorized` | `.authorized` | The user authorized the payment with the bank.
| `.redirectedToBank` | `.redirect` | The user has been redirected to the bank to authorize the payment.
| `.providerSelected` |  | When the SDK ended with the selection of a provider. See the `Error` handling table below.
|  | `.settled` | The funds have reached the destination.


#### Error

| Previously (`TrueLayerPayments.Error`) | Now (`TrueLayer.Payments.Models.SinglePayment.Error`) | Description |
| ------------- | ------------- | ------------- 
| `.failedToStartSDK` | `.sdkNotConfigured`| The SDK `configure` method has not been called before using it.
| `.sdkAlreadyStarted` |  | When the app tries to initialize the SDK more than once. This error is no longer thrown.
| `.sdkNotStartedYet` |  | When the app tries to use the SDK before starting. This error is no longer thrown.
| `.unknown` | `.unexpectedBehaviour`| The `SDK` encountered an unexpected behavior.
| `.userAborted` | `.userCanceled` | The user canceled the payment.
| `.noInternet` | `.connectionIssues` | There was an issue while connecting to the internet. Either the user is offline, or the request timed out.
| `.communicationIssue` | `.connectionIssues` | There was an issue while connecting to the internet. Either the user is offline, or the request timed out.
| `.authorizationFailed` | `.authorizationFailed` | The authorization process failed on the user <-> bank side.
| `.paymentFailed` | `.authorizationFailed` | The authorization process failed on the user <-> bank side.
| | `.generic(reason: String)` | A unexpected error, the error will be passed as a string parameter.
| | `.invalidToken` | The token used to make the payment is not authorized to undergo such operation.
| | `.paymentExpired` | The user took too long to complete the payment, and therefore it expired.
| | `.paymentNotFound` | The requested payment was not found.
| | `.paymentRejected` | The payment was rejected by the bank.
| | `.serverError` | The server encountered an error while processing the answer.
