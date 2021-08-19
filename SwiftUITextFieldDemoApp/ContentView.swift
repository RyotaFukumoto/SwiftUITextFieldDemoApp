//
//  ContentView.swift
//  SwiftUITextFieldDemoApp
//
//  Created by ryota on 2021/08/19.
//

import SwiftUI

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct ContentView: View {
    @State private var name = ""
    @State private var message = ""
    @State private var isEditing = false
    
    var body: some View {
        ZStack {
            Color.white
                .opacity(0.4)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    UIApplication.shared.closeKeyboard()
                }
            VStack {
                TextField("名前を入れてね",text: $name){ isEditing in
                    self.isEditing = isEditing
                }
                onCommit: {
                    self.message = "こんにちは、\(self.name)さん"
                    self.name = ""
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .shadow(color: isEditing ? .blue : .clear, radius: 3)
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            UIApplication.shared.closeKeyboard()
                        }
                )
                Text(message)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
