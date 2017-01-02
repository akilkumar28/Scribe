//
//  ViewController.swift
//  Scribe
//
//  Created by AKIL KUMAR THOTA on 1/2/17.
//  Copyright © 2017 AKIL KUMAR THOTA. All rights reserved.
//

import UIKit
import Speech
import AVFoundation

class MainVC: UIViewController, AVAudioPlayerDelegate {
    
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var textFld: UITextView!
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    @IBOutlet weak var redbtn: RoundedButton!
    
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.shadow()
        activitySpinner.isHidden = true
        
        
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        player.stop()
        redbtn.alpha = 1.0
        activitySpinner.stopAnimating()
        activitySpinner.isHidden = true
    }
    
    func requestAuthorization() {
        SFSpeechRecognizer.requestAuthorization { authstatus in
            
            if authstatus == SFSpeechRecognizerAuthorizationStatus.authorized {
                if let path = Bundle.main.url(forResource: "test", withExtension: "m4a") {
                    do {
                        self.audioPlayer = try AVAudioPlayer(contentsOf: path)
                        self.audioPlayer.delegate = self
                        self.audioPlayer.play()
                    } catch {
                        print("error")
                    }
                    let recognizer = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: path)
                    recognizer?.recognitionTask(with: request){ (result,error) in
                        if let error = error {
                            print("There was an error: \(error)")
                        } else {
                            self.textFld.text =  result?.bestTranscription.formattedString
                        }
                }
            }
            
 
        }
    }
}
    
    
    @IBAction func btnPressd(_ sender: Any) {
        
        requestAuthorization()
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        redbtn.alpha = 0.5
 
    }
    
    
}

