RSpec.describe Tools::Raindrop do
    let(:rain) { Tools::Raindrop.new(23) }
    let(:pling) { 'Pling' }
    it ' should be instance of Tools::Raindrop' do
        expect(rain).to be_instance_of(Tools::Raindrop)
    end

    it ' should be Integer' do
        expect(rain.num).to be_a(Integer)
    end

    it ' should return a String' do
        expect(rain.output).to be_a(String)
    end

    it ' should output \'Pling\' when it has 3 as factor' do
        rain = Tools::Raindrop.new(9)
        expect(rain.output).to eq('Pling')
    end

    it ' should output \'Plang\' when it has 5 as factor'do
        rain = Tools::Raindrop.new(20)
        expect(rain.output).to eq('Plang')
    end

    it ' should output \'Plong\' when it has 7 as factor'do
        rain = Tools::Raindrop.new(28)
        expect(rain.output).to eq('Plong')
    end

    it ' should output \'PlingPlang\' when it has 3,5 as factor ' do
        rain = Tools::Raindrop.new(30)
        expect(rain.output).to eq('PlingPlang')
    end

    it ' should output \'PlingPlangPlong\' for number 105' do
        rain = Tools::Raindrop.new(105)
        expect(rain.output).to eq('PlingPlangPlong')
    end
    it ' should output number as it is, if it doesnt have non of 3,5,7 as factors' do
        rain = Tools::Raindrop.new(34)
        expect(rain.output).to eq('34')
    end
end