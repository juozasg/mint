module Mint
  module LS
    class Hover < LSP::RequestMessage
      def hover(node : Ast::Component, workspace) : Array(String | Nil)
        properties =
          node
            .properties
            .map { |property| hover(property, workspace) }
            .flatten

        properties_title =
          if properties.any?
            "\n**Properties**\n"
          end

        [
          "**#{node.name}**\n",
          node.comment.try(&.value.strip),
          properties_title,
        ] + properties
      end
    end

    class Hover < LSP::RequestMessage
      def hover(node : Ast::HtmlComponent, workspace) : Array(String | Nil)
        component =
          workspace
            .type_checker
            .lookups[node]?

        hover(component, workspace)
      end
    end
  end
end
