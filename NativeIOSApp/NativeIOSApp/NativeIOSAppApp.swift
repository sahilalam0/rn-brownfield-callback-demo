//
//  NativeIOSAppApp.swift
//  NativeIOSApp
//
//  Created by Sahil ALam on 25/08/25.
//

import SwiftUI
import RnBrownfieldCallbackDemoReact

@main
struct NativeIOSAppApp: App {
    init(){
        ReactNativeBrownfield.shared.bundle = ReactNativeBundle
        ReactNativeBrownfield.shared.startReactNative {
              print("React Native bundle loaded")
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
