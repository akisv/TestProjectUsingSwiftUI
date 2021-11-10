//
//  ProductListViewModel.swift
//  VWTestProject (iOS)
//
//  Created by avavouranakis on 4/11/21.
//

import Foundation
import Combine
import SwiftUI
import CoreData

class ProductListViewModel: ObservableObject, ProductService {
    
    var apiSession: APIService
    @Published var products =  [ProductModel]()
    var cancellables = Set<AnyCancellable>()
    // saving json to Core data
    var context: NSManagedObjectContext?
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    /// Fetch product list
    /// - Parameter context: the NSManagedObjectContext
    func getProductList(context: NSManagedObjectContext) {
        let cancellable = self.getProductList(context: context)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                case .finished:
                    break
                }
                
            }) { (products) in
                // returns the array with the products
                self.products = products
                self.saveData(context: context)
        }
        cancellables.insert(cancellable)
    }
    
    /// convert every productModel to Product entity and save it 
    func saveData(context: NSManagedObjectContext) {
        self.products.forEach { (data) in
            let entity = Product(context: context)
            entity.id = Int16(data.id)
            entity.name = data.name
            entity.price = data.price
            entity.thumbnail = data.thumbnail
            entity.image = data.image
            entity.productDescription = data.productDescription
        }
        
        // saving all products
        do {
            try context.save()
            print("Products saved")
        } catch {
            print(error.localizedDescription)
        }
    }
}
