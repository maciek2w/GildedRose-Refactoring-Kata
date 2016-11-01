protocol BehaviourProtocol {
  func tick()
}

class BaseBehaviour: BehaviourProtocol {
  let item: Item
  init(item: Item) {
    self.item = item
  }
  
  func tick() {
    item.sellIn = item.sellIn - 1
  }
}
