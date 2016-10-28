//
//  DexterityVestTests.swift
//  GildedRose
//
//  Created by Maciej Witaszek on 27/10/2016.
//  Copyright © 2016 Maciej Witaszek. All rights reserved.
//

import XCTest

class DexterityVestTests: XCTestCase {
  
  func testOneDay() {
    let item = Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 9)
    XCTAssertEqual(item.quality, 19)
  }
  
  func testTwoDays() {
    let item = Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 8)
    XCTAssertEqual(item.quality, 18)
  }
  
  func testTwoDaysSellinNegative() {
    let item = Item(name: "+5 Dexterity Vest", sellIn: 0, quality: 10)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();

    XCTAssertEqual(item.sellIn, -1)
    XCTAssertEqual(item.quality, 8)
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, -2)
    XCTAssertEqual(item.quality, 6)
  }
  
  func testTwoDaysSellinNegativeQualityZero() {
    let item = Item(name: "+5 Dexterity Vest", sellIn: 0, quality: 2)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, -1)
    XCTAssertEqual(item.quality, 0)
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, -2)
    XCTAssertEqual(item.quality, 0)
  }
}
