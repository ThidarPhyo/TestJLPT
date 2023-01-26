//
//  ProfileViewController.swift
//  TestJLPT
//
//  Created by cmStudent on 10/01/2023.
//

import UIKit

class ProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
    }
    
    
    
    @IBAction func profileDetailAction(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "proDetail") as! ProfileDetailViewController
        self.present(vc, animated: true, completion: nil)
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
        
//        cell.textLabel?.text = "thidar\(indexPath.row)"
        if indexPath.row == 1 {
            cell.nameLB.text = "Rate App"
        } else if indexPath.row  == 2 {
            cell.nameLB.text = "App Version"
        } else if indexPath.row  == 3 {
            cell.nameLB.text = "Feedback"
        } else {
            cell.nameLB.text = "About Us"
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
