#ifndef TrueLayerMandateObjCState_h
#define TrueLayerMandateObjCState_h

/// The different final states in which a mandate can be when successful.
typedef NS_CLOSED_ENUM(NSInteger, TrueLayerMandateObjCState) {
  TrueLayerMandateObjCStateAuthorized = 0,
  TrueLayerMandateObjCStateRedirect = 1,
};

#endif /* TrueLayerMandateObjCState_h */
