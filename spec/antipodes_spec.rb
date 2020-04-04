require './lib/tools/antipodes'

RSpec.describe Tools::Antipode do
    let(:antipodes) { Tools::Antipode.new([]) }

    it 'should return true for antidopes as instance' do
        expect(antipodes).to be_instance_of(described_class)
    end

    it 'should return [] for empty array' do
        expect(antipodes.average).to eq([])
    end

    it 'should return the input array if contains less then two elements' do
        expected = [2]
        antipodes = Tools::Antipode.new([2])
        expect(antipodes.average).to eq(expected)
    end
    it 'should return [2.5,2.5] for array [1,2,3,4]' do
        antipodes = Tools::Antipode.new([1,2,3,4])
        expected = [2.5,2.5]
        expect(antipodes.average).to eq(expected)
    end

    it ' should return [3,3]  for [1, 2, 3, 4, 5]' do
        antipodes = Tools::Antipode.new([1,2,3,4,5])
        expected = [3, 3]
        expect(antipodes.average).to eq(expected)
    end

    it 'should return [-1.5] for [-1, -2]' do
        antipodes = Tools::Antipode.new([-1,-2])
        expected = [-1.5]
        expect(antipodes.average).to eq(expected)
    end
end