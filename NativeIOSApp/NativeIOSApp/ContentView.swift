//
//  ContentView.swift
//  NativeIOSApp
//
//  Created by Sahil ALam on 25/08/25.
//

import SwiftUI
import RnBrownfieldCallbackDemoReact


struct ContentView: View {
    var body: some View {
        NavigationView {
              VStack {
                Text("Welcome to the Native App")
                  .padding()

                NavigationLink("Push React Native Screen") {
                  ReactNativeView(moduleName: "RnBrownfieldCallbackDemo")
                    .navigationBarHidden(true)
                }
              }
            }
    }
}

#Preview {
    ContentView()
}
