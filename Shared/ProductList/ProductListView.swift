//
//  ProductListView.swift
//  VWTestProject (iOS)
//
//  Created by avavouranakis on 4/11/21.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject var viewModel = ProductListViewModel()
    @Environment(\.managedObjectContext) var context
    
    // Fetching products from core data
    @FetchRequest(entity: Product.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Product.id,
                                                     ascending: true)])
    var results: FetchedResults<Product>

    private var refreshButton: some View {
        Button(action: {
            // by clearing array data
            // it will auto fetch all products again
            
            // clearing products in core data
            do {
                results.forEach { (product) in
                    context.delete(product)
                }
                
                try context.save()
                print("Products deleted")
            } catch {
                print(error.localizedDescription)
            }
            
            viewModel.products.removeAll()
        }) {
            Text("Refresh")
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // checking if core data exists
                if results.isEmpty {
                        ProgressView()
                        // fetching products
                            .onAppear {
                                self.viewModel.getProductList(context: self.context)
                            }
                } else {
                    List(results) { product in
                        // display fetched data
                        NavigationLink(destination: ProductDetailsView(product: product)) {
                            ProductView(product: product)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Product List"))
            .navigationBarItems(trailing: refreshButton)
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
