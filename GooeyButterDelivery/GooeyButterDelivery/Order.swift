//
//  Order.swift
//  GooeyButterDelivery
//
//  Created by Jeffery Mason on 2/15/21.
//

import Foundation

import SwiftUI

class Order: ObservableObject {
    static let types = ["Chewy: Edge of Cake", "Gooey: Center of Cake"]

    @Published var type = 0
    @Published var quantity = 1

    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                powderedSugar = false
                crumbTopping = false
            }
        }
    }
    @Published var powderedSugar = false
    @Published var crumbTopping = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    @Published var cellPhone = ""
}
