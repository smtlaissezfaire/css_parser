require File.dirname(__FILE__) + "/../spec_helper"

describe CSSPrimitivesParser do
  before :each do
    @parser = CSSPrimitivesParser.new
  end
  
  def parse(string)
    @parser.parse(string)
  end
  
  it "should parse the hex value #000" do
    parse("#000").should_not be_nil
  end
  
  it "should not parse the fake hex value #0000"do
    parse("#0000").should be_nil
  end
  
  it "should parse the hex value #fff" do
    parse("#fff").should_not be_nil
  end
  
  it "should not parse the fake hex value #hhh" do
    parse("#hhh").should be_nil
  end

  it "should not parse the fake hex value #ggg" do
    parse("#ggg").should be_nil
  end
  
  it "should parse the hex value #FFF" do
    parse("#FFF").should_not be_nil
  end
  
  it "should parse a 6 digit hex value" do
    parse("#123456").should_not be_nil
  end
end
