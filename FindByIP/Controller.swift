//
//  Model.swift
//  FindByIP
//
//  Created by PEPPA CHAN on 06.09.2024.
//

import Foundation

final class GetModel: ObservableObject {
    
    @Published var returnData: IPGeolocation?
    
    func getData(ip: String = "") -> Void {
        let url = "https://api.ipgeolocation.io/ipgeo?apiKey=42b8375c772743899b80df1e74330f21&ip=" + ip
        
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            guard let response = response as? HTTPURLResponse else {return}
            print(response.statusCode, response.url!)
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
                        
            let decoder = JSONDecoder()
            do {
                let decode = try decoder.decode(IPGeolocation.self, from: data as Data)
                DispatchQueue.main.async {
                    self.returnData = decode
                }
            } catch {
                print("Unknown error: \(error)")
            }
        }
        task.resume()
    }
}

