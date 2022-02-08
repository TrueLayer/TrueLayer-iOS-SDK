import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    window = window ?? UIWindow(frame: UIScreen.main.bounds)
        
    setRootViewController()
    
    return true
  }
  
  func setRootViewController() {
    let viewController = ViewController()
    window?.rootViewController = viewController
    window?.makeKeyAndVisible()
  }
}
