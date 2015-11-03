//
//  NewsItem.swift
//  Stretch My Header
//
//  Created by Adam Goldberg on 2015-11-03.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

import UIKit

enum NewsCategory : String {
    case World = "World"
    case Europe = "Europe"
    case MiddleEast = "Middle East"
    case Africa = "Africa"
    case AsiaPacific = "Asia Pacific"
    case Americas = "Americas"
    
    func getColor() -> UIColor {
        switch(self) {
        case .World:
            return UIColor.redColor()
        case .Europe:
            return UIColor.orangeColor()
        case .MiddleEast:
            return UIColor.cyanColor()
        case .Africa:
            return UIColor.greenColor()
        case .AsiaPacific:
            return UIColor.purpleColor()
        case .Americas:
            return UIColor.blueColor()
        }
    }
}

class NewsItem: NSObject {
    var category : NewsCategory
    var headline : String

    init(newCategory: NewsCategory, newHeadline: String) {
        self.category = newCategory
        self.headline = newHeadline
    }
    
   
    
    
//    var newsCategories = ["World", "Europe", "Middle East", "Africa", "Asia Pacific", "Americas", "World", "Europe"]
//    
//    var newsStories = ["Climate change protests, divestments meet fossil fuels realities", "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'", "Airstrikes boost Islamic State, FBI director warns more hostages possible", "Nigeria says 70 dead in building collapse; questions S. Africa victim claim", "Despite UN ruling, Japan seeks backing for whale hunting", "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria", "South Africa in $40 billion deal for Russian nuclear reactors", "'One million babies' created by EU student exchanges"]

    
    
}
