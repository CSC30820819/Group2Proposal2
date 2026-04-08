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
        Member(name: "Makendra Phipps", role: "Developer & Management", notes: "Responsible for timeline and developing code (Cart Functionality).", imageName: "MPheadshot.jpg"),
        Member(name: "Jenna Kramer", role: "Developer & Design", notes: "Focusing on UI/UX and developing code (Category Views).", imageName: "JKheadshot.jpg"),
        Member(name: "Harrison Mesplay", role: "Developer & Testing", notes: "Focusing on asset and inventory management.", imageName: "HMheadshot.jpg")
    ]
    
    let projectList = ["Frontend", "Backend", "UI/UX Design"]
    
    
    
    let previewUIs = ["Launch Screen", "Home Page", "Product Page Sample"]
    
    let previewUIImage = ["launchScreenSample", "homeScreenSample", "productScreenSample"]
    
    let section1Color = [UIColor(red: 52.0/255.0, green: 199.0/255.0, blue: 89.0/255.0, alpha: 1), UIColor(red: 52.0/255.0, green: 247.0/255.0, blue: 83.0/255.0, alpha: 1), UIColor(red: 175.0/255.0, green: 247.0/255.0, blue: 83.0/255.0, alpha: 1)]
    
    let section2Color = [UIColor(red: 255.0/255.0, green: 221.0/255.0, blue: 192.0/255.0, alpha: 1), UIColor(red: 247.0/255.0, green: 168.0/255.0, blue: 149.0/255.0, alpha: 1), UIColor(red: 220.0/255.0, green: 152.0/255.0, blue: 151.0/255.0, alpha: 1)]
    
    let section3Color = [UIColor(red: 161.0/255.0, green: 229.0/255.0, blue: 208.0/255.0, alpha: 1), UIColor(red: 202.0/255.0, green: 249.0/255.0, blue: 249.0/255.0, alpha: 1), UIColor(red: 98.0/255.0, green: 188.0/255.0, blue: 247.0/255.0, alpha: 1)]
    
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
        else if segue.identifier == "goToProject" {
            if let destinationVC = segue.destination as? ProjectViewController,
                let selectedProject = sender as? String {
                destinationVC.selectedProject = selectedProject
            }
        }
        else if segue.identifier == "goToImage"{
            if let destinationVC = segue.destination as? ImageViewController,
               let selectedImage = sender as? String {
                destinationVC.selectedImage = selectedImage
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
        
        var config = UIBackgroundConfiguration.listCell()
        
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = members[indexPath.row].name
            config.backgroundColor = section1Color[indexPath.row]
            cell.backgroundConfiguration = config
        case 1:
            
            cell.textLabel?.text = projectList[indexPath.row]
            config.backgroundColor = section2Color[indexPath.row]
            cell.backgroundConfiguration = config
        case 2:

            var content = cell.defaultContentConfiguration()
            
            content.text = previewUIs[indexPath.row]
            content.image =  UIImage(named: previewUIImage[indexPath.row])
            
            content.imageProperties.maximumSize = CGSize(width: 100, height: 100)
            content.imageProperties.reservedLayoutSize = CGSize(width: 100, height: 100)
            content.imageProperties.cornerRadius = 8
            
            cell.contentConfiguration = content
            
            config.backgroundColor = section3Color[indexPath.row]
            cell.backgroundConfiguration = config
        default:
            break
        }
        
 
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section{
        case 0:
                let selectedMember = members[indexPath.row]
                // Triggers the manual segue set up in Storyboard
                performSegue(withIdentifier: "goToMember", sender: selectedMember)
            break
            
        case 1:
                let selectedProject = projectList[indexPath.row]
                performSegue(withIdentifier: "goToProject", sender: selectedProject)
            break
            
        case 2:
            let selectedImage = previewUIImage[indexPath.row]
            performSegue(withIdentifier: "goToImage", sender: selectedImage)
        default:
            break
        
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
