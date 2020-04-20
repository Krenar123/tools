require './lib/tools/pokemon'

RSpec.describe Tools::Pokemon do
    let(:pok) { Tools::Pokemon }

    it 'should return true' do
        expect(true).to be true
    end

    it 'should return 25' do
        expect(pok.calculate_damage("fire","water",100,100)).to eq(25)
    end

    it 'should return 175' do
        expect(pok.calculate_damage("grass","fire",35,5)).to eq(175)
    end

    it 'should return 50' do
        expect(pok.calculate_damage("electric","fire",100,100)).to eq(50)
    end
end

RSpec.describe Tools::AdjustTime do
    it 'should return "02:30:10"' do
        time = Tools::AdjustTime.new("01:00:00", 1, 30, 10)
        expect(time.adjusted_time).to eq("02:30:10")
    end

    it 'should return "23:23:00"' do
        time = Tools::AdjustTime.new("18:22:30", 4, 60, 30)
        expect(time.adjusted_time).to eq("23:23:00")
    end

    it 'should return "02:02:00"' do
        time = Tools::AdjustTime.new("00:00:00", 72, 120, 120)
        expect(time.adjusted_time).to eq("02:02:00")
    end
end