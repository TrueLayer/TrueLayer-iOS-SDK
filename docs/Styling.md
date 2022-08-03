# Styling the TrueLayer iOS SDK

This guide explains how the SDK can be visually styled to match the rest of your app.

When configuring the SDK, you can pass in an object conforming to `VisualSettingsProvider`:

```
TrueLayer.Payments.manager.configure(
	visualSettings: // Pass your object here
	environment: .sandbox
)
```

Omitting this parameter will default to the `DefaultVisualSettings` object.

## Using `VisualSettingsProvider`

This protocol requires the following properties:

- `colors: any ColorProvider` - defaults to `UI.DefaultColors`.

### Using `ColorProvider` and `Makeup`

This protocol conforms to `Makeup`, which in turn conforms to `BackgroundColor`, `ContentColor`, and `Accessory` for granular customization.

Each property listed below has a default implementation, so you may customize only specific aspects of the UI.

#### `BackgroundColor`

- `backgroundPrimary`: The primary color of the background of the views.
- `backgroundSecondary`: The secondary color of the background of the views.
- `backgroundActionPrimary`: The primary color of an action item such as a button (example: Continue).
- `backgroundCell`: The color of the background for the cells.

#### `ContentColor`

- `contentPrimary`: The color of the primary content. That is any generic text around the `SDK`.
- `contentSecondary`: The color of secondary content. This is things like explanation text.
- `contentPrimaryInverted`: The system color for text on a dark background.
- `contentAction`: The color for text invoking an action. Like a link for instance.
- `contentError`: The color of text displaying an error.

#### `Accessory`

- `separator`: The color for thin borders or divider lines that allows some underlying content to be visible.
- `uiElementBorder`: The color of the border of some content elements. This is mainly used inside the table view cells' images.

## Example

An example of customizing certain aspects of the UI, while leaving the rest to the default colors:

```
struct CustomVisualSettings: VisualSettingsProvider {
  struct Colors: ColorProvider {
    var backgroundPrimary: UIColor {
      UIColor(
        lightAppearance: .white,
        darkAppearance: UIColor(red: 28 / 255, green: 27 / 255, blue: 32 / 255, alpha: 1)
      )
    }

    var backgroundCell: UIColor {
      backgroundPrimary // Match the table cells to the `backgroundPrimary` color above.
    }

    var backgroundActionPrimary: UIColor {
      UIColor(red: 0, green: 223 / 255, blue: 200 / 255, alpha: 1)
    }

    var contentPrimary: UIColor {
      UIColor(
        lightAppearance: UIColor(red: 13 / 255, green: 10 / 255, blue: 63 / 255, alpha: 1), 
        darkAppearance: .white
        )
    }

    var contentAction: UIColor {
      UIColor(red: 90 / 255, green: 27 / 255, blue: 255 / 255, alpha: 1)
    }
  }

  // Implemented the required property for `VisualSettingsProvider`:
  var colors: ColorProvider = Colors()
}
```
