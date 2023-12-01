//
//  UsersService.swift
//  Iskoci
//
//  Created by kzmvranje on 20.11.23..
//

import Foundation

import Alamofire

struct UsersService{
    
    static func userRequest(mehthod: HTTPMethod,header: HTTPHeaders, url: String = Urls.user.urlString,_ closure : @escaping(Result<UserResonse, Error>) -> ()){
        
        AF.request(url, method: mehthod, headers: header)
            .responseDecodable(of: UserResonse.self){response in
                switch (response.result){
                case .success (let response):
                    closure(.success(response))
                case .failure(let  error):
                    closure(.failure(error))
                }
            }
    }
  
    static func addFavourites(mehthod: HTTPMethod,header: HTTPHeaders, url: String, _ closure : @escaping(Result<UserResonse, Error>) -> ()){
        
        AF.request(url, method: mehthod, headers: header)
            .responseDecodable(of: UserResonse.self){response in
                switch (response.result){
                case .success (let response):
                    closure(.success(response))
                case .failure(let  error):
                    closure(.failure(error))
                }
            }
    }
    
    static func getFavourites(mehthod: HTTPMethod,header: HTTPHeaders, url: String,parameters: Parameters, _ closure : @escaping(Result<EventResponse, Error>) -> ()){
        
        AF.request(url, method: mehthod,parameters: parameters, headers: header)
            .responseDecodable(of: EventResponse.self){response in
                switch (response.result){
                case .success (let response):
                    closure(.success(response))
                case .failure(let  error):
                    closure(.failure(error))
                }
            }
    }
    static func getIdNortifications(mehthod: HTTPMethod,header: HTTPHeaders, url: String, _ closure : @escaping(Result<EventIdResponse, Error>) -> ()){
        
        AF.request(url, method: mehthod, headers: header)
            .responseDecodable(of: EventIdResponse.self){response in
                switch (response.result){
                case .success (let response):
                    closure(.success(response))
                case .failure(let  error):
                    closure(.failure(error))
                }
            }
    }
    static func getNortifications(mehthod: HTTPMethod,header: HTTPHeaders, url: String, _ closure : @escaping(Result<NortificationResponse, Error>) -> ()){
        
        AF.request(url, method: mehthod, headers: header)
            .responseDecodable(of: NortificationResponse.self){response in
                switch (response.result){
                case .success (let response):
                    closure(.success(response))
                case .failure(let  error):
                    closure(.failure(error))
                }
            }
    }
}
