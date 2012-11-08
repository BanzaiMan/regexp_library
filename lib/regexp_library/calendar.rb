module RegexpLibrary
  module Calendar
    module W3C
      # a subset of valid ISO8601 date formats that W3C recommends
      # See http://www.w3.org/TR/NOTE-datetime
      # Note that _ISO8601DATE_ does not match agains tany anchor.
      # It is your responsibility to check against partial matches.
      year = /\d{4}/
      month = /0\d|1[0-2]/
      day   = /[0-2]\d|3[01]/ # note we do not verify that we do not validate this
      hour  = /[01]\d|2[0-3]/
      min   = /[0-5]\d/
      sec   = /[0-5]\d|60/ # W3C does not mention it, but we explicitly allow 60
      subsec = /\.\d+/
      tz     = /Z|[-+]#{hour}:#{min}/

      ISO8601DATE=/#{year}(?:(?:(?:-#{month})?-#{day})?T#{hour}:#{min}(?::#{sec}(?:#{subsec})?)?#{tz})?/

    end
  end
end
