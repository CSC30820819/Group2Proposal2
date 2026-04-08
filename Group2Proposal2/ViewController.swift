//
//  ViewController.swift
//  Group2Proposal2
//
//  Created by Makendra Phipps on 4/7/26.
//

import UIKit

struct Member {
    let name: String
    let role: String
    let notes: String
    let imageName: String
}

class ViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    // YOU WILL HAVE TO CHANGE THE IMAGENAME PROPERTY TO MATCH YOUR HEADSHOT!!
    // ALSO IGNORE THE ROLES WE DONT NEED TO STICK TO THEM... I JUST THOUGHT THEY WOULD MAKE US SOUND MORE PROFESSIONAL AND ORGANIZED OR SOMETHING
    
    let members = [
        Member(name: "Makendra Phipps", role: "Developer & Management", notes: "Responsible for timeline and developing code.", imageName: ""),
        Member(name: "Jenna Kramer", role: "Developer & Design", notes: "Focusing on UI/UX and developing code.", imageName: "JKheadshot.jpg"),
        Member(name: "Harrison Mesplay", role: "Developer & Testing", notes: "Focusing on asset and inventory management.", imageName: "")
    ]
    
    let projectList = ["Frontend", "Backend", "UI/UX Design"]
    let previewUIs = ["App Icon", "Home Page", "Product Page"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = ""
        tableView.dataSource = self
        tableView.delegate = self
        
        title = "Group Project Proposal"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemGroupedBackground
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMember" {
            if let destinationVC = segue.destination as? MemberViewController,
               let memberData = sender as? Member {
                destinationVC.selectedMember = memberData
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return members.count
        case 1: return projectList.count
        case 2: return previewUIs.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = members[indexPath.row].name
        case 1:
            cell.textLabel?.text = projectList[indexPath.row]
        case 2:
            cell.textLabel?.text = previewUIs[indexPath.row]
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let selectedMember = members[indexPath.row]
            // Triggers the manual segue set up in Storyboard
            performSegue(withIdentifier: "goToMember", sender: selectedMember)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let headers = ["Team Members", "Project", "UI Previews"]
        return headers[section]
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let footers = ["Tap a member for details", "Project components", "Thumbnails"]
        return footers[section]
    }
}
