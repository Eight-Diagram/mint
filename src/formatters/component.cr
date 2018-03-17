class Formatter
  def format(node : Ast::Component) : String
    items =
      node.properties +
        node.connects +
        node.styles +
        node.states +
        node.functions +
        node.gets +
        node.uses

    name =
      format node.name

    body =
      list items

    "component #{name} {\n#{body.indent}\n}"
  end
end
