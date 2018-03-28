//
//  APIManager.swift
//  RestAPIManager
//
//  Created by Appinventiv on 19/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//
import UIKit

class APIManager {
    
    func login(accessToken: String, success: @escaping (Entitites) -> Void){
        
        let headers = [
            "Cache-Control": "no-cache",
            "Postman-Token": "cbfe886a-1c41-4c9e-b36c-97001a446eb1"
        ]
        
        let baseURL = "https://graph.facebook.com/v2.12/me?fields=id%2Cname%2Cbirthday%2Ceducation&access_token=\(accessToken)"
        
        //MARK: --> Calling Network Manager
        NetworkManager().GET(headers: headers, url: baseURL, success:{ (data) in
            success(Entitites(fields: data))
        })
        { error in print(Error.self)}
    }
}
