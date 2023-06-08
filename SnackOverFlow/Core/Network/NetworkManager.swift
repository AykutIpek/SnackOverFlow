//
//  NetworkManager.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 8.06.2023.
//

import Alamofire

struct NetworkConfig {
    let baseUrl: String
}

protocol INetworkManager{
    var config: NetworkConfig { get set }
    func fetch<T: Codable>(path: NetworkPath,method: HTTPMethod, type: T.Type) async -> T?
}


final class NetworkManager: INetworkManager{
    internal var config: NetworkConfig
    
    init(config: NetworkConfig) {
        self.config = config
    }
    
    func fetch<T: Codable>(path: NetworkPath,method: HTTPMethod, type: T.Type) async -> T? {
        let dataRequest = AF.request("\(config.baseUrl)\(path.rawValue)", method: method)
            .validate()
            .serializingDecodable(T.self)
        let result = await dataRequest.response
        
        guard let value = result.value else {
            print("Error: \(String(describing: result.error))")
            return nil
        }
        return value
    }
}

extension NetworkManager{
    static let networkManager: INetworkManager = NetworkManager(config: NetworkConfig(baseUrl: NetworkPath.baseUrlRequest))
}

enum NetworkPath: String{
    case users = "api/users"
    
    static let baseUrlRequest: String = "https://reqres.in/"
}
