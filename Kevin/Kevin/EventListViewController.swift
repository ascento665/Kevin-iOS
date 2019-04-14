// Created by Julian Dunskus

import UIKit

class EventListViewController: UITableViewController {
	var events: [Event] = [
		Event(image: #imageLiteral(resourceName: "placeholder1.jpg"), date: Date(), outcome: nil),
		Event(image: #imageLiteral(resourceName: "placeholder2.jpg"), date: Date().addingTimeInterval(65), outcome: .accepted),
		Event(image: #imageLiteral(resourceName: "placeholder3.jpg"), date: Date().addingTimeInterval(3842), outcome: .rejected),
	] {
		didSet { tableView.reloadData() }
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.reloadData()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let eventViewController = segue.destination as? EventViewController {
			eventViewController.event = events[tableView.indexPathForSelectedRow!.row]
		} else {
			fatalError()
		}
	}
	
	// MARK: - Table view data source
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return events.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return tableView.dequeue(EventCell.self, for: indexPath)! <- {
			$0.event = events[indexPath.row]
		}
	}
}
