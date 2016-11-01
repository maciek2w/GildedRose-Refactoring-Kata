
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
  
  class BackstagePassesBehaviour: BaseBehaviour {
    
    override func tick() {
      super.tick()
      
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
  
  public func updateQuality() {
    
    for i in 0..<items.count {
      updateQuality(in: items[i])
    }
  }
  
  func updateQuality(in item: Item) {
    let behaviourMatcher: [String : () -> BaseBehaviour ] =
      ["Aged Brie":
        { return AgedBrieBehaviour(item: item) },
       "Sulfuras, Hand of Ragnaros":
        { return SulfurasHandofRagnarosBehaviour(item: item) },
       "Backstage passes to a TAFKAL80ETC concert":
        { return BackstagePassesBehaviour(item: item) }]
    
    let behaviourBuilderBlock = behaviourMatcher[item.name] ?? { return NormalBehaviour(item: item) }
    
    let behaviour = behaviourBuilderBlock()
    
    behaviour.tick()
  }
}
