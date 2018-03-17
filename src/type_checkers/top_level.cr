class TypeChecker
  def self.check(node : Ast) : Artifacts
    new(node).check
  end

  def check(node : Ast) : Type
    check node.providers
    check node.components
    check node.modules
    check node.stores
    check node.routes

    NEVER
  end
end
