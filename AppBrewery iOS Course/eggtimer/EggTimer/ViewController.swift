//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggBoilTimes : Dictionary<String, Int> = [
        "Soft": 5,
        "Medium": 7,
        "Hard": 12,
    ]
    
    var secondsPassed : Int?
    var secondsTotal : Int?
    
    var timer : Timer?
    var player: AVAudioPlayer!
    var url : URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
    }
    
    
    @IBAction func eggPressed(_ sender: UIButton) {
        timer?.invalidate()
        
        progressBar.progress = 0
        secondsPassed = 0
        secondsTotal = eggBoilTimes[sender.currentTitle!]! * 60
        titleLabel.text = sender.currentTitle!
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil,  repeats: true )
    }
    
    @objc func update() {
        if secondsPassed! < secondsTotal! {
            progressBar.progress = Float(secondsPassed!) / Float(secondsTotal!)
            secondsPassed! += 1
        } else {
            progressBar.progress = Float(secondsPassed!) / Float(secondsTotal!)
            titleLabel.text = "DONE!"
            player.play()
            timer!.invalidate()
        }
    }
    

}
