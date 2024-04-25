//
//  SettingView.swift
//  Hike
//
//  Created by Yana Mulyana on 25/04/24.
//

import SwiftUI

struct SettingsView: View {
    
    private let alternateAppIcons: [String] = [
      "AppIcon-MagnifyingGlass",
      "AppIcon-Map",
      "AppIcon-Mushroom",
      "AppIcon-Camera",
      "AppIcon-Backpack",
      "AppIcon-Campfire"
    ]
    
    var body: some View {
        List {
            Section {
                HStack() {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editors' Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGreenLight,
                            .customGreenMedium,
                            .customGreenDark
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            
            Section(header: Text("Alternate Icons")) {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(alternateAppIcons.indices, id: \.self) { icon in
                                Button(action: {
                                    print(alternateAppIcons[icon])
                                    UIApplication.shared.setAlternateIconName(alternateAppIcons[icon]) { error in
                                        if error != nil {
                                            print("Failed set Icon")
                                        } else {
                                            print("Success set Icon")
                                        }
                                    }
                                }, label: {
                                    Image("\(alternateAppIcons[icon])-Preview")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(16)
                                })
                                .buttonStyle(.borderless)
                            }
                        }
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 8)
                    
                    Text("Choose your favourite app icon from the collection above.")
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                        .font(.footnote)
                        .padding(.bottom, 8)
                }
            }

            Section(
                header: Text("About The App"),
                footer: HStack {
                    Spacer()
                    Text("Copyright © All Right Reserved.")
                    Spacer()
                }
            ) {
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "John Doe", rowTintColor: .mint)
                
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)
                
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Credo Acedemy", rowLinkDestination: "https://credo.academy")
            }
        }
    }
}

#Preview {
    SettingsView()
}
