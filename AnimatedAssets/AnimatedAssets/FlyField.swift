//
//  StarField.swift
//  ButtonAnimations
//
//  Created by Deepak on 08/11/22.
//

import SwiftUI

struct FlyField: View {
    @State var isAnimating = false
    var body: some View {
        ZStack {
            Color.black
            Flys(animationStatus: $isAnimating)
                .onAppear {
                    startAnimation()
                }
        }
        .ignoresSafeArea()
    }
    
    func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { _ in
            withAnimation {
                isAnimating.toggle()
            }
        }
    }
}

struct FlyField_Previews: PreviewProvider {
    static var previews: some View {
        FlyField()
    }
}
struct Flys: View {
    @Binding var animationStatus: Bool
    var body: some View{
        ForEach(0..<80){ index in
            Circle()
                .foregroundColor(.white)
                .frame(width: CGFloat.random(in: 0...10), height: CGFloat.random(in: 0...10), alignment: .center)
                .offset(x: CGFloat.random(in: -255...255), y: CGFloat.random(in: -500...500))
                .opacity(animationStatus ? 1 : 0.3)
        }
    }
}
