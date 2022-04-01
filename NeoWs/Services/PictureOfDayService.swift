//
//  ImageService.swift
//  NeoWs
//
//  Created by Hugo Andreassa Amaral (P) on 01/04/22.
//

import Foundation

class PictureOfDayService {
    
    let apiKey = "6eXGSorBZUrLa9FRKHhPESU5Da0yoopQDye0mn7a"
    let urlString = "https://api.nasa.gov/planetary/apod"
    
    func getImage(completion: @escaping (PictureOfDay?) -> Void) {
        if let url = URL(string: urlString + "?api_key=\(apiKey)") {
            
            let session = URLSession(configuration: .default)
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "GET"
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    completion(nil)
                }
                
                if let data = data {
                    completion(self.parseJSON(data: data))
                }
            }
            
            dataTask.resume()
        }
    }
    
    private func parseJSON(data: Data) -> PictureOfDay? {
        do {
            return try JSONDecoder().decode(PictureOfDay.self, from: data)
        } catch {
            return nil
        }
    }
}
