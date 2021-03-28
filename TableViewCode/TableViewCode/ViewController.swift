//
//  ViewController.swift
//  TableViewCode
//
//  Created by flaviaamorim on 23/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    var tableView: UITableView = UITableView()
    let animals = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    let cellReuseIdentifier = "cell"
    let navBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: 44))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.title = "Table View".uppercased()
        tableView.contentInset = UIEdgeInsets.zero
        
        //            navigationController?.title = "Table View"
        self.navigationItem.title = "Teste"
        
        
        self.view.addSubview(tableView)
        setupNavBar()
        setupTableView()
    }
    
    func setupNavBar() {
        
        view.addSubview(navBar)

        let navItem = UINavigationItem(title: "SomeTitle")
        navBar.setItems([navItem], animated: false)
        
    }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
        
        cell.textLabel?.text = animals[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
}

