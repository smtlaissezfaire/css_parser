class CSSPreparser
  def parse(string)
    remove_extra_spaces(replace_comments(string))
  end
  
private
  
  def replace_comments(string)
    string.gsub(/\/\*.*?\*\//, "")
  end
  
  def remove_extra_spaces(string)
    string.gsub(/\s+/, " ")
  end
end
