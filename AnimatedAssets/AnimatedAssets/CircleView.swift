//
//  ContentView.swift
//  AnimatedAssets
//
//  Created by Deepak on 04/01/23.
//

import SwiftUI

enum AnimatedTypes {
    case linear
    case pulse
    case distinct
}
struct CircleContentView: View {
    @State var firstCircleAngle: Angle = Angle(degrees: 0)
    @State var secondCircleAngle: Angle = Angle(degrees: 60)
    @State var thirdCircleAngle: Angle = Angle(degrees: 120)
    @State var forthCircleAngle: Angle = Angle(degrees: 180)
    @State var fifthCircleAngle: Angle = Angle(degrees: 240)
    @State var sixthCircleAngle: Angle = Angle(degrees: 300)
    @State var isAnimated = false
    @State var width: CGFloat = 150
    @State var height: CGFloat = 150
    @State var lineWidth: CGFloat = 150
    var animatedType: AnimatedTypes = .linear
    var body: some View {
        ZStack {
            Color.black
            FlowerView(firstCircleAngle: $firstCircleAngle, secondCircleAngle: $secondCircleAngle, thirdCircleAngle: $thirdCircleAngle, forthCircleAngle: $forthCircleAngle, fifthCircleAngle: $fifthCircleAngle, sixthCircleAngle: $sixthCircleAngle, width: $width, height: $height, lineWidth: $lineWidth)
                .onAppear{
                    startAnimation()
                }
        }.ignoresSafeArea()
    }
    
    func startAnimation() {
        
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { _ in
            withAnimation {
                firstCircleAngle = Angle(degrees: firstCircleAngle.degrees + 60)
                secondCircleAngle = Angle(degrees: secondCircleAngle.degrees + 60)
                thirdCircleAngle = Angle(degrees: thirdCircleAngle.degrees + 60)
                forthCircleAngle = Angle(degrees: forthCircleAngle.degrees + 60)
                fifthCircleAngle = Angle(degrees: fifthCircleAngle.degrees + 60)
                sixthCircleAngle = Angle(degrees: sixthCircleAngle.degrees + 60)
                isAnimated = !isAnimated
                if animatedType == .pulse {
                    if isAnimated {
                        width = 80
                        height = 80
                    } else {
                        width = 150
                        height = 150
                    }
                } else if animatedType == .distinct {
                    if isAnimated {
                        lineWidth = 60
                    } else {
                        lineWidth = 150
                    }
                }
                
            }
        }
    }
}

struct CircleContentView_Previews: PreviewProvider {
    static var previews: some View {
        CircleContentView()
    }
}

struct FlowerView: View{
    @Binding var firstCircleAngle: Angle
    @Binding var secondCircleAngle: Angle
    @Binding var thirdCircleAngle: Angle
    @Binding var forthCircleAngle: Angle
    @Binding var fifthCircleAngle: Angle
    @Binding var sixthCircleAngle: Angle
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    @Binding var lineWidth: CGFloat

    var body: some View {
        Circle()
        .trim(from: 0, to: 0.001)
        .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap:.round))
        .frame(width: width, height: height, alignment: .center)
        .foregroundColor(.white)
        .opacity(0.5)
        .rotationEffect(firstCircleAngle)
        
        Circle()
        .trim(from: 0, to: 0.001)
        .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap:.round))
        .frame(width: width, height: height, alignment: .center)
        .foregroundColor(.white)
        .opacity(0.5)
        .rotationEffect(secondCircleAngle)
        
        Circle()
        .trim(from: 0, to: 0.001)
        .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap:.round))
        .frame(width: width, height: height, alignment: .center)
        .foregroundColor(.white)
        .opacity(0.5)
        .rotationEffect(thirdCircleAngle)
        
        Circle()
        .trim(from: 0, to: 0.001)
        .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap:.round))
        .frame(width: width, height: height, alignment: .center)
        .foregroundColor(.white)
        .opacity(0.5)
        .rotationEffect(forthCircleAngle)
        
        Circle()
        .trim(from: 0, to: 0.001)
        .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap:.round))
        .frame(width: width, height: height, alignment: .center)
        .foregroundColor(.white)
        .opacity(0.5)
        .rotationEffect(fifthCircleAngle)
        
        Circle()
        .trim(from: 0, to: 0.001)
        .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap:.round))
        .frame(width: width, height: height, alignment: .center)
        .foregroundColor(.white)
        .opacity(0.5)
        .rotationEffect(sixthCircleAngle)
    }
}
