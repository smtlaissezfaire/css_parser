require File.dirname(__FILE__) + "/../spec_helper"

describe CSSPrimitivesParser do
  before :each do
    @parser = CSSPrimitivesParser.new
  end
  
  def parse(string)
    @parser.parse(string)
  end
  
  # hex values
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
  
  # colors
  # aqua, black, blue, fuchsia, gray, green, lime, maroon, navy, olive, purple, red, silver, teal, white, and yellow
  # see http://www.w3.org/TR/REC-CSS2/syndata.html#color-units
  colors = %w(aqua black blue fuchsia gray green lime maroon navy olive purple red silver teal white yellow)
  
  colors.each do |color|
    it "should parse the color keyword #{color}" do
      parse(color).should_not be_nil
    end
  end
  
  it "should parse rgb(0,0,0)" do
    parse("rgb(0,0,0)").should_not be_nil
  end
  
  it "should parse rgb(1,0,0)" do
    parse("rgb(1,0,0)").should_not be_nil
  end
  
  0.upto(255) do |val1|
    it "should parse the color combination rgb(#{val1},0,0)" do
      parse("rgb(#{val1},0,0)").should_not be_nil
    end
  end
  
  it "should parse 255, 255, 255" do
    parse("rgb(255,255,255)").should_not be_nil
  end
  
  it "should not parse the color combination 256" do
    pending 'todo'
    parse("rgb(256,0,0)").should be_nil
  end
  
  # percentages
  
  it "should parse 0%" do
    parse("0%").should_not be_nil
  end
  
  it "should parse 1%" do
    parse("1%").should_not be_nil
  end
  
  it "should parse 9%" do
    parse("9%").should_not be_nil
  end
  
  it "should parse 10%" do
    parse("10%").should_not be_nil
  end
  
  it "should parse 100%" do
    parse("100%").should_not be_nil
  end
  
  it "should parse -10%" do
    parse("-10%").should_not be_nil
  end
  
  # rgb percentages
  it "should parse rgb percentages" do
    parse("rgb(10%,20%,100%)").should_not be_nil
  end
end
