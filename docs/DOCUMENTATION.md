# DOCUMENTATION

This a high level documentation on how to use the `TrueLayerPaymentsSDK`.


Once your app has obtained the payment (or mandate) identifier and resource token from the backend (see [Setup](README.md)), you can use the iOS SDK to process the payment.

## Single Payment

### Processing a Single Payment

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

The parameters used in `TrueLayer.Payments.Models.SinglePayment.Context` are explained below:

- `identifier`: the payment identifier retrieved from your backend.
- `token`: the payment token retrieved from your backend.
- `redirectURL`: the destination where the user should be redirected once the authorization flow is done outside of the app (bank website, HPP). This is usually your app's redirect URI.
- `preferences` parameter to allow you to customize the authentication flow. Precisely:
  - `presentationStyle`: determines how the SDK should be presented.
  - `preferredCountryCode`: the preferred country to use when displaying the providers. If the country is invalid, or does not include any providers, the value will fallback to the user's locale.

### Handling the Result
 
#### Success

| `TrueLayer.Payments.Models.SinglePayment.State` | Description |
| ------------- | ------------- 
| `.executed` | The bank confirmed the payment.
| `.authorized` | The user authorized the payment with the bank.
| `.redirect` | The user has been redirected to the bank to authorize the payment.
| `.settled` | The funds have reached the destination.
| `.wait` | The SDK flow is complete, but a decoupled authorisation action is still pending with the user and/or the bank.

#### Error

| `TrueLayer.Payments.Models.SinglePayment.Error` | Description |
| ------------- | -------------
| `.authorizationFailed` | The authorization process failed on the user <-> bank side.
| `.connectionIssues` | There was an issue while connecting to the internet. Either the user is offline, or the request timed out.
| `.generic(reason: String)` | A unexpected error, the error will be passed as a string parameter.
| `.invalidToken` | The token used to make the payment is not authorized to undergo such operation.
| `.paymentExpired` | The user took too long to complete the payment, and therefore it expired.
| `.paymentNotFound` | The requested payment was not found.
| `.paymentRejected` | The payment was rejected by the bank.
| `.sdkNotConfigured`| The SDK `configure` method has not been called before using it.
| `.serverError` | The server encountered an error while processing the answer.
| `.unexpectedBehaviour`| The `SDK` encountered an unexpected behavior.
| `.userCanceled` | The user canceled the payment.

### Getting Payment Status

In order to get the status of a payment, the SDK offers the following method:

`func paymentStatus(paymentIdentifier:, resourceToken:) async throws -> TrueLayer.Payments.Models.SinglePayment.Status`

This should be treated as the favorite source of truth for the status of the payment.

#### Status

| `TrueLayer.Payments.Models.SinglePayment.Status` | Description |
| ------------- | ------------- 
| `.authorizationRequired` | The payment requires authorisation.
| `.authorizing` | The user is authorizing the payment.
| `.authorized` | The payment has been authorized by the bank.
| `.executed` | The payment has been executed.
| `.settled` | The funds have reached the destination.
| `.failed` | The payment failed. This can be due to various reasons.


## Mandate

### Processing a Mandate

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

The parameters used in `TrueLayer.Payments.Models.Mandate.Context` are explained below:

- `identifier`: the mandate identifier retrieved from your backend.
- `resourceToken`: the mandate token retrieved from your backend.
- `redirectURL`: the destination where the user should be redirected once the authorization flow is done outside of the app (bank website, HPP). This is usually your app's redirect URI.
- `preferences` parameter to allow you to customize the authentication flow. Precisely:
  - `presentationStyle`: determines how the SDK should be presented.
  - `preferredCountryCode` - the preferred country to use when displaying the providers. If the country is invalid, or does not include any providers, the value will fallback to the user's locale.

### Handling the Result
 
#### Success

| `TrueLayer.Payments.Models.Mandate.State` | Description |
| ------------- | ------------- 
| `.authorized` | The user authorized the mandate with the bank.
| `.redirect` | The user has been redirected to the bank to authorize the mandate.

#### Error

| `TrueLayer.Payments.Models.Mandate.Error` | Description |
| ------------- | -------------
| `.authorizationFailed` | The authorization process failed on the user <-> bank side.
| `.connectionIssues` | There was an issue while connecting to the internet. Either the user is offline, or the request timed out.
| `.generic(reason: String)` | A unexpected error, the error will be passed as a string parameter.
| `.invalidToken` | The token used to make the mandate is not authorized to undergo such operation.
| `.mandateExpired` | The user took too long to complete the mandate, and therefore it expired.
| `.mandateNotFound` | The requested mandate was not found.
| `.mandateRejected` | The mandate was rejected by the bank.
| `.sdkNotConfigured`| The SDK `configure` method has not been called before using it.
| `.serverError` | The server encountered an error while processing the answer.
| `.unexpectedBehaviour`| The `SDK` encountered an unexpected behavior.
| `.userCanceled` | The user canceled the mandate.

### Getting Mandate Status

In order to get the status of a mandate, the SDK offers the following method:

`func mandateStatus(mandateIdentifier:, resourceToken:) async throws -> TrueLayer.Payments.Models.Mandate.Status`

This should be treated as the favorite source of truth for the status of the mandate.

#### Status

| `TrueLayer.Payments.Models.PayMandatement.Status` | Description |
| ------------- | ------------- 
| `.authorizationRequired` | The mandate requires authorisation.
| `.authorizing` | The user is authorizing the mandate.
| `.authorized` | The user has authorized the mandate with their bank.
| `.revoked` | The mandate has been revoked and is no longer valid.
| `.failed` | The mandate failed. https://docs.truelayer.com/docs/mandate-statuses#more-about-failed-mandates
