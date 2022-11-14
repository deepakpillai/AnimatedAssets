//
//  CircleLoader.swift
//  ButtonAnimations
//
//  Created by Deepak on 08/11/22.
//

import SwiftUI

struct CircleProgress: View {
    @Binding var progress: Double
    var progressColor: Color = .blue
    var textColor: Color = .white
    
    var body: some View {
        ZStack {
            let actualProgress: CGFloat = progress/100.0
            let actualProgressText = String(format: "%.f", progress)
            Circle()
                .trim(from: 0, to: actualProgress)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap:.round))
                .frame(width: 150, height: 150, alignment: .center)
                .foregroundColor(progressColor)
                .rotationEffect(Angle(degrees: 100))
            Text("\(actualProgressText)%")
                .foregroundColor(textColor)
                .bold()
                .font(.system(size: 30))
        }
    }
}


struct CircleProgress_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgress(progress: .constant(80.0))
    }
}
