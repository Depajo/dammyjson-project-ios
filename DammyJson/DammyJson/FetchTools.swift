//
//  FetchTools.swift
//  DammyJson
//
//  Created by Joonatan De Pascale on 16.5.2023.
//

import Foundation
import Alamofire

class FetchTools {
    
    /// Fetch data from a specified URL using a GET request and and decode the response into a `User`
    /// object.
    ///
    /// Use `getData` to make a request to the specified URL and retrieve data.
    /// The retrieved data is then decoded into a `Users` object and passed
    /// to the `dataCallback` closure.
    ///
    /// - Parameters:
    ///   - url: The URLComponents object representing the URL to fetch data from.
    ///   - dataCallback: The closure to be called when the data is retrieved and decoded
    ///   successfully. It receives the decoded `Users` object as a parameter.
    func getData(url: URLComponents, dataCallback: @escaping (Users)->()) {
        AF.request(url).responseDecodable(of: Users.self) { response in
            switch response.result {
            case .success(let responseData):
                dataCallback(responseData)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    /// Send data to a specified URL using a POST request and decode the response into a `User` object.
    ///
    /// Use `postData` to send data to the specified URL using a POST request with
    /// the provided parameters. The response from the server is then decoded into a `User` object
    /// and passed to the `callback` closure.
    ///
    /// - Parameters:
    ///   - url: The URLComponents object representing the URL to send the data to.
    ///   - parameters: The parameters to be sent in the request body.
    ///   - callback: The closure to be called when the response is received and decoded
    ///   successfully. It receives the decoded `User` object as a parameter.
    func postData(url: URLComponents, parameters: Parameters,
                  callback: @escaping (User) -> Void) {
        print(parameters)
        AF.request(url, method: .post, parameters: parameters,
                   encoding: JSONEncoding.default).responseDecodable(of: User.self) { response in
            switch response.result {
            case .success(let responseData):
                print("Sending")
                callback(responseData)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    /// Send data to a specified URL using a PUT request and decode the response into a `User` object.
    ///
    /// Use `putData` to send data to the specified URL using a PUT request with
    /// the provided parameters. The response from the server is then decoded
    /// into a `User` object and passed to the `callback` closure.
    ///
    /// - Parameters:
    ///   - url: The URLComponents object representing the URL to send the data to.
    ///   - parameters: The parameters to be sent in the request body.
    ///   - callback: The closure to be called when the response is received and decoded
    ///   successfully. It receives the decoded `User` object as a parameter.
    func putData(url: URLComponents,
                 parameters: Parameters, callback: @escaping (User) -> Void) {
        print(parameters)
        AF.request(url, method: .put, parameters: parameters,
                   encoding: JSONEncoding.default).responseDecodable(of: User.self) { response in
            switch response.result {
            case .success(let responseData):
                print("Sending")
                callback(responseData)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    /// Send a DELETE request to a specified URL and decode the response into a `User` object.
    ///
    /// Use `deleteData` to send a DELETE request to the specified URL with the provided parameters.
    /// The response from the server is then decoded into a `User` object and passed
    /// to the `callback` closure.
    ///
    /// - Parameters:
    ///   - url: The URLComponents object representing the URL to send the DELETE request to.
    ///   - parameters: The parameters to be sent in the request body.
    ///   - callback: The closure to be called when the response is received and decoded
    ///   successfully. It receives the decoded `User` object as a parameter.
    func deleteData(url: URLComponents,
                    parameters: Parameters,callback: @escaping (User) -> Void) {
        AF.request(url.url!, method: .delete, parameters: parameters,
                   encoding: JSONEncoding.default).responseDecodable(of: User.self) { response in
                switch response.result {
                case .success(let responseData):
                    callback(responseData)
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
}
