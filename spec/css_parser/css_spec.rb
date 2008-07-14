require File.dirname(__FILE__) + "/../spec_helper"

describe CSSParser do
  before :each do
    @parser = CSSParser.new
  end
  
  def parse(string)
    @parser.parse(string)
  end
  
  it 'should parse the string #foo' do
    parse("#foo").should_not be_nil
  end
  
  it "should parse the string #bar" do
    parse("#bar").should_not be_nil    
  end
  
  it 'should parse the string #fooBar' do
    parse("#fooBar").should_not be_nil
  end
  
  it "should parse the string .foo" do
    parse(".foo").should_not be_nil
  end
  
  it "should parse the string .bar" do
    parse(".bar").should_not be_nil
  end
  
  it "should parse a class with a rule, on one line" do
    parse(".bar{color:#000;}").should_not be_nil
  end
  
  it "should parse a class with two rules" do
    parse(".bar{color:#000;font-size:10px;}").should_not be_nil
  end
  
  it "should parse a class with three rules" do
    parse(".bar{color:#000;font-size:10px;padding-top:10px;}").should_not be_nil
  end
  
  it "should parse two classes, side by side" do
    parse(".foo,.bar").should_not be_nil
  end
  
  it "should parse three classes, side by side" do
    parse(".foo,.bar,.baz").should_not be_nil
  end
  
  it "should parse a class, and two id's side by side" do
    parse(".foo,#bar,#baz").should_not be_nil    
  end
  
  it "should parse two classes with a rule" do
    parse(".foo,.bar{color:red;}").should_not be_nil
  end
end
