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
    let behaviour = BehaviourBuilder.build(for: item)
    
    behaviour.tick()
  }
}
