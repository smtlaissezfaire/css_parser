require "rubygems"
require "treetop"
require File.dirname(__FILE__) + "/css_parser/css_pre_parser"

Treetop.load File.dirname(__FILE__) + "/css_parser/css_time"
Treetop.load File.dirname(__FILE__) + "/css_parser/css_frequency"

Treetop.load File.dirname(__FILE__) + "/css_parser/css_primitives"
Treetop.load File.dirname(__FILE__) + "/css_parser/css"
