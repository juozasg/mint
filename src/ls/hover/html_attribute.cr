module Mint
  module LS
    class Hover < LSP::RequestMessage
      def hover(node : Ast::HtmlAttribute, workspace) : Array(String | Nil)
        type =
          type_of(node, workspace)

        [
          "**#{node.name.value}**",
          type,
        ] of String | Nil
      end
    end
  end
end
