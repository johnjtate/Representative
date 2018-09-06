//
//  RepresentativeDetailViewController.swift
//  Representatives
//
//  Created by John Tate on 9/3/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

import UIKit

class RepresentativeDetailViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var officeLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    var representative: Representative? {
        didSet {
            updateView()
        }
    }
    

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Cell Setup
    
    func updateView() {
    
        guard let representative = representative else { return }
        
        DispatchQueue.main.async {
            self.nameLabel.text = representative.name
            self.partyLabel.text = representative.party
            self.stateLabel.text = representative.state
            self.districtLabel.text = representative.district
            self.officeLabel.text = representative.office
            self.phoneLabel.text = representative.phone
            self.linkLabel.text = representative.link
        }
    }
}
