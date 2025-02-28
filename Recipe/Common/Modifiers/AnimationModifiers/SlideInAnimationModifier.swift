//
//  SlideInAnimationModifier.swift
//  Recipe
//
//  Created by saurav upreti on 2/21/25.
//

import SwiftUI

struct SlideInAnimation: ViewModifier {
    let delay: Double
    let duration: Double
    let offsetY: CGFloat

    init(delay: Double = 0, duration: Double = 0.5, offsetY: CGFloat = -30) {
        self.delay = delay
        self.duration = duration
        self.offsetY = offsetY
        self._offset = State(initialValue: offsetY)
    }

    @State private var offset: CGFloat
    @State private var opacity: CGFloat = 0

    func body(content: Content) -> some View {
        content
            .offset(y: offset)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeInOut(duration: duration).delay(delay)) {
                    offset = 0
                    opacity = 1
                }
            }
    }
}

extension View {
    func slideInAnimation(
            delay: Double = 0,
            duration: Double = 0.5,
            offsetY: CGFloat = -30
        ) -> some View {
            modifier(SlideInAnimation(delay: delay, duration: duration, offsetY: offsetY))
        }
}
