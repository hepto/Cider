//
//  UrlFetcher.swift
//  HMV
//

import Foundation

/// An abstraction for `URL` loading. `URLSession` conforms and other mechanisms for `URL` loading (e.g. Alamofire) can be used by providing conformance.
public protocol UrlFetcher {
    func fetch(request: URLRequest, completion: @escaping (Data?, Error?) -> Void)
}

extension URLSession: UrlFetcher {
    public func fetch(request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        let task = dataTask(with: request) { data, response, error in
            completion(data, error)
        }
        task.resume()
    }
}
