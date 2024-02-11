//
//  Follower.swift
//  GitHub Followers
//
//  Created by Furkan Cingöz on 28.01.2024.
//

import Foundation

struct Follower : Codable, Hashable {
  var login : String
  var avatarUrl : String

}


//https://api.github.com/users/octocat/followers
