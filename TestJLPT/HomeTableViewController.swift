//
//  HomeTableViewController.swift
//  TestJLPT
//
//  Created by cmStudent on 21/12/2022.
//

import UIKit

class HomeTableViewController : UIViewController, UITableViewDataSource, UITableViewDelegate, HomeTableCellDelegate {
    
    @IBOutlet var tableView : UITableView!
    
    let datas = [
        "202107",
        "202012",
        "201912",
        "201907",
        "201812",
        "201807",
        "201712",
        "201707",
        "201612",
        "201607",
        "201512",
        "201507",
        "201412",
        "201407",
        "201312",
        "201307",
        "201212",
        "201207",
        "201112",
        "201107",
        "201012",
        "201007",
        "200912",
        "200907",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        

    }
    
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell",for: indexPath) as! HomeTableViewCell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeTableViewCell
        //cell.textLabel?.text = datas[indexPath.row]
        cell.delegate = self
        
        cell.config(with: datas[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("Tapped")
        //performSegue(withIdentifier: "goToQuestion", sender: "\(datas[indexPath.row])")
        
    }

    func didTapAction(with title: String) {
        print("\(title)")
        performSegue(withIdentifier: "goToQuestion", sender: "\(title)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            //Only Model, data can be assign/ preconfigure
            if segue.identifier == "goToQuestion" {
                let name = sender as! String
                let detailVC = segue.destination as! ViewController
                detailVC.collectionName = name
            }
            
        }

}
