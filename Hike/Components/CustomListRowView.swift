//
//  CustomListRowView.swift
//  Hike
//
//  Created by Yana Mulyana on 25/04/24.
//

import SwiftUI

struct CustomListRowView: View {
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent {            
            if rowContent != nil {
                Text(rowContent!)
                  .foregroundColor(.primary)
                  .fontWeight(.heavy)
            } else if rowLinkLabel != nil && rowLinkDestination != nil {
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            } else {
                EmptyView()
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            rowLabel: "Hike",
            rowIcon: "apps.iphone",
            rowContent: "Application",
            rowTintColor: .red)
    }
    
}
