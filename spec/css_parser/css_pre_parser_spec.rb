require File.dirname(__FILE__) + "/../spec_helper"

describe CSSPreparser do
  before :each do
    @parser = CSSPreparser.new
  end
  
  def parse(string)
    @parser.parse(string)
  end
  
  it "should replace /* foo bar */ with an empty string" do
    parse('/* foo bar */').should == ""
  end
  
  it "should replace the comments in 'bar /* foo */baz" do
    parse('bar /* foo bar */baz').should == "bar baz"
  end
  
  it "should remove the extra spaces from the string" do
    parse("foo  bar   baz").should == "foo bar baz"
  end
  
  it "should replace the comments in 'bar /* foo */ baz /* a comment */ bar'" do
    parse('bar /* foo */ baz /* a comment */ bar').should == 'bar baz bar'
  end
end
