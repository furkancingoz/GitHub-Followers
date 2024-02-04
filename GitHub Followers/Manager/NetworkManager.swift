//
//  NetworkManager.swift
//  GitHub Followers
//
//  Created by Furkan Cingöz on 4.02.2024.
//

import Foundation


class NetworkManager {
  static let shared = NetworkManager()
  let baseUrl = "https://api.github.com/users"
  private init(){}



  func getFollowers(for username:String, page: Int, completed : @escaping ([Follower]?, String?) -> Void) {
    let endPoint = baseUrl +  "/users\(username)/followers?per_page=100&page=\(page)"

    guard let url = URL(string: endPoint) else {
      completed(nil, "This username created an invaild request. Plase try again")
      return
    }

    let task = URLSession.shared.dataTask(with: url) { data, response, err in
      if let _ = err {
        completed(nil, "Unable to complete your request check your internet connection")
      }

      guard let  response = response as?  HTTPURLResponse, response.statusCode ==  200 else {
        completed(nil,"Invaild response from the server Pleas try againg")

        return
      }
      guard let data = data else {
        completed(nil,"Data recevied from the server was invaild")
        return
      }

      do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let followers =  try decoder.decode([Follower].self, from: data)
        completed(followers,nil)
      }catch {
        completed(nil,"Data recevied from the server was invaild")
      }
    }
    task.resume()
  }

}
