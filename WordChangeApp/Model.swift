//
//  Model.swift
//  WordChangeApp
//
//  Created by 飯野敦博 on 2019/08/17.
//  Copyright © 2019 mycompany. All rights reserved.
//

import Foundation

class RubiModel {

    struct Rubi: Codable {
        let request_id: String?
        let output_type: String?
        let converted: String?
    }

    struct PostData: Codable {
        let app_id: String
        let request_id: String?
        let sentence: String
        let output_type: String
    }

    func change (word: String) {

        guard let reqUrl = URL(string: "https://labs.goo.ne.jp/api/hiragana") else{
            return
        }
        //リクエストに必要な情報を生成
        var req = URLRequest(url: reqUrl)
        // POSTを指定
        req.httpMethod = "POST"
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let postData = PostData(app_id: "56105e1be9637f71d061a19049681a1d6ed6047b155209a978d85261ec4e73af", request_id: "record003", sentence: word, output_type: "hiragana")

        guard let uploadData = try? JSONEncoder().encode(postData) else {
            return
        }
        //Bodyにセット
        req.httpBody = uploadData
        //データ転送を管理するためのセッションを生成
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        //タスク
        let task = session.dataTask(with: req, completionHandler: {
            (data, response , error) in
            //終了
            session.finishTasksAndInvalidate()

            do {
                //デコーダ
                let decoder = JSONDecoder()
                //受け取ったJSONデータをパース（解析）して格納
                let json = try decoder.decode(Rubi.self, from: data!)
                //ルビ変換された言葉格納
                var afterWord = json.converted

            }catch{
                //エラー処理
                print("エラーが出ました")
            }
        })
        //ダウンロード開始
        task.resume()
    }
}
