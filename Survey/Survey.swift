//
//  Survey.swift
//  Survey
//
//  Created by Jeff Norton on 10/20/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import Foundation

struct Survey {
    
    //==================================================
    // MARK: - Properties
    //==================================================
    
    let identifier: UUID
    let name: String
    let language: String
    
    var endpoint: URL? {
        
        
    }
    
    //==================================================
    // MARK: - Initializer
    //==================================================
    
    init(identifier: UUID = UUID(), name: String, language: String) {
        
        self.identifier = identifier
        self.name = name
        self.language = language
    }
}

// JSON conversion support

extension Survey {
    
    //==================================================
    // MARK: - Properties
    //==================================================
    
    private static let nameKey = "name"
    private static let languageKey = "language"
    
    // Provide a dictionary representation of this Survey instance
    var jsonValue: [String : Any] {
        
        return [Survey.nameKey: self.name, Survey.languageKey: self.language]
    }
    
    // Provide a JSON representation of a dictionary representation of this Survey instance
    var jsonData: Data? {
        
        return try? JSONSerialization.data(withJSONObject: jsonValue, options: .prettyPrinted)
    }
    
    //==================================================
    // MARK: - Initializers
    //==================================================
    
    init?(identifier: String, dictionary: [String : Any]) {
        
        // Converting from a dictionary into an instance of Survey
        
        guard let identifier = UUID(uuidString: identifier)
            , let name = dictionary[Survey.nameKey] as? String
            , let language = dictionary[Survey.languageKey] as? String
            else { return nil }
        
        self.init(identifier: identifier, name: name, language: language)
    }
}












