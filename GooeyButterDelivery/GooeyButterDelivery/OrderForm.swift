//
//  OrderForm.swift
//  GooeyButterDelivery
//
//  Created by Jeffery Mason on 2/15/21.
//

import SwiftUI

struct OrderForm: View {

@ObservedObject var order = Order()

var body: some View {
    NavigationView {
        Form {
            Section {
                Picker("Select your cake type", selection: $order.type) {
                    ForEach(0..<Order.types.count, id: \.self) {
                        Text(Order.types[$0])
                    }
                }

                Stepper(value: $order.quantity, in: 1...20) {
                    Text("Number of cakes: \(order.quantity)")
                }
            }
            
            Section {
                Toggle(isOn: $order.specialRequestEnabled.animation()) {
                    Text("Any special requests?")
                }

                if order.specialRequestEnabled {
                    Toggle(isOn: $order.powderedSugar) {
                        Text("Add powdered sugar")
                    }

                    Toggle(isOn: $order.crumbTopping) {
                        Text("Add sprinkles")
                    }
                }
            }
            
            Section {
                NavigationLink(destination: AddressView(order: order)) {
                    Text("Delivery details")
                }
            }
            
        }
        .navigationBarTitle("Gooey Butter Delivery")
    }
}
}


struct OrderForm_Previews: PreviewProvider {
    static var previews: some View {
        OrderForm()
    }
}
