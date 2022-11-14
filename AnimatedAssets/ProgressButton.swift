//
//  ProgressButton.swift
//  ButtonAnimations
//
//  Created by Deepak on 08/11/22.
//

import SwiftUI

enum ProgressPosition {
    case fromLeft
    case fromBottom
}

struct ProgressButton: View {
    @State var percent: Double = 0.0
    @State var buttonText = "Download"
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                DownloadButton(buttonText: $buttonText, percent: $percent, position: .fromBottom)
                    .onTapGesture {
                        buttonText = "Downloading"
                    }
                Slider(value: $percent, in: 0...100)
                    .padding([.leading, .trailing], 30)
            }
        }.ignoresSafeArea()
    }
}

struct ProgressButton_Previews: PreviewProvider {
    static var previews: some View {
        ProgressButton()
    }
}
struct DownloadButton: View {
    @Binding var buttonText: String
    @Binding var percent: Double
    var position: ProgressPosition = .fromBottom
    var width: CGFloat = 180
    var height: CGFloat = 60
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: width, height: height)
                .foregroundColor(.white)
            if position == .fromBottom {
                Rectangle()
                    .fill(Color.blue.opacity(0.6))
                    .frame(width: width, height: height)
                    .offset(y: calculateXPosition(percent: percent, height: height))
            } else if position == .fromLeft {
                Rectangle()
                    .fill(Color.blue.opacity(0.6))
                    .frame(width: width, height: height)
                    .offset(x: calculateYPosition(percent: percent, width: width))
            }
            Text(buttonText)
                .bold()
                .font(.system(size: 20))
        }
        .cornerRadius(8)
        .ignoresSafeArea()
    }
    
    func calculateXPosition(percent: Double, height: CGFloat) -> CGFloat {
        //0.60*50
        return CGFloat(abs(((height/100) * percent) - height))
    }
    
    func calculateYPosition(percent: Double, width: CGFloat) -> CGFloat {
        //0.60*50
        return CGFloat(abs((width/100) * percent) - width)
    }
}
