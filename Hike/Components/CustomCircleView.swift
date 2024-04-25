//
//  CustomCircleView.swift
//  Hike
//
//  Created by Yana Mulyana on 24/04/24.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
              .fill(
                LinearGradient(
                  colors: [
                    .customIndigoMedium,
                    .customSalmonLight
                  ],
                  startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                  endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing
                )
              )
              .onAppear {
                withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                  isAnimateGradient.toggle()
                }
              }
            
            MotionAnimationView()
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    CustomCircleView()
}
