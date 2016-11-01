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
    
