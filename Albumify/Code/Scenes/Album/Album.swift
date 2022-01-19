//
//  Album.swift
//  Albumify
//
//  Created by Gregory McQuillan on 1/19/22.
//

import Foundation

struct Album: Codable {
  let artist: String
  let title: String
  /** year released */
  let year: String
  let tracks: [String]
}

struct AlbumRoot: Codable {
  let albums: [Album]
}

func loadJson<D: Decodable>(from file: String, in bundle: Bundle = .main) -> D? {
  guard let path = bundle.url(forResource: file, withExtension: nil) else {
    return nil
  }

  do {
    let data = try Data(contentsOf: path)
    let decoder = JSONDecoder()
    return try decoder.decode(D.self, from: data)
  }
  catch {
    print("Error caught loading file: \(error)")
    return nil
  }
}
