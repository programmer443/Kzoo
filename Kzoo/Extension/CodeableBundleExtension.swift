//
//  CodeableBundleExtension.swift
//  Kzoo
//
//  Created by Muhammad Ahmad on 27/09/2022.
//

import Foundation


extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        //  Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("[-] Fail to locate \(file) in the Bundle.")
        }
        
        // create property for the data
        guard let data =  try? Data(contentsOf: url) else{
            fatalError("[-] Fail to load \(file) from Bundle.")
        }
        
        // create the decoder
        let decoder = JSONDecoder()

        // create a property for decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("[-] Fail to decode \(file) from Bundle.")
        }
        
        // return data
        return loaded
    }
}
