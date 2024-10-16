# DOCUMENTATION

This a high level documentation on how to use the `TrueLayerPaymentsSDK`.

Once your app has obtained the payment (or mandate) identifier and resource token from the backend (see [Setup](../README.md)), you can use the iOS SDK to process the payment.

## Single Payment

### Processing a Single Payment

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

The parameters used in `TrueLayer.Payments.Models.SinglePayment.Context` are explained below:

- `identifier`: the payment identifier retrieved from your backend.
- `token`: the payment token retrieved from your backend.
- `redirectURL`: the destination where the user should be redirected once the authorization flow is done outside of the app (bank website, HPP). This is usually your app's redirect URI.
- `preferences` parameter to allow you to customize the authentication flow. Precisely:
  - `presentationStyle`: determines how the SDK should be presented.
  - `preferredCountryCode`: the preferred country to use when displaying the providers. If the country is invalid, or does not include any providers, the value will fallback to the user's locale.
  - `shouldShowResultScreen`: whether the TrueLayer SDK should show the payment result screen (see #showing-a-result-screen).
  - `maximumResultScreenTimeout`: the maximum timeout for refreshing the payment result screen (see #showing-a-result-screen).
  
When the user is redirected back to your app from their bank app or website, it is recommend to re-invoke `processSinglePayment(...)` with the same `Context`. This is because some banks require further input from the user, which the SDK can present.

### Handling the Result
 
#### Success

| `TrueLayer.Payments.Models.SinglePayment.State` | Description |
| ------------- | ------------- 
| `.executed` | The bank confirmed the payment.
| `.authorized` | The user authorized the payment with the bank.
| `.redirect` | (Deprecated) The user has been redirected to the bank to authorize the payment.
| `.settled` | The funds have reached the destination.
| `.wait` | The SDK flow is complete, but a decoupled authorisation action is still pending with the user and/or the bank.

#### Error

| `TrueLayer.Payments.Models.SinglePayment.Error` | Description |
| ------------- | -------------
| `.authorizationFailed` | The authorization process failed on the user <-> bank side.  
| `.connectionIssues` | There was an issue while connecting to the internet.  
| `.generic` | A unexpected error, the error will be passed as a `String` parameter.  
| `.invalidToken` | The token used to make the payment is not authorized to undergo such operation.  
| `.invalidRedirectURI` | The redirect URI passed to the SDK is invalid.  
| `.paymentExpired` | The user took too long to complete the payment, and therefore it expired.  
| `.paymentNotFound` | The requested payment was not found. 
| `.paymentRejected` | The payment was rejected by the bank.   
| `.providerOffline` | The pre-selected provider was offline.   
| `.sdkNotConfigured` | The `SDK` `configure` method has not been called before using it.   
| `.serverError` | The server encountered an error while processing the answer.   
| `.blocked` | The payment has been blocked due to a regulatory requirement. This may happen if the PSU fails a sanctions check.   
| `.invalidAccountDetails` | The payment failed because either the creditor's or debtor's account details were invalid.   
| `.invalidAccountHolderName` | The payment failed because the account holder's name details were invalid.   
| `.invalidCredentials` | The banking credentials provided by the PSU to log into their bank were incorrect.   
| `.invalidRemitterAccount` | The account details of the remitter bank account provided during the payment flow were incorrect.   
| `.invalidRequest` | The payment failed due to invalid data in the request.   
| `.invalidSortCode` | The payment failed due to an invalid sort code being provided.   
| `.insufficientFunds` | The PSU did not have the required balance in their account to complete this payment.   
| `.notAuthorized` | The PSU cancelled the payment or wasn't able to successfully authenticate on the provider's UI.   
| `.paymentLimitExceeded` | The PSU's payment limit amount with their bank was breached.   
| `.providerError` | The provider has unexpectedly failed when creating the payment.   
| `.providerExpired` | The payment failed because the token or exchange code used to communicate with the bank expired.   
| `.providerRejected` | The provider rejected the payment.   
| `.unknownError` | The payment failed for an unknown reason on the server side.   
| `.userCanceledAtProvider` | The payment failed because the user cancelled the authorisation during the payment flow.   
| `.unexpectedBehavior` | The `SDK` encountered an unexpected behavior.   
| `.userCanceled` | The user canceled the payment.

### Getting Payment Status

In order to get the status of a payment, the SDK offers the following method:

`func paymentStatus(paymentIdentifier:, resourceToken:) async throws -> TrueLayer.Payments.Models.SinglePayment.Status`

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

The parameters used in `TrueLayer.Payments.Models.Mandate.Context` are explained below:

- `identifier`: the mandate identifier retrieved from your backend.
- `token`: the mandate token retrieved from your backend.
- `redirectURL`: the destination where the user should be redirected once the authorization flow is done outside of the app (bank website, HPP). This is usually your app's redirect URI.
- `preferences` parameter to allow you to customize the authentication flow. Precisely:
  - `presentationStyle`: determines how the SDK should be presented.
  - `preferredCountryCode` - the preferred country to use when displaying the providers. If the country is invalid, or does not include any providers, the value will fallback to the user's locale.
    - `shouldShowResultScreen`: whether the TrueLayer SDK should show the payment result screen (see #showing-a-result-screen).
  - `maximumResultScreenTimeout`: the maximum timeout for refreshing the payment result screen (see #showing-a-result-screen).

### Handling the Result
 
#### Success

| `TrueLayer.Payments.Models.Mandate.State` | Description |
| ------------- | ------------- 
| `.authorized` | The user authorized the mandate with the bank.
| `.redirect` | (Deprecated) The user has been redirected to the bank to authorize the mandate.

#### Error

| `TrueLayer.Payments.Models.Mandate.Error` | Description |
| ------------- | -------------
| `.authorizationFailed` | The authorization process failed on the user <-> bank side.
| `.connectionIssues` | There was an issue while connecting to the internet.
| `.generic` | A unexpected error, the error will be passed as a `String` parameter.
| `.invalidToken` | The token used to make the mandate is not authorized to undergo such operation.
| `.invalidRedirectURI` | The redirect URI passed to the SDK is invalid.
| `.mandateExpired` | The mandate expired.
| `.mandateNotFound` | The requested mandate was not found.
| `.mandateRejected` | The mandate was rejected by the bank.
| `.providerOffline` | The pre-selected provider was offline.
| `.revoked` | The mandate has been revoked and is no longer valid.
| `.sdkNotConfigured` | The SDK `configure` method has not been called before using it.
| `.serverError` | The server encountered an error while processing the answer.
| `.providerError` | The provider has unexpectedly failed when creating the mandate.
| `.providerRejected` | The provider rejected the mandate.
| `.invalidRequest` | The mandate failed due to invalid data in the request.
| `.invalidSortCode` | The mandate failed due to an invalid sort code being provided.
| `.unknownError` | The mandate failed for an unknown reason.
| `.unexpectedBehavior` | The SDK encountered an unexpected behaviour.
| `.userCanceled` | The user canceled the mandate.

### Getting Mandate Status

In order to get the status of a mandate, the SDK offers the following method:

`func mandateStatus(mandateIdentifier:, resourceToken:) async throws -> TrueLayer.Payments.Models.Mandate.Status`

#### Status

| `TrueLayer.Payments.Models.PayMandatement.Status` | Description |
| ------------- | ------------- 
| `.authorizationRequired` | The mandate requires authorisation.
| `.authorizing` | The user is authorizing the mandate.
| `.authorized` | The user has authorized the mandate with their bank.
| `.revoked` | The mandate has been revoked and is no longer valid.
| `.failed` | The mandate failed. https://docs.truelayer.com/docs/mandate-statuses#more-about-failed-mandates

## Showing a Result Screen

In the `Preferences` object, `shouldShowResultScreen` is set to `true` by default. This tells the TrueLayer SDK to display the result of a payment or mandate at the end of the authorization flow. This screen automatically refreshes until the payment is creditable, or until a maximum timeout is reached (customizable by setting `maximumResultScreenTimeout`). By default this timeout is 10 seconds, and cannot be set longer (the SDK will use 10s if you pass a greater value).
