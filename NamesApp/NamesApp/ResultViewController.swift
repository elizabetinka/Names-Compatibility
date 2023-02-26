//
//  ResultViewController.swift
//  NamesApp
//
//  Created by Елизавета Кравченкова on 24.02.2023.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var namesLabel: UILabel!
    
    @IBOutlet weak var procentLabel: UILabel!
    
    @IBOutlet weak var progress: UIProgressView!
    
    var firstName : String!
    var secondName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namesLabel.text = "\(firstName ?? "") and \(secondName ?? "")"
        let result = findResult(number1: findValue(str: firstName), number2: findValue(str: secondName))
        progress.progress=Float(result)/100
        procentLabel.text = "\(result) %"
        procentLabel.text = result.formatted(.percent)
        progress.transform=progress.transform.scaledBy(x: 1, y:4 )
        // Do any additional setup after loading the view.
    }
    private func findValue (str: String) ->  Int{
        var ans = 0
        for character in str.lowercased(){
            switch character {
            case "a","i","j","q","y":
                ans+=1
        
            case "b","k","r":
                ans+=2
            
            case "c","g","l","s":
                ans+=3
            
            case "d","m","t":
                ans+=4
            
            case "e","h","n","x":
                ans+=5
                
            case "u","w","v":
                ans+=6
            
            case "o","z":
                ans+=7
            
            case "f","p":
                ans+=8
            default:
                ans+=0
            }
        }
        return ans
    }
    
    private func findResult(number1: Int, number2: Int) -> Int{
        var ans = 0
        ans = (number1+number2)*7
        if (ans>=100 && ans<=115) || ans==175 {
            ans=100
        }
        else{
            ans=ans%100
        }
        return ans
    }
}
