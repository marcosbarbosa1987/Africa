//
//  MontionAnimationView.swift
//  Africa
//
//  Created by Marcos Barbosa on 15/02/21.
//

import SwiftUI

struct MontionAnimationView: View {
    
    // MARK: - Properties
    
    @State private var randomCircle: Int = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.white)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinator(max: geometry.size.width),
                            y: randomCoordinator(max: geometry.size.height)
                    )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }//: Loop
            }//: ZStack
            .drawingGroup()
        }//: GeometryReader
    }
}

// MARK: - Methods

extension MontionAnimationView {
    
    // Random Coordinate
    
    func randomCoordinator(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    // Random Size
    
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    // Random Scale
    
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // Random Speed
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    // Random Delay
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
}

// MARK: - Preview

struct MontionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MontionAnimationView()
    }
}
