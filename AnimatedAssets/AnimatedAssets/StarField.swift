//
//  StarField.swift
//  ButtonAnimations
//
//  Created by Deepak on 08/11/22.
//

import SwiftUI

struct StarField: View {
    @State var isAnimating = false
    var body: some View {
        ZStack {
            Color.black
            Stars()
        }
        .ignoresSafeArea()
    }
}

struct StarField_Previews: PreviewProvider {
    static var previews: some View {
        StarField()
    }
}
struct Stars: View {
    var body: some View{
        ForEach(0..<500){ index in
            Circle()
                .foregroundColor(.white)
                .frame(width: CGFloat.random(in: 0...6), height: CGFloat.random(in: 0...6), alignment: .center)
                .offset(x: CGFloat.random(in: -255...255), y: CGFloat.random(in: -500...500))
                .transition(.opacity)
        }
    }
}
