module RegexpLibrary
  module Math
    # N 1's will match against this regular expression *if and only if*
    # N is not a prime.
    # This ingenious regular expression is attributed to the venerable
    # Abigail.
    # A thorough explanation can be found in
    # http://montreal.pm.org/tech/neil_kandalgaonkar.shtml
    PRIME = /^1?$|^(11+?)\1+$/
  end
end
