//
//  APIService.swift
//  VWTestProject
//
//  Created by avavouranakis on 6/11/21.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
}
