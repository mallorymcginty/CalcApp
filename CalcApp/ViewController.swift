//
//  ViewController.swift
//  CalcApp
//
//  Created by Ivor D. Addo, PhD on 2/15/17.
//  Copyright © 2017 Mallory McGinty. All rights reserved.
//

import UIKit

    enum modes
    {
        case not_set
        case addition
        case subtraction
        case multiplication
    }
    
    
    
    
    
    
    
class ViewController: UIViewController
{
    
    var results:String = "0"
    var currentMode:modes = .not_set
    //Short-hand approach
    var savedNum:Int = 0
    var lastButtonWasMode:Bool = false
    
    
    
    //For results label
    @IBOutlet weak var lblResults: UILabel!
    
    //For orange buttons
    @IBAction func btnClear_Touch(_ sender: Any)
    {
        results = "0"
        currentMode = .not_set
        savedNum = 0
        lastButtonWasMode = false
        lblResults.text = "0"
    }
    
    @IBAction func btnAdd_Touch(_ sender: Any)
    {
        changeMode(newMode: .addition)
    }
    
    @IBAction func btnSubtract_Touch(_ sender: Any)
    {
        changeMode(newMode: .subtraction)
    }
    
    @IBAction func btnMultiply_Touch(_ sender: Any)
    {
        changeMode(newMode: .multiplication)
    }
    
    @IBAction func btnEquals_Touch(_ sender: Any)
    {
        guard let resultsInt:Int = Int(results)
        else
        {
            return
        }
        
        if (lastButtonWasMode)
        {
            return
        }
        
        //Switch ... case
        switch  currentMode
        {
        case .not_set: return
        case .addition: savedNum += resultsInt
        case .subtraction: savedNum -= resultsInt
        case .multiplication: savedNum *= resultsInt
        }
        
        currentMode = .not_set
        results = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
    }
    
    //For number buttons
    @IBAction func btnNumber_Touch(_ sender: UIButton)
    {
        //Optional
        let selectedNumber:String? = sender.titleLabel?.text
        
        if (lastButtonWasMode)
        {
            lastButtonWasMode = false
            results = "0"
        }
        
        //Unwrap
        results = results.appending(selectedNumber!)
        
        //Call the update text method
        updateText()
    }
    
    
    //Functions
    func updateText()
    {
        guard let resultsInt:Int = Int(results)
        else
        {
            return
        }
        
        if (currentMode == .not_set)
        {
            savedNum = resultsInt
        }
        
        let formatter:NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        let num:NSNumber = NSNumber(value: resultsInt)
        lblResults.text = "\(resultsInt)"
        
        //lblResults.text = "\(num)" ???????
    }
    
    
    func changeMode(newMode:modes)
    {
        if (savedNum == 0)
        {
            return
        }
        
        currentMode = newMode
        lastButtonWasMode = true
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

