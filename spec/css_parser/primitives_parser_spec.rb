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
  
  it "should not parse a negative percentage (or should it)?"
  
  # lengths
  
  it "should parse 0.5em" do
    parse("0.5em").should_not be_nil
  end
  
  it "should parse 1em" do
    parse("1em").should_not be_nil
  end
  
  it "should parse -1em" do
    parse("-1em").should_not be_nil
  end
  
  it "should parse 2em" do
    parse("2em").should_not be_nil
  end
  
  it "should parse 1ex" do
    parse("1ex").should_not be_nil
  end
  
  it "should parse 1.5ex" do
    parse("1.5ex").should_not be_nil
  end
  
  it "should parse 1px" do
    parse("1px").should_not be_nil
  end
  
  it "should parse -134.4px" do
    parse("-134.4px").should_not be_nil
  end
  
  it "should parse 0.5in" do
    parse("0.5in").should_not be_nil
  end
  
  it "should parse 3cm" do
    parse("3cm").should_not be_nil
  end
  
  it "should parse 4mm" do
    parse("4mm").should_not be_nil
  end
  
  it "should parse 12pt" do
    parse("12pt").should_not be_nil
  end

  it "should parse 1pc" do
    parse("1pc").should_not be_nil
  end
  
  # urls
  
  schemes =  [:ftp, :http, :https, :gopher, :mailto, :news, :nntp]
  schemes += [:telnet, :wais, :file, :prospero ]
  
  schemes.each do |scheme|
    it "should parse #{scheme}//eastmedia.com/" do
      parse("#{scheme}://eastmedia.com/").should_not be_nil
    end
  end
  
  it "should parse http://google.com/" do
    parse("http://google.com/").should_not be_nil
  end
  
  it "should parse a url with a long path http://google.com/foo/bar/baz" do
    parse("http://google.com/foo/bar/baz").should_not be_nil
  end
  
  it "should parse a url from a different domain" do
    parse("http://foobar.com").should_not be_nil
  end
  
  it "should not parse a strange domain" do
    parse("http://localhost").should_not be_nil
  end
  
  it "should take a relative path" do
    parse("/foo/bar.gif").should_not be_nil
  end
  
  it "should allow port numbers" do
    parse("http://localhost:3000").should_not be_nil
  end
  
  it "should allow a port number of 1" do
    parse("http://localhost:1").should_not be_nil
  end
  
  it "should allow a port number of port number of 65536" do
    parse("http://localhost:65536").should_not be_nil
  end
  
  it "should allow a query string with a question mark and key value pair" do
    parse("http://localhost:3000/foo?bar=quxx").should_not be_nil
  end
  
  it "should allow a query string with multiple key value pairs" do
    parse("http://localhost:3000/foo?bar=quxx&foo=bar").should_not be_nil
  end
  
  it "should allow a query string with three key value pairs" do
    parse("http://localhost:3000/foo?bar=quxx&foo=bar&one=two").should_not be_nil
  end
  
  it "should allow a query string with multiple key value pairs with numbers as values" do
    pending 'todo'
    parse("http://localhost:3000/foo?bar=1&foo=2").should_not be_nil
  end

  
  # TODO: See http://www.w3.org/TR/REC-CSS2/syndata.html#values
  
  # TODO: Numbers, integers
  
  # TODO: Counters
  
  # TODO: Angles
  
  it "should parse 10deg" do
    parse("10deg").should_not be_nil
  end
  
  it "should parse 10grad" do
    parse("10grad").should_not be_nil
  end
  
  it "should parse 10rad" do
    parse("10rad").should_not be_nil
  end
  
  it "should parse -10deg" do
    parse("-10deg").should_not be_nil
  end
  
  it "should parse 1234.45deg" do
    parse("1234.45deg").should_not be_nil
  end
  
  it "should parse +10deg" do
    parse("+10deg").should_not be_nil
  end
  
  # TODO: Times
  
  it "should parse 10ms" do
    parse("10ms").should_not be_nil
  end
  
  it "should parse 10s" do
    parse("10s").should_not be_nil
  end
  
  it "should not parse -10s" do
    parse("-10s").should be_nil
  end
  
  it "should parse 11ms" do
    parse("11ms").should_not be_nil
  end
  
  it "should not parse -11ms" do
    parse("-11ms").should be_nil
  end
  
  it "should parse 11.2s" do
    parse("11.2s").should_not be_nil
  end
  
  # TODO: Frequencies
  
  it "should parse 10Hz" do
    parse("10Hz").should_not be_nil
  end
  
  it "should parse 10kHZ" do
    parse("10kHz").should_not be_nil
  end
  
  it "should parse +10Hz" do
    parse("+10Hz").should_not be_nil
  end
  
  it "should parse 11.2Hz" do
    parse("11.2Hz").should_not be_nil
  end
  
  it "should NOT parse -10Hz" do
    parse("-10Hz").should be_nil
  end
  
  # TODO: Strings
end
