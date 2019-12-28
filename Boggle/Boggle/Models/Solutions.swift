//
//  Solutions.swift
//  Boggle
//
//  Created by Hugo Meyer on 12/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI
import Foundation
import WebKit

struct ServerMessage: Decodable {
   let res, message: String
}

struct Solutions {

    
    
    
    
    func Scrapping(){
        let MyWebView: WKWebView!
        let baseUrl = URL (string: "https://france.pieroxy.net/blog/pages/ruzzle/fr.html")
        let letters = "eertpoessacdtrea"
        MyWebView.load(URLRequest(url: baseUrl!))
        let fillForm = String("document.getElementById('input').value = '\(letters)';")
        MyWebView.evaluateJavaScript(fillForm)

        
        
        MyWebView.evaluateJavaScript("document.body.innerHTML", completionHandler: { (value: Any!, error: Error!) -> Void in

            if error != nil {
                //Error logic
                return
            }

            let result = value as? String
            
            print(result)
            //Main logic
        })
        
        
        /*
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
        */
        
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
