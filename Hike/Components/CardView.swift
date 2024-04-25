//
//  CardView.swift
//  Hike
//
//  Created by Yana Mulyana on 24/04/24.
//

import SwiftUI

struct CardView: View {
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack(alignment: .center) {
                HStack {
                    Text("Hiking")
                        .fontWeight(.black)
                        .font(.system(size: 52))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGrayLight,
                                        .customGrayMedium],
                                startPoint: .top,
                                endPoint: .bottom)
                    )
                    Spacer()
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        CustomButtonView()
                    }
                    .sheet(isPresented: $isShowingSheet, content: {
                        SettingsView()
                            .presentationDragIndicator(.visible)
                            .presentationDetents([.medium, .large])
                    })
                }
                
                Text("Fun and enjoyable outdoor activity for friends and families.")
                    .multilineTextAlignment(.leading)
                    .italic()
                    .foregroundColor(.customGrayMedium)
                
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                    .aspectRatio(contentMode: .fit)
                    .animation(.default, value: imageNumber)
                }
                
                Button {
                    
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(
                            colors: [
                                .customGreenLight,
                                .customGreenMedium],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                }
                .buttonStyle(GradientButton())
            }
            .padding(.horizontal, 30)
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
