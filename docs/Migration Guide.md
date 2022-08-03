# TrueLayer iOS SDK Migration Guide

This guide explains how to migrate from version 1.x.x of the iOS SDK to version 2.0.0.

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

#### Preferences

The preferences object type has changed, however the implementation remains the same.

Previously:

```
TrueLayer.Payments.Models.Payment.Context(preferredCountryCode: "GB")
```

Now:

```
TrueLayer.Payments.Models.Payment.Preferences(preferredCountryCode: "GB")
```


### Handling the Result
#### Success

| Previously (`PaymentProcessingStep`) | Now (`Payment.State`) | Description |
| ------------- | ------------- | ------------- 
| `.paymentCompleted` | `.executed` | The bank confirmed the payment.
| `.authorized` | `.authorized` | The user authorized the payment with the bank.
| `.redirectedToBank` | `.redirect` | The user has been redirected to the bank to authorize the payment.
| `.providerSelected` |  | When the SDK ended with the selection of a provider. See the `Error` handling table below.
|  | `.settled` | The funds have reached the destination.


#### Error

| Previously (`TrueLayerPayments.Error`) | Now (`TrueLayerError`) | Description |
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