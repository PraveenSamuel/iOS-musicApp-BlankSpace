//
//  ViewController.swift
//  musicApp
//
//  Created by Praveen Samuel . J on 07/10/16.
//  Copyright © 2016 Praveen Samuel . J. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    
    var audioPlayer = AVAudioPlayer()
    
    var playPauseButton = UIBarButtonItem()

    var musicPaused: Bool = false
    
    @IBOutlet weak var toolBar: UIToolbar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let music = Bundle.main.path(forResource: "BlankSpace", ofType: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: music! ))
        }
        catch{
            print("Audio file not found")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playPause(_ sender: UIBarButtonItem) {
        var items = toolBar.items!
        
        if musicPaused == false {
            playPauseButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.pause, target: self, action: #selector(ViewController.playPause(_:)))
            items[0] = playPauseButton
            toolBar.setItems(items, animated: true)
            audioPlayer.play()
            musicPaused = true
        }
        else{
            playPauseButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.play, target: self, action: #selector(ViewController.playPause(_:)))
            items[0] = playPauseButton
            toolBar.setItems(items, animated: true)
            audioPlayer.pause()
            musicPaused = false
            
        }
    }

    
    @IBAction func stopMusic(_ sender: UIBarButtonItem) {
        var items = toolBar.items!
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        playPauseButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.play, target: self, action: #selector(ViewController.playPause(_:)))
        items[0] = playPauseButton
        toolBar.setItems(items, animated: true)
        musicPaused = false
    }
    
    
    
}

