//
//  ProductModel.swift
//  VWTestProject (iOS)
//
//  Created by avavouranakis on 4/11/21.


import Foundation

struct ProductModel: Identifiable {
    let id: Int
    let name: String
    let price: String
    let thumbnail: String
    let image: String
    let productDescription: String?
}

extension ProductModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case price = "Price"
        case thumbnail = "Thumbnail"
        case image = "Image"
        case productDescription = "Description"
    }
}
