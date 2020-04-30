//
//  NewBookViewController.swift
//  Homework12(1)
//
//  Created by Kato on 4/30/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class NewBookViewController: UIViewController {
    
    var bookInfo: [Info] = []
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onAddBookTapped(_ sender: UIButton) {
        
        let newInfo = Info()
        newInfo.bookName = nameTextField.text!
        newInfo.bookAuthor = authorTextField.text!
        
        if newInfo.bookName == "" || newInfo.bookAuthor == "" {
            let alert1 = UIAlertController(title: "Try Again", message: "You must enter information in all fields in order to continue.", preferredStyle: .alert)
            alert1.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert1, animated: true, completion: nil)
        }
        else {
        
        bookInfo.append(newInfo)
        
        if let firstViewController = self.navigationController?.viewControllers.first {
            let vc = firstViewController as! ViewController
            vc.finalBookInfo = self.bookInfo
            vc.tableView.reloadData()
            self.navigationController?.popToViewController(firstViewController, animated: true)
        }
        }

    }

}

class Info {
    
    var bookName = ""
    var bookAuthor = ""
    
}
