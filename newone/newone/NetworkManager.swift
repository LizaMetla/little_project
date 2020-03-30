//
//  NetworkManager.swift
//  newone
//
//  Created by Елизавета Метла on 3/28/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import Foundation

class NetworkManager {
    
       static var shared = NetworkManager()
        var characters: [SWCharacters] = []
        var charactersCount: Int?
        var isLoaded = false
        static var url = "https://swapi.co/api/people/?page=1"
        func fetchData(url: String) {
            if url == "nil" {return} else {
            let session = URLSession.shared
            guard let url = URL(string: url) else {return}
            var request = URLRequest(url: url)
                request.httpMethod = "GET"
                let dataTask = session.dataTask(with: request) { [weak self] (data, response, error) in
                guard let data = data else {return}
                guard error == nil else {return}
                guard let response = response as? HTTPURLResponse,
                    (200...299).contains(response.statusCode)
                    else {return}
                
                
                self?.parse(data: data)
            }
            dataTask.resume()
        }
        }
    func parse(data: Data) {
        do {
            let json = try JSONDecoder().decode(SWData.self, from: data)
            NetworkManager.url = json.next ?? "nil"
            json.people.forEach({characters.append(SWCharacters(name: $0.name, birthYear: $0.birth_year, gender: $0.gender))
                charactersCount = json.count
                json.people.forEach({print($0.name)})
            })
        } catch {
            print(error)
        }
    }
}

        
struct SWData: Codable {
    let count: Int
    let next: String?
    let people: [SWPeople]
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case people = "results"
    }
}
struct SWPeople: Codable {
    let name: String
    let birth_year: String
    let gender: String
    
}

struct SWCharacters: Codable {
    let name: String
    let birthYear: String
    let gender: String
}

