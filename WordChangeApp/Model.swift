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

}
