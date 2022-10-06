//
//  VideoModel.swift
//  Kzoo
//
//  Created by Muhammad Ahmad on 28/09/2022.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
