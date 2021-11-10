//
//  ProductDetailsView.swift
//  VWTestProject
//
//  Created by avavouranakis on 8/11/21.
//

import SwiftUI

struct ProductDetailsView: View {

    var product: Product?
    
    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: product?.image ?? "")!,
                placeholder: { Text("Loading ...") },
                image: { Image(uiImage: $0).resizable() }
            ).frame(width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.width,
                    alignment: .top)
            Text(product?.name ?? "")
                .font(.system(size: 18))
                .foregroundColor(Color.blue)
            Text(product?.price ?? "")
                .font(.system(size: 16))
                .foregroundColor(Color.green)
            Text(product?.productDescription ?? "")
                .font(.system(size: 12))
                .foregroundColor(Color.black)
                .padding(.leading, 8)
                .padding(.trailing, 8)
        }
    }
}
