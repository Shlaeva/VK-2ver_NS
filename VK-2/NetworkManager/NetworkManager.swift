//
//  NetworkManager.swift
//  VK-2
//
//  Created by Julie on 18.02.2021.
//

import UIKit

class NetworkManager {
    
    static var shared = NetworkManager()
    private let urlString = "https://api.vk.com/method/"
    private var method: String = ""
    
    func getFriends(token: String) {
        
        method = "friends.get?v=5.130&access_token="
        
        if let url = URL(string: urlString + method + token) {
           print(url)
        
            let session = URLSession.shared
        
            let task = session.dataTask(with: url) { (data, response, error) in
            
                let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                
                print(json ?? "?f?")
            }
            task.resume()
        }
    
    }
    
    
    
    func getFoto(token: String, owner_id: String) {
        
        method = "photos.get?v=5.130"
        let param: String = "&owner_id=" + owner_id + "&album_id=profile" + "&access_token="
        
        
        if let url = URL(string: urlString + method + param + token) {
           print(url)
        
            let session = URLSession.shared
        
            let task = session.dataTask(with: url) { (data, response, error) in
            
                let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                
                print(json ?? "?ph?")
            }
            task.resume()
        }
    
    }
    
    
    func getGroups(token: String) {
        
        method = "groups.get?v=5.130&access_token="
        
        if let url = URL(string: urlString + method + token) {
           print(url)
        
            let session = URLSession.shared
        
            let task = session.dataTask(with: url) { (data, response, error) in
            
                let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                
                print(json ?? "?g?")
            }
            task.resume()
        }
    
    }
    
    
    func searchGroups(token: String, q: String) {
        
        method = "groups.search?v=5.130"
        
        let param: String = "&q=" + q + "&access_token="
        
        
        if let url = URL(string: urlString + method + param + token) {
           print(url)
        
            let session = URLSession.shared
        
            let task = session.dataTask(with: url) { (data, response, error) in
            
                let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                
                print(json ?? "?sg?")
            }
            task.resume()
        }
    
    }
    
    
    
    
    
    
}


//struct Response {
//    var count: Int
//    var items: Any
//}

//{"response":{"count":1,"items":[610174587]}}
