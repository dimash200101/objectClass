//
//  LogViewController.swift
//  objectClass
//
//  Created by Dinmukhammed on 08.06.2022.
//  Copyright © 2022 Galym Anuarbek. All rights reserved.
//

import Foundation
import UIKit

class LogViewController: UIViewController {
    
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    private let minLength = 6
    private lazy var regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{\(minLength),}$"
    private let pass = "Qwerty123"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        
        user.delegate = self
        textField.delegate = self
        username.numberOfLines = 0
        password.numberOfLines = 0
        

    }
    
    func assignbackground(){
            let background = UIImage(named: "1")

            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        }
    
    private func checkValidation(pass: String) {
        guard pass.count >= minLength else {
            label.text = ""
            return
        }
        
        if pass.matches(regex) {
            label.textColor = .green
            label.text = "No problems"
        } else {
            label.textColor = .blue
        }
    }
    @IBAction func act(_ sender: Any) {
        if textField.text == pass && user.text == "admin" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "RoomViewController") as UIViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
}

extension LogViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text ?? "") + string
        let res: String
        
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            res = String(text[text.startIndex..<end])
        } else {
            res = text
        }
        
        checkValidation(pass: res)
        textField.text = res
        return false
                
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let isSuccess = (textField.text == pass)
        label.textColor = isSuccess ? .green : .red
        label.text = isSuccess ? "Success" : "Error"
        textField.resignFirstResponder()

        return true
    }
}

extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
