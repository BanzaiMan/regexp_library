require 'regexp_library/math'
module RegexpLibrary::Math
  describe PRIME do
    [2, 3, 5, 7, 11, 43, 1597].each do |p|
      it "does not match against a prime number of 1's" do
        RegexpLibrary::Math::PRIME.match("1" * p).should be_nil
      end
    end
  end
end
