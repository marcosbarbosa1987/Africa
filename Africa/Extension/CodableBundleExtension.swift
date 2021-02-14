//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Marcos Barbosa on 14/02/21.
//

import Foundation

extension Bundle {
    
    func decode(_ file: String) -> [CoverImage] {
    
        // MARK: - Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to create \(file) in bundle.")
        }
        
        // MARK: - Create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        // MARK: - Create a decoder
        let decoder = JSONDecoder()
        
        // MARK: - Create a property for the decode data
        guard let loaded = try?  decoder.decode([CoverImage].self, from: data) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        // MARK: - Return the ready-to-use data
        return loaded
    }
}
