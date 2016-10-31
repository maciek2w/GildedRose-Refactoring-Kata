//
//  BackstagePassesTests.swift
//  GildedRose
//
//  Created by Maciej Witaszek on 28/10/2016.
//  Copyright © 2016 Maciej Witaszek. All rights reserved.
//

import XCTest

class BackstagePassesTests: XCTestCase {

  func testOneDaySellin15() {
    let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 14)
    XCTAssertEqual(item.quality, 21)
  }
  
  func testTwoDaysSellIn15() {
    let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 13)
    XCTAssertEqual(item.quality, 22)
  }
  
  func testOneDaySellin10() {
    let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 9)
    XCTAssertEqual(item.quality, 50)
  }
  
  func testTwoDaysSellIn10() {
    let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 8)
    XCTAssertEqual(item.quality, 50)
  }
  
  func testOneDaySellin5() {
    let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 49)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 4)
    XCTAssertEqual(item.quality, 50)
  }
  
  func testTwoDaysSellIn5() {
    let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 49)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 3)
    XCTAssertEqual(item.quality, 50)
  }
  
  func testThreeDaysSellin11() {
    let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 11, quality: 24)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 10)
    XCTAssertEqual(item.quality, 25)
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 9)
    XCTAssertEqual(item.quality, 27)
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 8)
    XCTAssertEqual(item.quality, 29)
  }
  
  func testThreeDaysSellin6() {
    let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 6, quality: 24)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 5)
    XCTAssertEqual(item.quality, 26)
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 4)
    XCTAssertEqual(item.quality, 29)
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 3)
    XCTAssertEqual(item.quality, 32)
  }
  
  func testThreeDaysMaxQuality50() {
    let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 9)
    XCTAssertEqual(item.quality, 50)
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 8)
    XCTAssertEqual(item.quality, 50)
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, 7)
    XCTAssertEqual(item.quality, 50)
  }
  
  func testOneDaySellinNegative() {
    let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: -1, quality: 20)
    
    let app = GildedRose(items: [item]);
    
    app.updateQuality();
    
    XCTAssertEqual(item.sellIn, -2)
    XCTAssertEqual(item.quality, 0)
  }
}
