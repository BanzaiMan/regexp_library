require 'regexp_library/ip'

module RegexpLibrary::IP
  describe V4 do
    ["0.0.0.0", "255.255.255.0", "255.255.255.255"].each do |ip|
      it "matches edge cases" do
        V4.match(ip).should be_true
      end

      it "does not capture any data" do
        V4.match(ip)[1].should be_false
      end
    end

    ["0.1.2.256", "9.10.11", "1000.134.1.12"].each do |ip|
      it "rejects non-IPv4 addresses" do
        V4.match(ip).should be_nil
      end
    end
  end

  describe PORT do
    [0, 65535, 12345, "blah blah 65535"].each do |p|
      it "matches valid port number" do
        PORT.match(p.to_s).should be_true
      end
    end

    [65536, 65540, 65635, 66535, -65535].each do |p|
      it "rejects invalid port number" do
        PORT.match(p.to_s).should be_nil
      end
    end
  end

end
