//
//  DetailImageViewController.swift
//  Moon
//
//  Created by Nguyenthanh Long on 9/8/18.
//  Copyright © 2018 Geniee. All rights reserved.
//

import UIKit
import AVFoundation

class DetailImageViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    public var animalImageName:String = "dog"
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let animalImage = UIImage(named: animalImageName)!
        setImageView(animalImage: animalImage)
        playAnimalPronunciation(animalName: animalImageName)
    }
    
    func setImageView(animalImage: UIImage) {
        let width = animalImage.size.width
        let height = animalImage.size.height
        let ratio = height / width
        
        let screenSize: CGRect = UIScreen.main.bounds
        let scaleHeight = screenSize.width * ratio
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints([
            NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0),
            
            NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0),
            
            NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.width, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: scaleHeight)
            ])

        
        imageView.image = animalImage
    }
    
    func playAnimalPronunciation(animalName:String) {
        guard let fileUrl = Bundle.main.url(forResource: "\(animalName)_pro", withExtension: "mp3") else {
            return
        }
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: fileUrl, fileTypeHint: AVFileType.mp3.rawValue)
            audioPlayer?.delegate = self
            audioPlayer?.play()
        } catch let error{
            print("Can't play sound file \(animalName)")
        }
    }
    
    func playAnimalSound(animalName:String) {
        guard let fileUrl = Bundle.main.url(forResource: animalName, withExtension: "wav") else {
            return
        }
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: fileUrl, fileTypeHint: AVFileType.wav.rawValue)
            audioPlayer?.play()
        } catch let error{
            print("Can't play sound file \(animalName)")
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playAnimalSound(animalName: animalImageName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        audioPlayer?.stop()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
