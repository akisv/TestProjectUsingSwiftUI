//
//  ProductService.swift
//  VWTestProject
//
//  Created by avavouranakis on 6/11/21.
//

import Foundation
import Combine
import CoreData

protocol ProductService {
    var apiSession: APIService {get}
    func getProductList(context: NSManagedObjectContext) -> AnyPublisher<Array<ProductModel>, APIError>
}

extension ProductService {
    func getProductList(context: NSManagedObjectContext) -> AnyPublisher<Array<ProductModel>, APIError> {
        return apiSession.request(with: ProductEndpoint.productList)
            .eraseToAnyPublisher()
    }
}
