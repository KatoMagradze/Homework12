//
//  ViewController.swift
//  Homework12(1)
//
//  Created by Kato on 4/30/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var finalBookInfo: [Info] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "addbooks_vc", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! NewBookViewController
        vc.bookInfo = self.finalBookInfo
    }
    

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalBookInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell-identifier", for: indexPath) as! CustomTableViewCell
        
        cell.nameLabel.text = finalBookInfo[indexPath.row].bookName
        cell.authorLabel.text = finalBookInfo[indexPath.row].bookAuthor
        
        
        return cell
    }
}

