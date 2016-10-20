//
//  SurveyController.swift
//  Survey
//
//  Created by Jeff Norton on 10/20/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import Foundation

class SurveyController {
    
    //==================================================
    // MARK: - Properties
    //==================================================
    
    static let baseURL = URL(string: "https://cslanguagesurvey.firebaseio.com/api/survey")
    
    static let getAllSurveysEndpoint = baseURL?.appendingPathExtension("json") 
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    static func putSurveyIntoAPI(withName name: String, andLanguage language: String) {
        
        // Create an instance
        
        let survey = Survey(name: name, language: language)
        
        // Unwrap our URL
        
        guard let putEndpointURL = survey.putEndpoint else { return }
        
        // Make the PUT request
        
        NetworkController.performRequest(for: putEndpointURL, httpMethod: .Put, body: survey.jsonData) { (data, error) in
            
            let responseDataString = String(data: data!, encoding: .utf8) ?? ""
            
            if error != nil {
                
                NSLog("Error: \(error?.localizedDescription)")
                
            } else if responseDataString.contains("error") {
                
                NSLog("Error: \(responseDataString)")
                
            } else {
                
                NSLog("Successfully saved data to the PUT endpoint.\nResponse: \(responseDataString)")
            }
        }
    }
}














