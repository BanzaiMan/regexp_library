Given /^the validator (\S+)$/ do |validator|
  @validator = RegexpLibrary::CC.const_get(validator.to_sym)
end

When /^(\d+) is given$/ do |cc_num|
  @cc_num = cc_num
end

Then /^it returns (\S+)$/ do |result|
  if result == 'true'
    @validator.valid?(@cc_num).should be_true
  else
    @validator.valid?(@cc_num).should be_false
  end
end

