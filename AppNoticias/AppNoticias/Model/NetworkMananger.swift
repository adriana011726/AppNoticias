//
//  NetworkMananger.swift
//  Exercicio-Modulo-14
//
//  Created by ADRIANA DE SOUZA CORREIA DE OLIVEIRA on 14/03/22.
//

import UIKit

enum ResultNewsError: Error {
    case badURL, noData, invalidJSON
}

class NetworkMananger {

        static let shared = NetworkMananger()
    
    struct Constants {
        static let newsAPI = URL(string: "http://ebac-web-ios.herokuapp.com/home")
    }
    
    private init() { }
        
    func getNews(completion: @escaping (Result) -> Void) { //
        // Setup the url - Configurar a url
        
        guard let url = Constants.newsAPI else {
            completion(.failure(.badURL))
            return
        }
        
        // create a configuration - crie uma configuração
        let configuration =  URLSessionConfiguration.default
        
        // Creat a session - criar uma seção
        let session  = URLSession(configuration: configuration)
        
        //Create the task - crei a tarefa
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
            let data = data  else {
                completion (.failure(.invalidJSON))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(ResponseElement.self, from: data)
                completion(.success(result.home.results))
            } catch {
                print("Error info: \(error.localizedDescription)")
                completion(.failure(.noData))
            }
            
        }
        
        task .resume() 
        
    }
    

}
