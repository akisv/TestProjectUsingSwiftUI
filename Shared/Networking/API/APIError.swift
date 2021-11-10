//
//  APIError.swift
//  VWTestProject
//
//  Created by avavouranakis on 6/11/21.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}

