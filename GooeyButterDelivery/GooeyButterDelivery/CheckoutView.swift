//
//  CheckoutView.swift
//  GooeyButterDelivery
//
//  Created by Jeffery Mason on 2/15/21.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var order: Order

    var body: some View {
        Text("Thank you for your order.")
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
