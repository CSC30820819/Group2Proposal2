//
//  ImageViewController.swift
//  Group2Proposal2
//
//  Created by Makendra Phipps on 4/7/26.
//

import UIKit

class ImageViewController: UIViewController {

    var selectedImage: String?
    
    @IBOutlet weak var previewImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        previewImage.image = UIImage(named: selectedImage ?? "")
    }
    

}
