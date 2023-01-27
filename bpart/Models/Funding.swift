//
//  Funding.swift
//  bpart
//
//  Created by Alex Cho on 2023/01/27.
//


import Foundation

struct Funding :Hashable{
    
    var title: String
    var description: String
    var currentAmount: Int
    var targetAmount: Int
    var id: String
    var media: String
    var milestones: [Milestone]
    var participationCount: Int
}


struct Milestone: Hashable {
    var what: String
    var who: String
    var isDone: Bool
}
