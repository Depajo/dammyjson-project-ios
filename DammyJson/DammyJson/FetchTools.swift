//
//  FetchTools.swift
//  DammyJson
//
//  Created by Joonatan De Pascale on 16.5.2023.
//

import Foundation
import Alamofire

class FetchTools {
    //Get data
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
}
