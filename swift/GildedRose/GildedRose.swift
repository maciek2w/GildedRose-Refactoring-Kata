
public class GildedRose {
  var items:[Item]
  
  required public init(items:[Item]) {
    self.items = items
  }
  
  class BaseBehaviour {
    let item: Item
    init(item: Item) {
      self.item = item
    }
    
    func tick() {
      item.sellIn = item.sellIn - 1
    }
  }
  
  class NormalBehaviour: BaseBehaviour {
    
    override func tick() {
      super.tick()
      
      if (item.sellIn < 0) {
        item.quality = item.quality - 1
      }
      
      item.quality = item.quality - 1
      
      item.quality = max(item.quality, 0)
    }
  }
  
  class AgedBrieBehaviour: BaseBehaviour {
    
    override func tick() {
      super.tick()
      
      if item.quality < 50 {
        if (item.sellIn < 0) {
          item.quality = item.quality + 1
        }
        
        item.quality = item.quality + 1
      }
    }
  }
  
  class SulfurasHandofRagnarosBehaviour: BaseBehaviour {
    
    override func tick() {
      //Do nothing
    }
  }
  
  public func updateQuality() {
    
    for i in 0..<items.count {
      updateQuality(in: items[i])
    }
  }
  
  func updateQuality(in item: Item) {
    switch item.name {
    case "Aged Brie":
      let behaviour = AgedBrieBehaviour(item: item)
      behaviour.tick()
    case "Sulfuras, Hand of Ragnaros":
      let behaviour = SulfurasHandofRagnarosBehaviour(item: item)
      behaviour.tick()
    case "Backstage passes to a TAFKAL80ETC concert":
      updateQualityBackstagePasses(in: item)
    default:
      let behaviour = NormalBehaviour(item: item)
      behaviour.tick()
    }
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
