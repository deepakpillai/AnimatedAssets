//
//  SubmitLoaderButton.swift
//  ButtonAnimations
//
//  Created by Deepak on 09/11/22.
//

import SwiftUI

struct SubmitLoaderButton: View {
    @State var angle = Angle(degrees: 0)
    @State var circleOpacity = 0.0
    @State var angleTimer: Timer?
    @State var scaleTimer: Timer?
    @State var buttonColor: Color = .white
    @State var buttonScale = 1.0
    @State var buttonWidth = 180.0
    @State var buttonHeight = 60.0
    @State var isTextVisable = true
    @State var circleScale = 1.0
    @State var userIntractionEnabled = true
    @State var textValue = "Submit"
    
    var body: some View {
        ZStack {
            Color.black
            RoundedRectangle(cornerRadius: 100, style: .circular)
                .foregroundColor(buttonColor)
                .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                .scaleEffect(buttonScale)
            Circle()
                .trim(from: 0, to: 0.001)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .foregroundColor(.white)
                .frame(width: 240, height: 240, alignment: .center)
                .rotationEffect(angle)
                .opacity(circleOpacity)
                .scaleEffect(circleScale)
            if isTextVisable {
                Text(textValue)
                    .bold()
                    .font(.system(size: 22))
            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            startAnimation()
        }
        .allowsHitTesting(userIntractionEnabled)
    }
    
    func startAnimation() {
        userIntractionEnabled = false
        angleTimer = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { _ in
            withAnimation {
                let value = angle.degrees + 45.0
                angle = Angle(degrees: value)
            }
        }
        scaleTimer = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { _ in
            withAnimation {
                if buttonScale == 1.0 {
                    buttonScale = 0.5
                } else {
                    buttonScale = 1.0
                }
            }
        }
        withAnimation {
            circleOpacity = 1.0
            buttonColor = .orange.opacity(0.8)
            buttonWidth = 100
            buttonHeight = 100
            isTextVisable = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            stopAnimation()
        }
    }
    
    func reset() {
        angle = Angle(degrees: 0)
        circleOpacity = 0.0
        buttonColor = .white
        buttonScale = 1.0
        buttonWidth = 180.0
        buttonHeight = 60.0
        isTextVisable = true
        circleScale = 1.0
        userIntractionEnabled = true
    }
    
    func stopAnimation() {
        angleTimer?.invalidate()
        scaleTimer?.invalidate()
        
        withAnimation {
            textValue = "Done"
            isTextVisable = true
            circleScale = 0.0
            buttonColor = .white
            buttonWidth = 180.0
            buttonHeight = 60.0
            buttonScale = 1.0
            circleOpacity = 0.0
        }
        
        withAnimation {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                reset()
            }
        }
    }
}

struct SubmitLoaderButton_Previews: PreviewProvider {
    static var previews: some View {
        SubmitLoaderButton()
    }
}
