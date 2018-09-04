//
//  RepresentativeTableViewCell.swift
//  Representatives
//
//  Created by John Tate on 9/3/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

import UIKit

// Step 1--Create the protocol
protocol RepresentativeTableViewCellDelegate: class {
    func representativeTapped(_ cell: RepresentativeTableViewCell)
}

class RepresentativeTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
 
    // Step 2--Create a handle
    weak var delegate: RepresentativeTableViewCellDelegate?
    
    var respresentative: Representative? {
        didSet {
            populateCell()
        }
    }
    
    func populateCell() {
        guard let representative = respresentative else { return }
        nameLabel.text = representative.name
        districtLabel.text = representative.district
    }
    

    // Step 3
    // Not sure hot to implement the delegate for the custom cell, as the custom cell doesn't really do anything (e.g., toggle image when a button is tapped), as it had in previous projects.  
    delegate?.representativeTapped(cell: self)
    
}
