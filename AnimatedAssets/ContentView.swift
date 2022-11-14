//
//  ContentView.swift
//  ButtonAnimations
//
//  Created by Deepak on 07/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var progress = 0.0
    var body: some View {
        ZStack {
            Color.black
            VStack{
                CircleProgress(progress: $progress)
                
                Spacer()
                    .frame(height: 30)
                Slider(value: $progress, in: 0...100)
                    .padding([.leading, .trailing], 30)
            }
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
