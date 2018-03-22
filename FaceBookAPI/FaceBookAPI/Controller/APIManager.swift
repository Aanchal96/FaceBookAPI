//
//  APIManager.swift
//  RestAPIManager
//
//  Created by Appinventiv on 19/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//
import UIKit

class APIManager {

    func loginGet(accessToken: String, success: @escaping (Entitites) -> Void){

        let headers = [
            "Cache-Control": "no-cache",
            "Postman-Token": "cbfe886a-1c41-4c9e-b36c-97001a446eb1"
        ]
     
        let baseURL = "https://graph.facebook.com/v2.12/me?fields=id%2Cname%2Cbirthday%2Ceducation&access_token=\(accessToken)"
        
        NetworkManager().GET(headers: headers, url: baseURL, success:{ (data) in
            success(Entitites(fields: data))}){error in print(Error.self)}
    }
    
//    func loginPost(params: [String:Any],onSuccess success: @escaping (Entitites) -> Void){
//        
//        let parameters = [
//            [
//                "name": "Username",
//                "value": "Aanchal"
//            ],
//            [
//                "name": "Password",
//                "value": "12345"
//            ]
//        ]
//        
//        let headers = [
//            "content-type": "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
//            "Cache-Control": "no-cache",
//            "Postman-Token": "aa8e1c98-3cbf-4d74-ac99-504c274a91a5"
//        ]
//        
//        let baseURL = "https://httpbin.org/post"
//        
//        let boundary = "----WebKitFormBoundary7MA4YWxkTrZu0gW"
//        
//        var body = ""
//        let error: NSError? = nil
//        for param in parameters {
//            let paramName = param["name"]!
//            body += "--\(boundary)\r\n"
//            body += "Content-Disposition:form-data; name=\"\(paramName)\""
//            if let filename = param["fileName"] {
//                let contentType = param["content-type"]!
//                let fileContent = try! String(contentsOfFile: filename, encoding: String.Encoding.utf8)
//                if (error != nil) {
//                    print(error!)
//                }
//                body += "; filename=\"\(filename)\"\r\n"
//                body += "Content-Type: \(contentType)\r\n\r\n"
//                body += fileContent
//            }
//            else if let paramValue = param["value"] {
//                body += "\r\n\r\n\(paramValue)"
//            }
//        }
//        
//        NetworkManager().POST(headers: headers, url: baseURL){ (data) in
//            for(key,value) in data{
//                if key == "args"{
//                    success(Entitites(args: (value as? [String:Any])!))}
//            }
//        }
//    }
}
