Given /^The regular expression "(.*?)" in "(.*)"$/ do |re, mod|
  eval "@regexp = RegexpLibrary::#{mod}::#{re}"
end

When /^is matched against "(.*?)"$/ do |str|
  @target = str
end

Then /^it should be "(.*?)"$/ do |expected|
  if expected == "true"
    @target.should =~ @regexp
  elsif expected == "false"
    @target.should_not =~ @regexp
  else
    raise "'match?' should be either 'true' or 'false'"
  end
end

