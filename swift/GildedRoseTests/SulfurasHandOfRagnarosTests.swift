//
//  SulfurasHandOfRagnarosTests.swift
//  GildedRose
//
//  Created by Maciej Witaszek on 28/10/2016.
//  Copyright © 2016 Maciej Witaszek. All rights reserved.
//

import XCTest

class SulfurasHandOfRagnarosTests: XCTestCase {

  func testOneDaySellin0() {
    let item = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 0)
    XCTAssertEqual(item.quality, 80)
  }
  
  func testTwoDaysSellIn0() {
    let item = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 0)
    XCTAssertEqual(item.quality, 80)
  }
  
  func testOneDaySellinNegative() {
    let item = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, -1)
    XCTAssertEqual(item.quality, 80)
  }
  
  func testTwoDaysSellInNegative() {
    let item = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, -1)
    XCTAssertEqual(item.quality, 80)
  }
}
