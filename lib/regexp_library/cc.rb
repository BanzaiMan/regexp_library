module RegexpLibrary
  module CC

    class Validator
      attr_reader :prefix, :lengths, :modulo, :illegal_chars
      def initialize(prefix = //, lengths = [], modulo = 0, illegal_chars = /[^0-9]/)
        @prefix = prefix
        @lengths = lengths
        @modulo = modulo
        @illegal_chars = illegal_chars
      end

      def valid?(cc_num)
        cc_num = cc_num.gsub(/\s/,'')
        cc_num =~ Regexp.new(/\A#{@prefix}/) &&
          @lengths.include?(cc_num.length) &&
          luhn_check_digit(cc_num) % 10 == @modulo
      end

      def luhn_check_digit(str, prohibited = @illegal_chars)
        raise ArgumentError if str =~ Regexp.new(prohibited)
        digits = normalize(str)
        sum    = ''
        digits.each_with_index do |n, idx|
          digit = n.to_i
          if idx & 1 == 0
            sum += digit.to_s
          else
            sum += (digit * 2).to_s
          end
        end
        ((sum.split('').inject(0) {|total, n| total += n.to_i}) * 9) % 10
      end

      def normalize(cc_num)
        # "Law" of Demeter be damned…
        digits = cc_num.gsub(/\s/,'').split('').compact.reverse # right to left…
      end

      private :luhn_check_digit, :normalize
    end

    # http://en.wikipedia.org/wiki/Bank_card_number
    AmericanExpress         = Validator.new /3[47]/, [15]
    CarteBlanche            = Validator.new /30[0-5]/, [14]
    DinersClubInternational = Validator.new /36/, [14]
    DinersClub              = Validator.new /5[45]/, [16]
    Discover                = Validator.new /6011|622(?:[2-8]|1[01]|12[6-9]|9[01]|92[0-5])|64[4-9]|65/, [16]
    JCB                     = Validator.new /35(?:2[8-9]|[3-8])/, [16]
    Laser                   = Validator.new /6(?:304|706|771|709)/, (16..19).to_a
    Maestro                 = Validator.new /5018|5020|5038|5893|6304|6759|6761|6762|6763|0604/, (12..19).to_a
    MasterCard              = Validator.new /5[1-5]/, [16]
    Visa                    = Validator.new /4/, [13,16]
    VisaElectron            = Validator.new /4026|417500|4508|4844|4913|4917/, [16]

  end
end
