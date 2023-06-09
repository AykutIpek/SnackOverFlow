//
//  NetworkManager.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 8.06.2023.
//

import Alamofire
import Foundation


struct NetworkConfig {
    let baseUrl: String
}


enum NetworkPath: String{
    case users = "api/users"
    case login = "api/login"
    
    static let baseUrlRequest: String = "https://reqres.in/"
}

protocol INetworkManager{
    var config: NetworkConfig { get set }
    func fetch<T: Codable>(path: NetworkPath,method: HTTPMethod, type: T.Type) async -> T?
    func post<T: Codable, R: Encodable>(path: NetworkPath,model: R, type: T.Type) async -> T?
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
    
    func post<T: Codable, R: Encodable>(path: NetworkPath, model: R, type: T.Type) async -> T? {
        let jsonEncoder = JSONEncoder()
        guard let data  = try? jsonEncoder.encode(model) else { return nil }
        guard let dataString = String(data: data, encoding: .utf8) else { return nil }
        
        let dataRequest = AF.request("\(config.baseUrl)\(path.rawValue)", method: .post, parameters: convertToDictionary(text: dataString))
            .validate()
            .serializingDecodable(T.self)
        
        let result = await dataRequest.response
        
        guard let value = result.value else {
            print("Error: \(String(describing: result.error))")
            return nil
        }
        return value
    }
    
    private func convertToDictionary(text: String)-> [String: Any]?{
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        return nil
    }
}

extension NetworkManager{
    static let networkManager: INetworkManager = NetworkManager(config: NetworkConfig(baseUrl: NetworkPath.baseUrlRequest))
}
