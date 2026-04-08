//
//  ProjectViewController.swift
//  Group2Proposal2
//
//  Created by Mesplay, Harrison W. on 4/8/26.
//

import UIKit

class ProjectViewController: UIViewController {
    //passed from viewcontroller
    var selectedProject: String?
    //outlets
    @IBOutlet weak var selectedLabel: UILabel!
    @IBOutlet var notesLabel: [UILabel]!
    //notes array
    var frontendNotes: [String] = [
        "The frontend of the Food2Go app will be developed using Swift and UIKit in Xcode.",
        "It will include user interfaces such as category list, product list, and cart view.",
        "Users will interact with buttons, steppers, and navigation controllers to browse groceries and place orders."
    ]
    var backendNotes: [String] = [
        "The backend will handle data storage and process any other needed information.",
        "This will also be done using Swift in Xcode due to project requirements.",
        "In the future external APIs may be used to retrieve data from a database or other sources."
    ]
    var UINotes: [String] = [
        "The UI design was made while focusing on a clean and user friendly layout.",
        "The app will use organized categories, clear labels, and easy navigation to ensure grocery shopping.",
        "Colors and spacing were chosen to create a visually appealing and cohesive design."
    ]
    //func for updating notes
    func updateNotes(notes : [String]) {
        for i in 0..<notes.count {
            notesLabel[i].text = notes[i]
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //update label based on selectedProject
        selectedLabel.text = selectedProject
        //update note labels based on selectedProject
        if selectedProject == "Frontend" {
            updateNotes(notes: frontendNotes)
        }else if selectedProject == "Backend" {
            updateNotes(notes: backendNotes)
        }else if selectedProject == "UI/UX Design" {
            updateNotes(notes: UINotes)
        }
    }
}
