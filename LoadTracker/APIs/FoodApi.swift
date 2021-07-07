//
//  FoodApi.swift
//  LoadTracker
//
//  Created by hladek on 23/09/2020.
//

import Foundation
import Alamofire

extension Session {
    static let base = "https://api.nal.usda.gov/fdc/v1"
    static let apiKey = "xRdBi4YXifMEGytO7fscvm256NxcCz0QZvPdc4Sa"
    //    static func foodApiRequest(querry: String, completion: @escaping (DataResponse<FoodContainerModel, AFError>) -> Void) {
    //        // Broken API endpoint results into this mess
    //        let body = "{\"query\": \"\(querry)\",\"pageSize\": 1,\"sortBy\": \"dataType.keyword\",\"sortOrder\": \"asc\",\"pageNumber\": 1}"
    //
    //        let apiKey = "xRdBi4YXifMEGytO7fscvm256NxcCz0QZvPdc4Sa" // IP protected API, so IDC about security
    //        let headers: [String: String] = ["accept" : "application/json",
    //                                         "Content-Type" : "application/json"
    //        ]
    //
    //        var urlComponents = URLComponents(string: "https://api.nal.usda.gov/fdc/v1/foods/search?")
    //        urlComponents!.queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
    //
    //        var request = URLRequest(url: urlComponents!.url!)
    //        request.httpBody = body.data(using: .utf8)
    //        request.headers = HTTPHeaders(headers)
    //        request.method = .post
    //        print(request.url)
    //        AF.request(request)
    //            .validate()
    //            .responseDecodable(of: FoodContainerModel.self) { response in
    //                completion(response)
    //            }
    //    }

    static func fetchFood(query: String, completion: @escaping (DataResponse<FoodContainerModel, AFError>) -> Void) {
        AF.request("\(base)/foods/search",
                                 method: .get,
                                 parameters: [
                                    "api_key" : apiKey,
                                    "query" : query
                                 ],
                                 encoding: URLEncoding.queryString)
            .validate()
            .debugLog()
            .responseDecodable(of: FoodContainerModel.self) { response in

                switch response.result {
                case .failure(let reason):
                    print(reason.errorDescription!)
                case .success(_):
                    print(response.request!.url!)
                }
                completion(response)
            }
    }
}

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint("=======================================")
        debugPrint(self)
        debugPrint("=======================================")
        #endif
        return self
    }
}
