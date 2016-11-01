//
//  ConjuredManaCakeTests.swift
//  GildedRose
//
//  Created by Maciej Witaszek on 28/10/2016.
//  Copyright © 2016 Maciej Witaszek. All rights reserved.
//

import XCTest

class ConjuredManaCakeTests: XCTestCase {

  func testOneDay() {
    let item = Item(name: "Conjured Mana Cake", sellIn: 3, quality: 6)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 2)
    XCTAssertEqual(item.quality, 5)
  }
  
  func testTwoDays() {
    let item = Item(name: "Conjured Mana Cake", sellIn: 3, quality: 6)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 1)
    XCTAssertEqual(item.quality, 4)
  }
}
