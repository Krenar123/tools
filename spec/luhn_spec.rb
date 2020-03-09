RSpec.describe Tools::Luhn do
    let(:test) { Tools::Luhn.new('0') }
    it ' doesnt allow single digit ' do
        expect(test.valid?).to be false
    end

    it ' doesnt allow empty strings' do
        expect(test.valid?).to be false
    end

    it 'doesnt allow single zero' do
        expect(test.valid?).to be false
    end

    it 'a simple valid sin that remains valid if reversed'do
        test = Tools::Luhn.new('059')
        expect(test.valid?).to be true
    end

    it 'a simple valid sin that becomes invalid if reversed' do
        test = Tools::Luhn.new('95')
        expect(test.valid?).to be false
    end
    it 'remains valid if there is ! included' do
        test = Tools::Luhn.new('233! 455$')
        expect(test.valid?).to be false
    end

    it 'valid strings with a non digit included become invalid' do
        test = Tools::Luhn.new('055a 444 285')
        expect(test.valid?).to be false
    end
    it 'valid strings with a non digit added at the end become invalid' do
        test = Tools::Luhn.new('059a')
        expect(test.valid?).to be false
    end
    it 'punctuation included become invalid' do
        test = Tools::Luhn.new('122-333-544')
        expect(test.valid?).to be false
    end
    it 'valid strings with symbols included become invalid'do
        test = Tools::Luhn.new('055# 444$ 285S')
        expect(test.valid?).to be false
    end
    it ' is invalid for single zero with space ' do
        test = Tools::Luhn.new(' 0')
        expect(test.valid?).to be false
    end
    it 'not valid with non digits string' do
        test = Tools::Luhn.new(':9')
        expect(test.valid?).to be false
    end

    it ' a valid canadian sin. ex-055 444 285' do
        test = Tools::Luhn.new('055 444 285')
        expect(test.valid?).to be true
    end
    it 'invalid canadian sin. ex-055 444 286' do
        test = Tools::Luhn.new('055 444 286')
        expect(test.valid?).to be false
    end
    it 'invalid credit card. Ex: 8273 1232 7352 0569'do
        test = Tools::Luhn.new('8273 1232 7352 0569')
        expect(test.valid?).to be false
    end

end