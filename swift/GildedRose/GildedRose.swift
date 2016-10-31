
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
    
    if (item.name != "Backstage passes to a TAFKAL80ETC concert") {
      if (item.quality > 0) {
        item.quality = item.quality - 1
      }
    } else {
      if (item.quality < 50) {
        item.quality = item.quality + 1
        
        if (item.name == "Backstage passes to a TAFKAL80ETC concert") {
          if (item.sellIn < 11) {
            if (item.quality < 50) {
              item.quality = item.quality + 1
            }
          }
          
          if (item.sellIn < 6) {
            if (item.quality < 50) {
              item.quality = item.quality + 1
            }
          }
        }
      }
    }
    
    item.sellIn = item.sellIn - 1
    
    if (item.sellIn < 0) {
      if (item.name != "Backstage passes to a TAFKAL80ETC concert") {
        if (item.quality > 0) {
          item.quality = item.quality - 1
        }
      } else {
        item.quality = item.quality - item.quality
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
}
