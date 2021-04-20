//
//  VideoModel.swift
//  Africa
//
//  Created by Marcos Barbosa on 15/02/21.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // MARK: - Computed property
    var thumbnail: String {
        "video-\(id)"
    }
}
