Given /^an integer (\d+)$/ do |integer|
  @int = integer.to_i
end

Then /^we determine that it (is (?:not)?) a prime$/ do |yn|
  str = "1" * @int
  if yn =~ /not$/
    str.should =~ RegexpLibrary::Math::PRIME
  else
    str.should_not =~ RegexpLibrary::Math::PRIME
  end
end

