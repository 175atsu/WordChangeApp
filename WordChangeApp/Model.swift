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

    typealias CompletionClosure = ((_ result:String) -> String)

    func change (word: String, completionClosure: @escaping ((_ result:String) -> Void)) {
        guard let reqUrl = URL(string: "https://labs.goo.ne.jp/api/hiragana") else{
            fatalError("message")
        }
        //リクエストに必要な情報を生成
        var req = URLRequest(url: reqUrl)
        // POSTを指定
        req.httpMethod = "POST"
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let postData = PostData(app_id: "56105e1be9637f71d061a19049681a1d6ed6047b155209a978d85261ec4e73af", request_id: "record003", sentence: word, output_type: "hiragana")

        let uploadData = try? JSONEncoder().encode(postData)

        guard let unwrappedUploadData = uploadData else {
            fatalError("message")
        }
        //Bodyにセット
        req.httpBody = unwrappedUploadData
        //データ転送を管理するためのセッションを生成
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)

        var afterWord = ""

        //タスク
        let task = session.dataTask(with: req, completionHandler: {
            (data, response , error) in

            //終了
            session.finishTasksAndInvalidate()

            do {
                //デコーダ
                let decoder = JSONDecoder()
                //受け取ったJSONデータをパース（解析）して格納
                guard let data = data else {
                    return
                }
                let json = try decoder.decode(Rubi.self, from: data)
                //ルビ変換された言葉格納
                afterWord = json.converted ?? ""
                print(afterWord)

                completionClosure(afterWord)
            }catch{
                //エラー処理
                print("エラーが出ました")
            }
        })
        //ダウンロード開始
        task.resume()
    }
}
