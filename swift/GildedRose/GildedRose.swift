
public class GildedRose {
  var items:[Item]
  
  required public init(items:[Item]) {
    self.items = items
  }
  
  public func updateQuality() {
    
    for i in 0..<items.count {
      updateQuality(in: items[i])
    }
  }
  
  func updateQuality(in item: Item) {
    if (item.name == "+5 Dexterity Vest") {
      updateQualityNormal(in: item)
      return
    }
    
    if (item.name == "Aged Brie") {
      updateQualityAgedBrie(in: item)
      return
    }
    
    if (item.name == "Sulfuras, Hand of Ragnaros") {
      updateQualitySulfurasHandofRagnaros(in: item)
      return
    }
    
    if (item.name == "Backstage passes to a TAFKAL80ETC concert") {
      updateQualityBackstagePasses(in: item)
      return
    }
    
    if (item.quality > 0) {
      item.quality = item.quality - 1
    }
    
    item.sellIn = item.sellIn - 1
    
    if (item.sellIn < 0) {
      if (item.quality > 0) {
        item.quality = item.quality - 1
      }
    }
  }
  
  func updateQualityNormal(in item: Item) {
    item.sellIn = item.sellIn - 1
    
    if (item.sellIn < 0) {
      item.quality = item.quality - 1
    }
    
    item.quality = item.quality - 1
    
    item.quality = max(item.quality, 0)
  }
  
  func updateQualityAgedBrie(in item: Item) {
    item.sellIn = item.sellIn - 1
    
    if item.quality < 50 {
      if (item.sellIn < 0) {
        item.quality = item.quality + 1
      }
      
      item.quality = item.quality + 1
    }
  }
  
  func updateQualitySulfurasHandofRagnaros(in item: Item) {
    //Do nothing
  }
  
  func updateQualityBackstagePasses(in item: Item) {
    item.sellIn = item.sellIn - 1
    
    if (item.sellIn < 0) {
      item.quality = 0
    }
    else {
      item.quality = item.quality + 1
      
      if (item.sellIn < 10) {
        item.quality = item.quality + 1
      }
      
      if (item.sellIn < 5) {
        item.quality = item.quality + 1
      }
      
      item.quality = min(item.quality, 50)
    }
  }
}
