//
//  HeaderView.swift
//  GooeyButterDelivery
//
//  Created by Jeffery Mason on 2/15/21.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        //Headerview
        HStack {
            
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "line.horizontal.3")
                    .font(.title2)
            })
        }
        
        .padding()
        .overlay(
            // Title...
            
        Text("Gooey Butter Delivery")
            .font(.title2)
            .fontWeight(.bold)
        
        )
        .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
        .background(Color("Chewy"))
        .foregroundColor(.white)
        .shadow(color: Color.black.opacity(0.15), radius: 5 , x: 0, y: 0 )
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
