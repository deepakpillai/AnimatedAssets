//
//  CircleLoader.swift
//  ButtonAnimations
//
//  Created by Deepak on 09/11/22.
//

import SwiftUI

struct InfiniteCircleLoader: View {
    @State var animationStatus: Bool = true
    @State var rotationAngle: Angle = Angle(degrees: 45)
    @State var trimStart: Double = 0.3
    @State var trimLength: Double = 0.8
    
    var body: some View {
        ZStack {
            Color.black
            Circle()
                .stroke(style: .init(lineWidth: 20, lineCap: .square))
                .foregroundColor(.white)
                .frame(width: 200, height: 200, alignment: .center)
            Circle()
                .trim(from: trimStart, to: trimLength)
                .stroke(style: .init(lineWidth: 20, lineCap: .round))
                .foregroundColor(.blue.opacity(0.5))
                .frame(width: 200, height: 200, alignment: .center)
                .rotationEffect(rotationAngle)
                .onAppear {
                    startAnimation()
                }
            Text("Loading..")
                .bold()
                .font(.system(size: 30))
                .foregroundColor(.white)
        }.ignoresSafeArea()
    }
    
    func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            withAnimation {
                let degree: Double = rotationAngle.degrees + 45
                rotationAngle = Angle(degrees: degree)
            }
        }
        if animationStatus {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                withAnimation {
                    trimStart = Double.random(in: 0.1...0.6)
                    trimLength = 0.8
                }
            }
        }
    }
}

struct InfiniteCircleLoader_Previews: PreviewProvider {
    static var previews: some View {
        InfiniteCircleLoader()
    }
}
