module Mint
  class Formatter
    def format(node : Ast::HtmlElement) : String
      tag =
        format node.tag

      style =
        format node.style

      prefix =
        if style
          "#{tag}::#{style}"
        else
          tag
        end

      ref =
        node.ref.try do |variable|
          name =
            format variable

          " as #{name}"
        end || ""

      format(prefix: prefix + ref, tag: tag, node: node)
    end
  end
end
