//
//  StickyView.swift
//  GooeyButterDelivery
//
//  Created by Jeffery Mason on 2/15/21.
//

import SwiftUI

struct StickyView: View {
    
    @Binding var firstMinY: CGFloat
    @Binding var minY: CGFloat
    @Binding var lastMinY: CGFloat
    @Binding var scale: CGFloat
    
    @State var showInfoModalView: Bool = false
    
    var body: some View {

        
        GeometryReader{ reader -> AnyView in
            
            // Eliminating the header view height from image
            
            let minY = reader.frame(in: .global).minY
            
            // Scaling view
            // to avoid negatives
            
            // you own value for scaling effect
            let progress = (minY > 0 ? minY : 0) / 200
            
            let scale = (1 - progress) * 1
            
            // Image scaling
            
            // Only 0.1 scaling for inner image
            let imageScale = (scale / 0.6 ) > 0.9 ? (scale / 0.6) : 0.9
            
            // Image Offset
            
            let imageOffSet = imageScale > 0 ? (1 - imageScale) * 200 : 20
            
            
            DispatchQueue.main.async {
                if self.firstMinY == 0 {
                    self.firstMinY = minY
                }
                self.minY = minY
                
                    // Getting last MinY value when the scale reached 0.4
                
                if scale < 0.4 && lastMinY == 0 {
                    
                    self.lastMinY = minY 
                }
                
                
                self.scale = scale
            }
            
            return AnyView(
                Image("p2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: getScreen().width, height: getScreen().height - firstMinY)
                    .cornerRadius(1)
                    .scaleEffect(scale < 0.6 ? imageScale : 1)
                    .offset(y: scale < 0.3 ? imageOffSet : 0)
                    .overlay(
                    
                        ZStack {
                            
                            VStack {
                                
                                Text("A Dangerously Delectable")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black).opacity(0.7)
                                
                                Text("Homemade Treat")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.black).opacity(0.7)
                                    .multilineTextAlignment(.center)
                                    .padding(.top,10)
                            }
                            .foregroundColor(.white)
                            .offset(y: 15)
                            // Hiding
                            // Hiding before scale 0.6
                            .opacity(Double(scale - 0.7) / 0.3)
                            
                            // Showing info details
                            
                            Text("Gooey Butter Cake")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black).opacity(0.8)
                                .scaleEffect(1.5)
                                .opacity(0.1 - Double(scale - 0.7) / 0.3)
                        }
                    
                    )
                    
                    .background(
                    
                        ZStack {
                            // Only showing after 0.6
                            if scale < 0.6 {
                                
                                // Background and info card
                                
                                RoundedRectangle(cornerRadius: 15).fill(Color("Gooey"))
                                
                                VStack {
                                    
                                    HStack {

                                        Spacer()
                                        
                                        ForEach(1...3, id: \.self) {_ in
                                            
                                            Circle()
                                                .fill(Color.gray)
                                                .frame(width: 15, height: 15)
                                            
                                        }
                                    }
                                    
                                    Spacer()
                                }
                            }

                        }
                        
                    )
                
                    // Limiting
                    .scaleEffect(scale > 0.6 ? scale : 0.6)
                    // Loginc to move view when it reaches button
                    .offset(y: minY > 0 ? minY > lastMinY + 60 && lastMinY != 0 ? lastMinY + 60 : minY : 0)
                // Offset
                    .offset(y: scale > 0.6 ? (scale - 1 ) * 200 : -80)
            )
            
        }
        .frame(width: getScreen().width, height: getScreen().height - firstMinY)
        .overlay(
        
        // Bottom Details
            
            VStack {
                
                Text("Swipe Up to Order")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                        showInfoModalView = true
                      }, label: {
                        Label("Order ", systemImage: "")
                            .background(Color.white)
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding()
                            .border(Color.white, width: 20)
                      })
                .padding(30)
            
                    }
                    .sheet(isPresented: $showInfoModalView) {
                      OrderForm()
                    }

                
//
//                Button(action:  {}, label: {
//                        Text("Order")
//                            .fontWeight(.bold)
//                            .foregroundColor(.black)
//                            .padding(.vertical)
//                            .padding(.horizontal,30)
//                            .background(Color.white)
//                })
//                .padding(.top,10)
//            }
//            .padding(.bottom,70)
            // Disabling Scroll
            .offset(y: minY > 0 ? minY > lastMinY + 60 && lastMinY != 0 ?  lastMinY + 60 : minY : 0)
            // this
            ,
            
            alignment: .bottom
        
        
        )
        
    }
}

struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button("Dismiss Modal") {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct StickyView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



//                Button(action: {
//                  withAnimation {
//                    alertIsVisible = true
//                  }
//                }) {
//                  Text("Order".uppercased())
//                        .fontWeight(.bold)
//                        .foregroundColor(.black)
//                        .padding(.vertical)
//                        .padding(.horizontal,30)
//                        .background(Color.white)
//                }
//
