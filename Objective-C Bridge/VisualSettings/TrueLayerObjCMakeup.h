#ifndef TrueLayerObjCMakeup_h
#define TrueLayerObjCMakeup_h

#import <UIKit/UIKit.h>

/// These are the Objective-C protocol implementations of the Swift SDK's visual styling protocols.
/// They allow Objective-C integrators to create objects that conform to these protocols to customize the visual styling.
/// They should be a 1:1 map of the TrueLayerSDK protocols.

// MARK: Background Color

@protocol TrueLayerObjCBackgroundColor <NSObject>

/// The primary color of the background of the views.
@property (nonatomic, retain, nullable) UIColor *backgroundPrimary;

/// The secondary color of the background of the views.
@property (nonatomic, retain, nullable) UIColor *backgroundSecondary;

/// The primary color of an action item such as a button (example: Continue).
@property (nonatomic, retain, nullable) UIColor *backgroundActionPrimary;

/// The color of the background for the cells.
@property (nonatomic, retain, nullable) UIColor *backgroundCell;

@end

// MARK: Content Color

@protocol TrueLayerObjCContentColor <NSObject>
/// The color of the primary content. That is any generic text around the `SDK`.
@property (nonatomic, retain, nullable) UIColor *contentPrimary;

/// The color of secondary content. This is things like explanation text.
@property (nonatomic, retain, nullable) UIColor *contentSecondary;

/// The system color for text on a dark background.
@property (nonatomic, retain, nullable) UIColor *contentPrimaryInverted;

/// The color for text invoking an action. Like a link for instance.
@property (nonatomic, retain, nullable) UIColor *contentAction;

/// The color of text displaying an error.
@property (nonatomic, retain, nullable) UIColor *contentError;

@end

// MARK: Accessory

@protocol TrueLayerObjCAccessory <NSObject>
/// The color for thin borders or divider lines that allows some underlying content to be visible.
@property (nonatomic, retain, nullable) UIColor *separator;

/// The color of the border of some content elements.
///
/// This is mainly used inside the table view cells' images.
@property (nonatomic, retain, nullable) UIColor *uiElementBorder;

@end

// MARK: Makeup

@protocol TrueLayerObjCMakeup <NSObject, TrueLayerObjCBackgroundColor, TrueLayerObjCContentColor, TrueLayerObjCAccessory>

@end


#endif /* TrueLayerObjCMakeup_h */
