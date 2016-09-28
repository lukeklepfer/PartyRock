//
//  ViewController.swift
//  PartyRock
//
//  Created by Luke Klepfer on 9/27/16.
//  Copyright © 2016 Luke. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var partyRocks = [PartyRock]()
    
    let burn = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/yI2oS2hoL0k\" frameborder=\"0\" allowfullscreen></iframe>"
    let midnight = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/EkMxw2tWlpc\" frameborder=\"0\" allowfullscreen></iframe>"
    let whatcha = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ru3gH27Fn6E\" frameborder=\"0\" allowfullscreen></iframe>"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "https://i.ytimg.com/vi/yI2oS2hoL0k/hqdefault.jpg", videoURL: burn, videoTitle: "Burn The Witch")
        let p2 = PartyRock(imageURL: "https://i.ytimg.com/vi/EkMxw2tWlpc/hqdefault.jpg", videoURL: midnight, videoTitle: "Midnight")
        let p3 = PartyRock(imageURL: "https://i.ytimg.com/vi/ru3gH27Fn6E/hqdefault.jpg", videoURL: whatcha, videoTitle: "Whatcha Want?")
        let p4 = PartyRock(imageURL: "https://i.ytimg.com/vi/yI2oS2hoL0k/hqdefault.jpg", videoURL: burn, videoTitle: "Burn The Witch")
        let p5 = PartyRock(imageURL: "https://i.ytimg.com/vi/EkMxw2tWlpc/hqdefault.jpg", videoURL: midnight, videoTitle: "Midnight")
        let p6 = PartyRock(imageURL: "https://i.ytimg.com/vi/ru3gH27Fn6E/hqdefault.jpg", videoURL: whatcha, videoTitle: "Whatcha Want?")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        partyRocks.append(p6)
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell{
            
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC{
            
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }
}

