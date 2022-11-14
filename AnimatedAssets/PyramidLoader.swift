//
//  PyramidLoader.swift
//  ButtonAnimations
//
//  Created by Deepak on 09/11/22.
//

import SwiftUI

struct PyramidLoader: View {
    @State var edgeTowerHeight = 60.0
    @State var middleTowerHeight = 100.0
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                HStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 25, height: edgeTowerHeight, alignment: .center)
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 25, height: middleTowerHeight, alignment: .center)
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 25, height: edgeTowerHeight, alignment: .center)
                }
                .frame(minHeight: 100.0)
                Text("Loading..")
                    .bold()
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            startAnimation()
        }
    }
    
    func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            withAnimation(.easeInOut) {
                if self.edgeTowerHeight == 60 {
                    self.edgeTowerHeight = 100
                    self.middleTowerHeight = 60
                } else {
                    self.edgeTowerHeight = 60
                    self.middleTowerHeight = 100
                }
            }
        }
        
    }
}

struct PyramidLoader_Previews: PreviewProvider {
    static var previews: some View {
        PyramidLoader()
    }
}
