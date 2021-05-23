//
//  User.swift
//  YANAORental
//
//  Created by Егор Шкарин on 23.05.2021.
//

import Foundation

struct User {
    private static var login: String = ""
    private static var password: String = ""
    private static var name: String = ""
    private static var surname: String = ""
    
    /// Ответ сервера
    private static var answer: Bool = false
    /// Ключ аутентификации от сервера
    private static var authKey: String = ""
    /// URL
    private static var urlString = "http://192.168.1.75"
    
    private static var server: Server = Server()
    
    static var getAnswer: Bool {
        return User.answer
    }
    
    var getLogin: String {
        get {
            return User.login
        }
        
    }
    var getPassword: String {
        get {
            return User.password
        }
    }
    var getName: String {
        get {
            return User.name
        }
        
    }
    var getSurname: String {
        get {
            return User.surname
        }
        
    }
    // Поля для работы с сервером
    
    
    
    private func userToDict() -> [String: String] {
        return ["": ""]
    }
    
    static func signIn(login: String, password: String, completion: @escaping (Bool)->()) {
        //        "request" : "login",
        //        "login" : "egor",
        //        "password" : "sos"
        let dictToRequest: [String: String] = ["request": "login", "login": login, "password": password]
        guard let json =  User.parseToJson(dictToJson: dictToRequest) else { return /*completion*/}
        server.request(urlString: urlString, json: json) { (data) in
            guard let answerFromServer = self.parseFromJson(data: data, element: "response") else {return}
            guard let key = self.parseFromJson(data: data, element: "authkey") else {return}
            User.authKey = key
            if answerFromServer == "s kaifom" {
                User.answer = true
            } else {
                User.answer = false
            }
                completion(User.answer)
        }
    }
    
    
    
    func sendToCheckNumber(phoneNumber: String, completion: @escaping (Bool)->()) {
        let dictToRequest: [String: String] = ["req": "ChekPhoneUser" , "phone": phoneNumber]
        guard let json =  User.parseToJson(dictToJson: dictToRequest) else {
            print("inside jsonCheckNumber")
            return
            
        }
        User.server.request(urlString: User.urlString, json: json) { (data) in
            guard User.parseFromJson(data: data, element: "res") != nil else {
                print("answerFromServer")
                return
                
            }
            guard let key = User.parseFromJson(data: data, element: "authkey") else {
                print("key")

                return
                
            }
            User.authKey = key
            
            completion(User.answer)
        }
    }
    
    
    
    private static func parseFromJson(data: Data, element: String) -> String?{
         // дешифровка дыннх
         let jsonDict = try? JSONSerialization.jsonObject(with: data) as? NSDictionary
         return (jsonDict?[element] as? String)
    }
    
    private static func parseToJson(dictToJson:[String: String]) -> Data? {
        guard let data = try? JSONSerialization.data(withJSONObject: dictToJson, options: []) else { return nil }
        return data
    }
    
    init(){
        User.login = ""
        User.password = ""
        User.name = ""
        User.surname = ""
    }
    
    init(login:String, password: String, name: String, surname: String) {
        User.login = login
        User.password = password
        User.name = name
        User.surname = surname
    }
}
