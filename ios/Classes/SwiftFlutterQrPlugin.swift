import Flutter
import UIKit

public class SwiftFlutterQrPlugin: NSObject, FlutterPlugin {

  var factory: QRViewFactory
    var qrView: QRView?
    public init(with registrar: FlutterPluginRegistrar) {
      self.factory = QRViewFactory(withRegistrar: registrar)
      super.init()
      self.factory.plugin = self // Asigna el plugin después de la inicialización
      registrar.register(factory, withId: "net.touchcapture.qr.flutterqr/qrview")
    }
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    registrar.addApplicationDelegate(SwiftFlutterQrPlugin(with: registrar))
  }
  
  public func applicationDidEnterBackground(_ application: UIApplication) {
  }

  public func applicationWillTerminate(_ application: UIApplication) {
  }
    
    public func applicationDidBecomeActive(_ application: UIApplication) {
        qrView?.checkPermission()
    }

}
