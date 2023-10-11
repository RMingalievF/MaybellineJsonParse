//
//  NetworkMaybellineManager.swift
//  MaybellineJsonParse
//
//  Created on 09.04.2022.
//

import Foundation

enum NetworkError: Error {
	case invalidURL
	case noData
	case decodingError
	case invalidStatusCode
}

class NetworkMaybellineManager {
	
	static let shared = NetworkMaybellineManager()
	
	let urlAPI = "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"
	
	private init() {}
	
	func fetchMaybellineInfo(from url: String, completion: @escaping (Result<[Maybelline], NetworkError>) -> ()) {
		guard let url = URL(string: urlAPI) else {
			completion(.failure(.invalidURL))
			return
		}
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard let data = data else {
				print(error?.localizedDescription ?? "No error description")
				completion(.failure(.noData))
				return
			}
			guard let httpResponse = response as? HTTPURLResponse,
				  (200..<300).contains(httpResponse.statusCode) else {
					  completion(.failure(.invalidStatusCode))
					  return
				  }
			do {
				let maybs = try JSONDecoder().decode([Maybelline].self, from: data)
				DispatchQueue.main.async {
					completion(.success(maybs))
					print(data)
				}
			} catch {
				completion(.failure(.decodingError))
			}
		}.resume()
	}
	
	func fetchImage(from url: String, completion: @escaping(Result<Data, NetworkError>) -> Void) {
		guard let url = URL(string: url) else {
			completion(.failure(.invalidURL))
			return
		}
		DispatchQueue.global().async {
			guard let imageData = try? Data(contentsOf: url) else {
				completion(.failure(.noData))
				return
			}
			DispatchQueue.main.async {
				completion(.success(imageData))
			}
		}
	}
	
}
