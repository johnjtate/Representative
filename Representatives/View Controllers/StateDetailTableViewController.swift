//
//  StateDetailTableViewController.swift
//  Representatives
//
//  Created by John Tate on 9/3/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController, RepresentativeTableViewCellDelegate {
    
    func representativeTapped(_ cell: RepresentativeTableViewCell) {
        
    }
    

    // landing pad for segue
    var state: String? {
        didSet {
            loadViewIfNeeded()
            updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    var arrayOfReps: [Representative] = []
    
    func updateView() {
        
        guard let state = state else { return }
        RepresentativeController.shared.searchRepresentatives(forState: state) { (results) in
            
            DispatchQueue.main.async {
                guard let queryResults = results else { return }
                self.arrayOfReps = queryResults
            }
        }
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayOfReps.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! RepresentativeTableViewCell
        cell.delegate = self
        guard let rep = arrayOfReps[indexPath.row] else { return UITableViewCell() }
        cell.nameLabel.text = rep.name
        cell.districtLabel.text = rep.district
        return cell
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRepresentativeDetails" {
            guard let detailVC = segue.destination as? RepresentativeDetailViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
            let representative = arrayOfReps[indexPath.row]
            detailVC.representative = representative
        }
    }

}
