require File.expand_path '../common', __FILE__

module RegexpLibrary
  module Color
    hex = HEX
    SHORT = /##{hex}{3}\b/
    LONG  = /##{hex}{6}\b/
    RGB   = /#(?:#{hex}{3}){1,2}\b/
  end
end

