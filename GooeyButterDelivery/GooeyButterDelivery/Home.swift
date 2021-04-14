//
//  Home.swift
//  GooeyButterDelivery
//
//  Created by Jeffery Mason on 2/15/21.
//

import SwiftUI

struct Home: View {
    @State var firstMinY: CGFloat = 0
    
    // Stopping bounces on Scrollview
    
    init() {
        UIScrollView.appearance().bounces = false 
    }
    
    @State var minY: CGFloat = 0
    @State var lastMinY: CGFloat  = 0
    @State var scale: CGFloat = 0
    
    var body: some View {
        
        VStack(spacing: 0){
            
            HeaderView()
            
            
            ScrollView {
                
                //Top Sticky View
                StickyView(firstMinY: $firstMinY, minY: $minY, lastMinY: $lastMinY, scale: $scale)
                
                VStack(alignment: .leading, spacing: 15, content:
                       {
                       
//                        ForEach(1...5,id: \.self){ index in
                            
                            Section(header: Text("Gooey Butter Cake")
                                        .font(.title)
                                        .fontWeight(.bold)) {
                                
                                Text("Where the cake becomes the crust and the crust holds a buttery cream cheese filling.")
                                    .multilineTextAlignment(.center)
                                
                                
                        
                            }
//                       }
                })
                    .padding()
                    .padding(.bottom, lastMinY)
                    .background(Color.white)
                    .offset(y: scale > 0.4 ? minY : lastMinY)

            }
        }
    
        .ignoresSafeArea(.all, edges: .top)
        .background(Color("Chewy")).ignoresSafeArea(.all, edges: .all)
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Extending view to get screen rect

extension View {
    
    func getScreen()->CGRect {
        
        return UIScreen.main.bounds
    }
}
