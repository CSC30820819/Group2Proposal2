//
//  ViewController.swift
//  Group2Proposal2
//
//  Created by Makendra Phipps on 4/7/26.
//

import UIKit

class ViewController: UIViewController {

    let groupNames = ["Makendra Phipps", "Jenna Kramer", "Harrison Mesplay"]
    
    let projectList = ["Frontend", "Backend", "UI/UX Design"]
    
    let previewUIs = ["App Icon", "Home Page", "Product Page"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("VIEW DID LOAD")
        view.backgroundColor = .red
    }


}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("#1.", #function)
        switch section{
        case 0:
            return groupNames.count
        case 1:
            return projectList.count
        case 2:
            return previewUIs.count
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //#2. put data into the cell
        switch indexPath.section{
        case 0:
            cell.textLabel?.text = groupNames[indexPath.row]
        case 1:
            cell.textLabel?.text = projectList[indexPath.row]
        case 2:
            cell.textLabel?.text = previewUIs[indexPath.row]
        default:
            break
        }
        
        //#3. Return the cell
        return cell //for a cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Group Members"
        case 1:
            return "Project"
        case 2:
            return "UI Previews"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Project Roles"
        case 1:
            return "Project Descriptions"
        case 2:
            return "Thumbnails"
        default:
            return nil
        }
    }
}

