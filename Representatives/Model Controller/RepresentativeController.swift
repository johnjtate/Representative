//
//  RepresentativeController.swift
//  Representatives
//
//  Created by John Tate on 9/3/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

import UIKit

class RepresentativeController {
    
    static let shared = RepresentativeController()
    
    var reps: [Representative] = []
    
    private let baseURLString = "https://whoismyrepresentative.com/getall_reps_bystate.php"
    
    func searchRepresentatives(forState: String, completion: @escaping ([Representative]?) -> Void) {
    
        guard let baseURL = URL(string: baseURLString) else {
            fatalError("Bad base URL")
        }
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let queryItems = URLQueryItem(name: "state", value: "\(forState)")
        let queryItem2 = URLQueryItem(name: "output", value: "json")
        components?.queryItems = [queryItems, queryItem2]
        
        guard let url = components?.url else { completion([]); return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("There was an error searching from dataTask \(#function) \(error) \(error.localizedDescription)")
                completion([]); return
            }
            
            guard let dataThatCameBack = data else { print("No data returned"); completion([]); return }
            
            /*
             whoismyrepresentative.com incorrectly encodes letters with diacrtic marks, e.g. ú using
             extended ASCII, not UTF-8. This means that trying to convert the data to a string using .utf8 will
             fail for some states, where the representatives have diacritics in their names.
             
             To workaround this, we decode into a string using ASCII, then reencode the string as data using .utf8
             before passing the fixed UTF-8 data into the JSON decoder.
             */
            
            let asciiStringFromData = String(data: dataThatCameBack, encoding: .ascii)
            let dataAsUTF8 = Data(asciiStringFromData!.utf8)
            
            do {
                let representatives = try JSONDecoder().decode(RepresentativeDictionary.self, from: dataAsUTF8).results
                self.reps = representatives
                completion(representatives)
            } catch let error {
                print("There was an error decoding our object \(error) \(error.localizedDescription)")
                completion([]); return
            }
        }.resume()
        
    }
    
    
    
    
    
}

