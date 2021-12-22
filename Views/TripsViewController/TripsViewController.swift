//
//  TripsViewController.swift
//  ItineraryApp
//
//  Created by Nguyễn Đình Trung Đức on 20/12/2021.
//

import UIKit

class TripsViewController: UIViewController {

    
    @IBOutlet weak var addButton: FloatingActionButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        // Code sẽ call khi completion handler được call 
        TripFunction.readTrip(completion: { [weak self] in
            // Completion
            self?.tableView.reloadData()
        })
        
        view.backgroundColor = Theme.background
        
        //addButton.createFloatingActionButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue" {
            let popup = segue.destination as! AddTripsViewController
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}
extension TripsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TripTableViewCell
        cell.setUp(tripModel: Data.tripModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let trip = Data.tripModels[indexPath.row]
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerform: @escaping (Bool) -> ()) in
            let alert = UIAlertController(title: "Delete Trip", message: "Do you want to delete this trip \(trip.title)"
                                          , preferredStyle: .alert)
            
            // Each action contain each button, cancel button and delete button 
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { alertAction in
                actionPerform(false)
            }))
            
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { alertAction in
                // perform delete
                TripFunction.deleteTrip(index: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerform(true)
            }))
            
            self.present(alert, animated: true)
        }
        delete.image = UIImage.init(named: "DeleteIcon")
        return UISwipeActionsConfiguration(actions: [delete])
    }
}
