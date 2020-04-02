//
//  NetworkManager.swift
//  newone
//
//  Created by Елизавета Метла on 3/28/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    var characters: [SWCharacters] = []
/// Reloading data
    func fetchData(completion: @escaping () -> Void) {
            let session = URLSession.shared
            var charactersCount: Int?
            
            var url = URL(string: "https://swapi.co/api/people/")
            guard let uri = url else { return }
            
            let task = session.dataTask(with: uri) { (data, response, error) in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    completion()
                }
        
                print(data)
                guard error == nil else { return }
                //проверка response на тип класса ожидаемого
                //лежит ли статус код в пределах - коды ошибок
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode)
                    else { return }
                //проверка лежит ли статус код в пределах нашего кода
                
                do {
                    let json = try JSONDecoder().decode(SWData.self, from: data)
                    
                    //to check those 2 lines
                    guard let nextPage = json.next else { return }
                    url = URL(string: nextPage)
                    //
                    json.people.forEach({self.characters.append(SWCharacters(name: $0.name, birthYear: $0.birth_year, gender: $0.gender))
                        charactersCount = json.count
                        json.people.forEach({print($0.name)})
                    })
                } catch {
                    print(error)
                }
            }
            task.resume()
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


