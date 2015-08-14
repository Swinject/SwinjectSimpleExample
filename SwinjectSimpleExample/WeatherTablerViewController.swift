//
//  WeatherTablerViewController.swift
//  SwinjectSimpleExample
//
//  Created by Yoichi Tagaya on 8/10/15.
//  Copyright © 2015 Swinject Contributors. All rights reserved.
//

import UIKit

class WeatherTablerViewController: UITableViewController {
    var weatherFetcher: WeatherFetcher?
    private var cities = [City]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        weatherFetcher?.fetch {
            if let cities = $0 {
                self.cities = cities
            }
            else {
                let title = "Error"
                let message = "Cannot communicate with the weather server. Check wi-fi or cellular network settings."
                let dismiss = "Dismiss"
                let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: dismiss, style: .Default) { _ in
                    alert.dismissViewControllerAnimated(true, completion: nil)
                })
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let city = cities[indexPath.row]
        cell.textLabel?.text = city.name
        cell.detailTextLabel?.text = city.weather
        return cell
    }
}
