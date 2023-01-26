//
//  TodoListViewController.swift
//  TestJLPT
//
//  Created by cmStudent on 11/01/2023.
//

import UIKit

class TodoListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ListViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateTableView()
    }
    
    fileprivate func updateTableView() {
        viewModel.fetchData()
        tableView.reloadData()
    }

    
    @IBAction func addAction(_ sender: Any) {
        alertWithTextField(with: "Add Item", "", "Add", "Cancel", "Enter Here") { text in
            
            if !text.isEmpty {
                self.viewModel.saveData(title: text)
                self.updateTableView()
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.listArray[indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
        
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteData(index: indexPath.row)
            updateTableView()
        }
    }
}
