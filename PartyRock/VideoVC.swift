//
//  VideoVC.swift
//  PartyRock
//
//  Created by Luke Klepfer on 9/27/16.
//  Copyright © 2016 Luke. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var lbl: UILabel!
    
    
    private var _partyRock: PartyRock!
    
    var partyRock: PartyRock {
        get{
            return _partyRock
        }
        set{
            _partyRock = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbl.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
        
    }


}
