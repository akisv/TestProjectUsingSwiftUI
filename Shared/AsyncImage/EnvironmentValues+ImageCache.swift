//
//  EnvironmentValues+ImageCache.swift
//  VWTestProject
//
//  Created by avavouranakis on 8/11/21.
//

import SwiftUI
///Environment is essentially a dictionary with app-wide preferences.
///SwiftUI passes it automatically from the root view to its children.
struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
