//
//  Representative.swift
//  Representatives
//
//  Created by John Tate on 9/3/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

import Foundation

struct RepresentativeDictionary: Codable {
    
    let results: [Representative]
    
//    private enum CodingKeys: String, CodingKey {
//        case representatives = "results"
//    }
}

struct Representative: Codable {
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
}


