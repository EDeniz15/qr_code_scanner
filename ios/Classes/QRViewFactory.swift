//
//  QRViewFactory.swift
//  flutter_qr
//
//  Created by Julius Canute on 21/12/18.
//

import Foundation

public class QRViewFactory: NSObject, FlutterPlatformViewFactory {
    
    var registrar: FlutterPluginRegistrar?
    var plugin: SwiftFlutterQrPlugin?
    
    public init(withRegistrar registrar: FlutterPluginRegistrar){
        
        self.registrar = registrar

        super.init()
    }
    
    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        let params = args as! Dictionary<String, Double>
        let qrView = QRView(withFrame: frame, withRegistrar: registrar!, withId: viewId, params: params)
        plugin?.qrView = qrView // Pasar la referencia de QRView al plugin
        return qrView
    }
    
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec(readerWriter: FlutterStandardReaderWriter())
    }
}
