//
//  ViewController.swift
//  PostAPICallSwiftcourse
//
//  Created by Sainath Bamen on 23/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PostApi()
    }
    func PostApi(){
        let url = URL(string: "https://trains.p.rapidapi.com/")  
        guard url != nil else{
            print("Error")
            return
        }
        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        let headers = ["content-type": "application/json",
                       "x-rapidapi-host": "trains.p.rapidapi.com",
                       "x-rapidapi-key:": "00ab76053cmshfb85d0da8ddbadcp1bb580jsn5e5e619aa0e0"
        ]
        request.allHTTPHeaderFields = headers
        request.httpMethod = "POST"
        
        let requestObject = ["search": "Rajdhani"]
        
        do{
            let requestBody = try JSONSerialization.data(withJSONObject: requestObject, options: .fragmentsAllowed)
            request.httpBody = requestBody
        }catch{
            print("error")
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let parsingData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    print(parsingData)
                } catch {
                    print("Parsing Error")
                }
            } else if let error = error {
                print("Error: \(error)")
            }
        }
        dataTask.resume()

        
    }
    
}
    
    
    


