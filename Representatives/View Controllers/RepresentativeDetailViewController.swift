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
            loadViewIfNeeded()
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
    
    // Not sure how to populate these from the dictonary using the representative String that is passed from the table view of the representatives for the state.
        nameLabel.text = representative.name
        partyLabel.text = representative.party
        stateLabel.text = representative.state
        districtLabel.text = representative.district
        officeLabel.text = representative.office
        phoneLabel.text = representative.phone
        linkLabel.text = representative.link
    }
}
