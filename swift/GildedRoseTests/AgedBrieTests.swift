//
//  AgedBrieTests.swift
//  GildedRose
//
//  Created by Maciej Witaszek on 27/10/2016.
//  Copyright © 2016 Maciej Witaszek. All rights reserved.
//

import XCTest

class AgedBrieTests: XCTestCase {
  
  func testOneDay() {
    let item = Item(name: "Aged Brie", sellIn: 2, quality: 0)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 1)
    XCTAssertEqual(item.quality, 1)
  }
  
  func testTwoDays() {
    let item = Item(name: "Aged Brie", sellIn: 2, quality: 0)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 0)
    XCTAssertEqual(item.quality, 2)
  }
  
  func testThreeDays() {
    let item = Item(name: "Aged Brie", sellIn: 2, quality: 0)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    app.updateQuality();
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, -1)
    XCTAssertEqual(item.quality, 4)
  }
  
  func testThreeDaysSoldOut() {
    let item = Item(name: "Aged Brie", sellIn: -1, quality: 0)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, -2)
    XCTAssertEqual(item.quality, 2)
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, -3)
    XCTAssertEqual(item.quality, 4)
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, -4)
    XCTAssertEqual(item.quality, 6)
  }
  
  func testQuality50() {
    let item = Item(name: "Aged Brie", sellIn: 2, quality: 50)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    app.updateQuality();
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, -1)
    XCTAssertEqual(item.quality, 50)
  }
}
