//
//  ProductView.swift
//  VWTestProject (iOS)
//
//  Created by avavouranakis on 4/11/21.
//

import SwiftUI

struct ProductView: View {

    var product: Product?

    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: product?.thumbnail ?? "")!,
                placeholder: { Text("Loading ...") },
                image: { Image(uiImage: $0).resizable() }
            )
            .frame(width: 80,
                   height: 80,
                   alignment: .center)
            VStack(alignment: .leading, spacing: 15) {
                Text(product?.name ?? "")
                    .font(.system(size: 18))
                    .foregroundColor(Color.blue)
                Text(product?.price ?? "")
                    .font(.system(size: 14))
            }
        }
    }
}
