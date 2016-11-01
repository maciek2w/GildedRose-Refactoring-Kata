//
//  ElixirOfTheMongooseTests.swift
//  GildedRose
//
//  Created by Maciej Witaszek on 28/10/2016.
//  Copyright © 2016 Maciej Witaszek. All rights reserved.
//

import XCTest

class ElixirOfTheMongooseTests: XCTestCase {
  
  func testOneDay() {
    let item = Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 4)
    XCTAssertEqual(item.quality, 6)
  }
  
  func testTwoDays() {
    let item = Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 3)
    XCTAssertEqual(item.quality, 5)
  }
}
