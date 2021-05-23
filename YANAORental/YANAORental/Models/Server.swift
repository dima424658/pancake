//
//  Server.swift
//  YANAORental
//
//  Created by Егор Шкарин on 23.05.2021.
//

import Foundation

class Server {

    /// Геттер для ответа сервера
    
    func recieve(url: String) {
    }
    /// Запрос с логином и паролем на сервер.
     func request(urlString: String, json: Data, completion: @escaping (Data)->()) {
        print("Inside request")
        guard let url = URL(string: urlString) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.httpBody = json
        print("After request")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            print("inside data task")
            guard let data = data else {return}
            DispatchQueue.main.async {
                   completion(data)
            }
            
        }.resume()
    }
    
    /// Функция, которая парсит зашифрованные данные типа Data
}
