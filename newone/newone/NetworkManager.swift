//
//  NetworkManager.swift
//  newone
//
//  Created by Елизавета Метла on 3/28/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import Foundation

class NetworkManager {
    func fetchData() {
            let session = URLSession.shared
            let url = URL(string: "https://swapi.co/api/people")
            guard let uri = url else { return }
            
            let task = session.dataTask(with: uri) { (data, response, error) in
                guard let data = data else { return }
                guard error == nil else { return }
                //проверка response на тип класса ожидаемого
                //лежит ли статус код в пределах - коды ошибок
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode)
                    else { return }
                //проверка лежит ли статус код в пределах нашего кода
                
                do {
                    //старый метод
    //                let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
    //                print(json)
    //                let people = json?.value(forKey: "results") as? NSArray
    //                print(people)
                    
                    let json = try JSONDecoder().decode(SWPeople.self, from: data)
                    
                    json.people.forEach {
                        print($0.name)
                    }
                    print(json)
                } catch {
                    print(error)
                }
            }
            task.resume()
        }
}

struct SWPeople: Codable {
    let count: Int
    let next: String
    let people: [SWChar]
    
    //зачем нужен CodingKeys
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case people = "results"
    }
}

struct SWChar: Codable {
    let name: String
}

