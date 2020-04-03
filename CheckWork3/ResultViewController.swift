//
//  ResultViewController.swift
//  CheckWork3
//
//  Created by 原田澪 on 2020/04/03.
//  Copyright © 2020 原田澪. All rights reserved.
//

import UIKit
import AVFoundation

class ResultViewController: UIViewController {
    
    @IBOutlet var backButton: UIButton!
    var audioPlayer: AVAudioPlayer!
    //乱数を入れるためのInt型の変数を用意
    var number: Int!
    
    //背景画像とモンスター画像を表示するためのImageViewを用意
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var monsterImageView: UIImageView!
    @IBOutlet var rabbitNameLabel: UILabel!
    @IBOutlet var rareLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.layer.cornerRadius = 40
        
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: "ファンファーレ", ofType: "mp3")!)
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        audioPlayer.play()
        
        // Do any additional setup after loading the view.
        //0~9までの乱数を発生させる
        number = Int.random(in: 0...9)
        
        if number > 7 {
            monsterImageView.image = UIImage(named: "netherlanddwarf")
            backgroundImageView.image = UIImage(named: "bg_rare")
            rabbitNameLabel.text = "ネザーランド ドワーフ"
            rareLabel.text = "激レア！"
        } else if number > 4 {
            monsterImageView.image = UIImage(named: "lopeared")
            backgroundImageView.image = UIImage(named: "bg_rainbow")
            rabbitNameLabel.text = "ロップイヤー"
            rareLabel.text = "レア！"
        } else {
            monsterImageView.image = UIImage(named: "white")
            backgroundImageView.image = UIImage(named: "bg_orange")
            rabbitNameLabel.text = "白うさぎ"
            rareLabel.text = "ノーマル！"
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        /*
        let animation = CABasicAnimation (keyPath: "transform")
        
        animation.fromValue = NSNumber (value: 0)
        
        animation.toValue = NSNumber(value: 2 * Double.pi)
        
        animation.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        
        animation.duration = 5
        
        animation.repeatCount = Float.infinity
        
        backgroundImageView.layer.add(animation, forKey: nil)
 */
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
