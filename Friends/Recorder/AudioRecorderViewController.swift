//
//  AudioRecorderViewController.swift
//  Friends
//
//  Created by Ahmed Nasser on 10/16/18.
//  Copyright © 2018 Ahmed Nasser. All rights reserved.
//

import UIKit
import AVFoundation

class AudioRecorderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var recordAction: UIButton!

    @IBAction func record(_ sender: Any) {
        do {
            let audioSession:AVAudioSession =  AVAudioSession.sharedInstance()
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try audioSession.setActive(true)
            let documents = NSSearchPathForDirectoriesInDomains( FileManager.SearchPathDirectory.documentDirectory,  FileManager.SearchPathDomainMask.userDomainMask, true)[0]
            let str =  (documents as NSString).appendingPathComponent("recordTest.caf")
            let url = NSURL.fileURL(withPath: str as String)
            
            let recordSettings = [AVFormatIDKey:kAudioFormatAppleIMA4,
                                  AVSampleRateKey:44100.0,
                                  AVNumberOfChannelsKey:2,AVEncoderBitRateKey:12800,
                                  AVLinearPCMBitDepthKey:16,
                                  AVEncoderAudioQualityKey:AVAudioQuality.max.rawValue] as [String : Any]
            
            print("url : \(url)")
            let  audioRecorder = try AVAudioRecorder(url: url, settings: recordSettings)
            audioRecorder.record()
        } catch{
            
        }
     
        }
    }


