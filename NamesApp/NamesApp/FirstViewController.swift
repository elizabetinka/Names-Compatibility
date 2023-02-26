//
//  ViewController.swift
//  NamesApp
//
//  Created by Елизавета Кравченкова on 23.02.2023.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var partnerNameField:UITextField!
    
    @IBOutlet weak var toResultButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? ResultViewController else {return}
        secondVC.firstName = nameField.text
        secondVC.secondName = partnerNameField.text
    }
    
    @IBAction func toResultTappted() {
        guard let firstName = nameField.text, let secondName = partnerNameField.text else {return}
        if firstName.isEmpty || secondName.isEmpty{
            showAlert(title: "Names are missing", message: "Please enter both names 🙃")
            return
        }
        performSegue(withIdentifier: "GoToResult", sender: nil)
    }
    
    @IBAction func unwindSegueToFirstVC(segue: UIStoryboardSegue){
        nameField.text=""
        partnerNameField.text=""
    }
    
}

extension FirstViewController{
    private func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okActions = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okActions)
        present(alert, animated: true)
    }
}

extension FirstViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // скрываем клавиатуру по табу на экране
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameField {
            partnerNameField.becomeFirstResponder()
        } else {
            toResultTappted()
        }
        return true
    }
}
