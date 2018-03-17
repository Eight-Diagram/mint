class Parser
  syntax_error HtmlElementExpectedClosingBracket
  syntax_error HtmlElementExpectedClosingTag
  syntax_error HtmlElementExpectedStyle

  def html_element : Ast::HtmlElement | Nil
    start do |start_position|
      tag = start do
        skip unless char! '<'
        skip unless value = variable
        value
      end

      skip unless tag

      if keyword "::"
        style = variable_with_dashes! HtmlElementExpectedStyle
      end

      attributes, children = html_body(
        expected_closing_bracket: HtmlElementExpectedClosingBracket,
        expected_closing_tag: HtmlElementExpectedClosingTag,
        with_dashes: true,
        tag: tag)

      Ast::HtmlElement.new(
        attributes: attributes,
        from: start_position,
        children: children,
        style: style,
        to: position,
        input: data,
        tag: tag)
    end
  end
end
