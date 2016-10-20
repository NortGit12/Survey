//
//  SurveyViewController.swift
//  Survey
//
//  Created by Jeff Norton on 10/20/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {
    
    //==================================================
    // MARK: - Properties
    //==================================================
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var languageTextField: UITextField!
    
    //==================================================
    // MARK: - General
    //==================================================

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //==================================================
    // MARK: - Actions
    //==================================================
    
    @IBAction func submittButtonTapped(_ sender: UIButton) {
        
        nameTextField.resignFirstResponder()
        languageTextField.resignFirstResponder()
        
        guard let name = nameTextField.text
            , let language = languageTextField.text
            , !name.isEmpty && !language.isEmpty else { return }
        
        SurveyController.putSurveyIntoAPI(withName: name, andLanguage: language)
        
        nameTextField.text = ""
        languageTextField.text = ""
    }
}













