//
//  User.swift
//  GitHub Followers
//
//  Created by Furkan Cingöz on 28.01.2024.
//

import Foundation


struct User : Codable {
  var login : String
  var avatarUrl : String
  var name : String?
  var location : String?
  var bio: String?
  var publicRepos : Int
  var publicGists : Int
  var htmlUrl : String
  var followers : Int
  var following : Int
  var createdAt : String
}
 //https://api.github.com/users/
