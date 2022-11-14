//
//  WaveLoader.swift
//  ButtonAnimations
//
//  Created by Deepak on 09/11/22.
//

import SwiftUI
enum AnimationState {
    case random
    case linear
}
enum AnimationColor {
    case random
    case white
    case dark
    case gray
}

struct CircleLoader: View {
    @State var firstDotOpacity = 1.0
    @State var secondDotOpacity = 0.8
    @State var thirdDotOpacity = 0.6
    @State var forthDotOpacity = 0.4
    var animationState: AnimationState = .linear
    var animationColor: AnimationColor = .random
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                HStack {
                    Circle()
                        .frame(width: 25, height: 25, alignment: .center)
                        .foregroundColor(getColor())
                        .opacity(firstDotOpacity)
                    Circle()
                        .frame(width: 25, height: 25, alignment: .center)
                        .foregroundColor(getColor())
                        .opacity(secondDotOpacity)
                    Circle()
                        .frame(width: 25, height: 25, alignment: .center)
                        .foregroundColor(getColor())
                        .opacity(thirdDotOpacity)
                    Circle()
                        .frame(width: 25, height: 25, alignment: .center)
                        .foregroundColor(getColor())
                        .opacity(forthDotOpacity)
                }
                .frame(minHeight: 25)
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
    
    func getColor() -> Color {
        var color = Color.white
        switch animationColor {
        case .random:
            color = Color.random()
        case .white:
            color = .white
        case .dark:
            color = .black
        case .gray:
            color = .gray
        }
        return color
    }
    
    func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            withAnimation {
                switch animationState {
                case .random:
                    firstDotOpacity = Double.random(in: 0.1...1)
                    secondDotOpacity = Double.random(in: 0.1...1)
                    thirdDotOpacity = Double.random(in: 0.1...1)
                    forthDotOpacity = Double.random(in: 0.1...1)
                case .linear:
                    if firstDotOpacity == 1.0 {
                        firstDotOpacity = 0.8
                        secondDotOpacity = 1.0
                        thirdDotOpacity = 0.4
                        forthDotOpacity = 0.6
                    } else if secondDotOpacity == 1.0 {
                        firstDotOpacity = 0.6
                        secondDotOpacity = 0.8
                        thirdDotOpacity = 1.0
                        forthDotOpacity = 0.4
                    } else if thirdDotOpacity == 1.0 {
                        firstDotOpacity = 0.4
                        secondDotOpacity = 0.6
                        thirdDotOpacity = 0.8
                        forthDotOpacity = 1.0
                    } else if forthDotOpacity == 1.0 {
                        firstDotOpacity = 1.0
                        secondDotOpacity = 0.4
                        thirdDotOpacity = 0.6
                        forthDotOpacity = 0.8
                    }
                }
            }
        }
    }
}

struct CircleLoader_Previews: PreviewProvider {
    static var previews: some View {
        CircleLoader()
    }
}
extension Color {
    static func random() -> Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}
