//
//  AsyncImage.swift
//  VWTestProject
//
//  Created by avavouranakis on 8/11/21.
//

import SwiftUI

/// We bind AsyncImage to image updates by means of the @StateObject property wrapper.
/// This way, SwiftUI will automatically rebuild the view every time the image changes.
/// We pick @StateObject over @ObservedObject and @EnvironmentObject since we want the view to manage image loader’s lifecycle.
/// SwiftUI automatically keeps image loader alive as long as AsyncImage remains visible, and releases the image loader when the view is not needed anymore.
struct AsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder
    private let image: (UIImage) -> Image
    
    init(url: URL,
         @ViewBuilder placeholder: () -> Placeholder,
         @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)
    ) {
        self.placeholder = placeholder()
        self.image = image
        /// we read the image cache from the AsyncImage’s environment, and pass it directly to the ImageLoader’s initializer.
        _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
    }
    
    var body: some View {
        ///we start image loading when AsyncImage’s body appears.
        ///There is no need to cancel image loading explicitly in view’s onDisappear() since SwiftUI does this automatically for @StateObjects.
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        Group {
            if loader.image != nil {
                image(loader.image!)
            } else {
                placeholder
            }
        }
    }
}
