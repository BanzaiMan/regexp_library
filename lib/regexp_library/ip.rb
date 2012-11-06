module RegexpLibrary
  module IP
    _UP_TO_256 = /(?<!-)(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)/
    # valid IPv4 address in 4 octets written in decimals
    V4 = /\b#{_UP_TO_256}\.#{_UP_TO_256}\.#{_UP_TO_256}\.#{_UP_TO_256}\b/

    # any decimal number upto 65535
    PORT = /\b(?<!-)(?:6553[0-5]|655[0-2][0-9]|65[0-4][0-9][0-9]|6[0-4][0-9][0-9][0-9]|[0-4]?(?:[0-9][0-9]{,3}))\b/
  end

end
