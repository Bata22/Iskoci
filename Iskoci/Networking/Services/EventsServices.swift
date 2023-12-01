//
//  EventsServices.swift
//  Iskoci
//
//  Created by kzmvranje on 6.11.23..
//

import Foundation

import Alamofire
//https://api.iskoci.xyz
enum EventService{
    
    static func request(mehthod: HTTPMethod, url: String = Urls.events.urlString, paramethers: Parameters, _ closure : @escaping(Result<EventResponse, Error>) -> ()){
        
        AF.request(url, method: mehthod, parameters:  paramethers )
            .responseDecodable(of: EventResponse.self){response in
                switch (response.result){
                case .success (let response):
                    closure(.success(response))
                case .failure(let  error):
                    closure(.failure(error))
                }
            }
    }
    
    static func searchRequest(mehthod: HTTPMethod, url: String = Urls.search.urlString, paramethers: Parameters, _ closure : @escaping(Result<EventResponse, Error>) -> ()){
        
        AF.request(url, method: mehthod, parameters:  paramethers )
            .responseDecodable(of: EventResponse.self){response in
                switch (response.result){
                case .success (let response):
                    closure(.success(response))
                case .failure(let  error):
                    closure(.failure(error))
                }
            }
    }
    
}

