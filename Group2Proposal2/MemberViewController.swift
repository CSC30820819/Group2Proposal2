//
//  MemberViewController.swift
//  Group2Proposal2
//
//  Created by Kramer, Jenna L. on 4/7/26.
//

import UIKit

class MemberViewController: UIViewController {

    @IBOutlet weak var memberImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    var selectedMember: Member?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        displayMemberData()
    }
    
    private func setupUI() {
        memberImageView.contentMode = .scaleAspectFill
        memberImageView.clipsToBounds = true
        memberImageView.layer.cornerRadius = 15
        
        notesLabel.numberOfLines = 0
        self.navigationItem.title = ""
            }
    
    private func displayMemberData() {
        guard let member = selectedMember else { return }
        
        title = member.name
        nameLabel.text = member.name
        roleLabel.text = "Role: \(member.role)"
        notesLabel.text = member.notes
        
        if !member.imageName.isEmpty, let image = UIImage(named: member.imageName) {
            memberImageView.image = image
        } else {
            memberImageView.image = UIImage(systemName: "person.circle.fill")
            memberImageView.tintColor = .systemGray
        }
        self.navigationItem.title = ""
        
    }
}
