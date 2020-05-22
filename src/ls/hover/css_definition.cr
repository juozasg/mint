module Mint
  module LS
    class Hover < LSP::RequestMessage
      def hover(node : Ast::CssDefinition, workspace) : Array(String | Nil)
        [
          "CSS Property - **#{node.name}**",
          "[MDN Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/#{node.name})",
        ] of String | Nil
      end
    end
  end
end
