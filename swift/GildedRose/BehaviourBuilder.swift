class BehaviourBuilder {
  static func build(for item: Item) -> BehaviourProtocol {
    let behaviourMatcher: [String : () -> BehaviourProtocol ] =
      ["Aged Brie":
        { return AgedBrieBehaviour(item: item) },
       "Sulfuras, Hand of Ragnaros":
        { return SulfurasHandofRagnarosBehaviour(item: item) },
       "Backstage passes to a TAFKAL80ETC concert":
        { return BackstagePassesBehaviour(item: item) }]
    
    let behaviourBuilderBlock = behaviourMatcher[item.name] ?? { return NormalBehaviour(item: item) }
    
    let behaviour = behaviourBuilderBlock()
    
    return behaviour
  }
}
