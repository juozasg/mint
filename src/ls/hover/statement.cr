module Mint
  module LS
    class Hover < LSP::RequestMessage
      def hover(node : Ast::Statement, workspace) : Array(String | Nil)
        type =
          type_of(node, workspace)

        head =
          node.target.try do |target|
            formatted =
              workspace
                .formatter
                .format(target)
            "**#{formatted} =**"
          end

        [
          head,
          type,
        ] of String | Nil
      end
    end
  end
end
