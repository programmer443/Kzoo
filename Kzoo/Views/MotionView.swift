//
//  MotionView.swift
//  Kzoo
//
//  Created by Muhammad Ahmad on 28/09/2022.
//

import SwiftUI

struct MotionView: View {
    // Mark:- PROPERTY
    @State private var isAnimation: Bool = false
    @State private var randomCircle = Int.random(in: 12...16)
    //Mark:- FUNCTIONS
    
    func randomCoordinates(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    func randomSizes() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.25...1.0)
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSizes(), height: randomSizes(), alignment: .center)
                        .scaleEffect(isAnimation ? randomScale() : 1)
                        .position(
                            x: randomCoordinates(max: geometry.size.width),
                            y: randomCoordinates(max: geometry.size.height)
                        )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                        .onAppear {
                            isAnimation = true
                        }
                } //: ZSTACK
            }.drawingGroup()
        }
    }
}

struct MotionView_Previews: PreviewProvider {
    static var previews: some View {
        MotionView()
    }
}
