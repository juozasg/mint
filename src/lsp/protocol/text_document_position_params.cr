module LSP
  class TextDocumentPositionParams
    include JSON::Serializable

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier
    property position : Position

    # Non part of the specification. TODO: Move to Mint namespace.
    @[JSON::Field(ignore: true)]
    @offset : Int32?

    # Non part of the specification. TODO: Move to Mint namespace.
    @[JSON::Field(ignore: true)]
    @uri : URI?

    def uri
      @uri ||= URI.parse(text_document.uri)
    end

    def path
      uri.try(&.path).to_s
    end

    def offset
      @offset ||= begin
        contents = File.read(uri.path.to_s)

        char_count = 0
        line_count = 0
        line_char_count = 0

        while char = contents[char_count]?
          break if position.line == line_count &&
                   position.character == line_char_count

          case char.to_s
          when "\n", "\r"
            line_count += 1
            line_char_count = 0
          else
          end

          line_char_count += 1
          char_count += 1
        end

        char_count
      end
    end
  end
end
