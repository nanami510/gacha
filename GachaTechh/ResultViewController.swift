//
//  ResultViewController.swift
//  GachaTechh
//
//  Created by 後藤奈々美 on 2017/03/29.
//  Copyright © 2017年 後藤奈々美. All rights reserved.
//

import UIKit
import AVFoundation

class ResultViewController: UIViewController {
    @IBOutlet var haikeiImageView: UIImageView!
    @IBOutlet var ImageView: UIImageView!
    @IBOutlet var monsterImageView: UIImageView!
    @IBOutlet var negaiImageView: UIImageView!
    @IBOutlet var label:UILabel!
    @IBOutlet var negaiButton:UIButton!
    
    var negai:UIImage!
    var monsterArray: [UIImage]!
    var audioPlayer: AVAudioPlayer!
    var monsternameArray: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let number = Int(arc4random_uniform(3))
        monsterArray = [UIImage(named:"mons1.png")!,
                        UIImage(named:"mons2.png")!,
                        UIImage(named:"mons3.png")!]
       monsternameArray = ["幼少期の悟空", "スーパーサイヤ人悟空", "ドラゴンボール"]
        
        monsterImageView.image = monsterArray[number]
        label.text = monsternameArray[number]
        if number == 2 {
            haikeiImageView.image = UIImage(named: "bg_gold.png")
            negaiButton.isHidden=false
        } else if number == 1 {
            haikeiImageView.image = UIImage(named: "bg_red.png")
           negaiButton.isHidden=true
        } else {
            haikeiImageView.image = UIImage(named: "bg_blue.png")
          negaiButton.isHidden=true
        }
        playsound()
    }
     func playsound(){
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "shine3", ofType: "mp3")!)
        
        // swift2系からtryでエラー処理するようなので、do〜try〜catchで対応
        do {
            // AVAudioPlayerを作成。もし何かの事情で作成できなかったらエラーがthrowされる
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            
            // イベントを通知したいUIViewControllerをdelegateに登録
            // delegateの登録するならAVAudioPlayerDelegateプロトコルの継承が必要

            // これで再生
            audioPlayer.play()
        }
            // playerを作成した時にエラーがthrowされたらこっち来る
        catch {
            print("AVAudioPlayer error")
        }    }

    
    @IBAction func modoru(){
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func kanaeru(){
       negaiImageView.image = UIImage(named: "dokkan0051.jpg")
       ImageView.image = UIImage(named: "l_039.jpg")
       
    }

    
    
    override func viewDidAppear(_ animated: Bool) {
        let animation = CABasicAnimation(keyPath: "transform")
        animation.fromValue = 0.0
        animation.toValue = 2 * M_PI
        animation.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        animation.duration = 5.0
        animation.repeatCount = Float.infinity
        haikeiImageView.layer.add(animation, forKey: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
