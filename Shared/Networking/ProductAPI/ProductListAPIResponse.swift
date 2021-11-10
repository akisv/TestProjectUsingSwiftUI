//
//  ProductListAPIResponse.swift
//  VWTestProject
//
//  Created by avavouranakis on 6/11/21.
//

import Foundation

struct ProductListAPIResponse: Decodable {
    let results: [Product]
}
