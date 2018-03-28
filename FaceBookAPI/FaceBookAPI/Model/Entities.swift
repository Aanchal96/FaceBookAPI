//
//  Entities.swift
//  RestAPIManager
//
//  Created by Appinventiv on 20/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import Foundation
struct Entitites{
    
    let id: String
    let name: String
    let birthDay: String
    let schoolName: String
    let collegeName: String
    let collegeCource: String
    
    init(fields: JSON){
        self.id = fields["id"].string ?? ""
        self.name = fields["name"].string ?? ""
        self.birthDay = fields["birthday"].string ?? "-------"
        self.schoolName = fields["education"][0]["school"]["name"].string ?? "-------"
        self.collegeName = fields["education"][1]["school"]["name"].string ?? "-------"
        self.collegeCource = fields["education"][1]["concentration"][0]["name"].string ?? "-------"
    }
}
