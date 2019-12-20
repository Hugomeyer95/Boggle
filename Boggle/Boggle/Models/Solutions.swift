//
//  Solutions.swift
//  Boggle
//
//  Created by Hugo Meyer on 12/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI
import Foundation

struct ServerMessage: Decodable {
   let res, message: String
}

struct Solutions {

    var baseUrl = "https://france.pieroxy.net/blog/pages/ruzzle/fr.html"
    
    
    
    func Scrapping(){
        let requestUrl = URL(string: self.baseUrl)!
        

        let body: [String: String] = ["input": "eertpoessacdtrea"]

        let finalBody = try! JSONSerialization.data(withJSONObject: body)

        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { (data, response, error) in

            guard let data = data else {
              print("data was nil")
              return
            }
            guard let htmlString = String(data: data, encoding: .utf8) else {
              print("couldn't cast data into String")
              return
            }
            print(htmlString)
            
        }.resume()
        
        
        /*
        let task = URLSession.shared.dataTask(with: requestUrl) { (data, response, error) in
          guard let data = data else {
            print("data was nil")
            return
          }
          guard let htmlString = String(data: data, encoding: .utf8) else {
            print("couldn't cast data into String")
            return
          }
          print(htmlString)
        }
        */
    }
    
    

}
