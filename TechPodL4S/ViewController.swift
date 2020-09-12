//
//  ViewController.swift
//  TechPodL4S
//
//  Created by esaki yuki on 2020/09/11.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var songNameArray = [String]()
    var fileNameArray = [String]()
    var imageNameArray = [String]()
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //テーブルビューのデータソースメソッドはViewControllerクラスに書くという設定
        table.dataSource = self
        //テーブルビューのデリゲートメソッドはViewControllerメソッドに書くという設定
        table.delegate = self
        
        //配列に入れる
        songNameArray = ["カノン", "エリーゼのために", "G線上のマリア"]
        fileNameArray = ["cannon", "elise", "aria"]
        imageNameArray = ["Pachelbel.jpg", "Beethoven.jpg", "Bach.jpg"]
    }
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //songNameArrayがCellの数
        return songNameArray.count
    }
    
    //ID付きのセルを取得する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = songNameArray[indexPath.row]
        //CellにsongNameArrayの曲名を表示
        cell?.textLabel?.text = songNameArray[indexPath.row]
        return cell!
    }
    
    //Cellが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました！")
        
        //音楽ファイルの設定
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        //再生の準備
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        //再生を再開
        audioPlayer.play()
    }


}

