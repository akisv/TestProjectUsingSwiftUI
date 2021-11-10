//
//  ProductEndpoint.swift
//  VWTestProject
//
//  Created by avavouranakis on 6/11/21.
//

import Foundation

enum ProductEndpoint {
    case productList
}

extension ProductEndpoint: RequestBuilder {

    var urlRequest: URLRequest {
        switch self {
        case .productList:
            guard let url = URL(string: "https://vivawallet.free.beeceptor.com/v1/api/products") else {
                preconditionFailure("Invalid URL format")
            }
            let request = URLRequest(url: url)
            return request
        }
    }
}
