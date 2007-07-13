class CompressCssFilter < TextFilter
  def filter(text)
    text.gsub!(/\/\*(.*?)\*\/\n*/, "") # remove comments
                                    # - caution, might want to remove this if using css hacks
    text.gsub!(/\n+/m, "\n")   # collapse newlines
    text.gsub!(/[ \t]+/, " ")  # collapse space
    text.gsub!(/^ /, "")       # collapse space
    text.gsub!(/\} +/, "}")    # collapse space
    text.gsub!(/\n$/, "")      # remove last break
    text.gsub!(/ *\{ */, "{")  # trim inside brackets
    text.gsub!(/ *\} */, "}")  # trim inside brackets
    text.gsub!(/: +/, ":")     # collapse :<space>
    text
  end
end
