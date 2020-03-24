RSpec.describe Tools::WordCount do
    let(:word) { Tools::WordCount.new('') }

    it ' should return true for instance' do
        expect(word).to be_instance_of(Tools::WordCount)
    end

    it 'should be type of string' do
        expect(word.count).to be_a(Hash)
    end

    it 'should return olly:2 'do
        word = Tools::WordCount.new('olly olly')
        hash = {"olly"=>2}
        expect(word.count).to eq(hash)
    end

    it 'should give olly:2, on:1, for:1' do
        word = Tools::WordCount.new('olly on for olly')
        hash = {"olly"=>2,"on"=>1,"for"=>1}
        expect(word.count).to eq(hash)
    end

    it 'should give olly:2 even if it has symbols' do
        word = Tools::WordCount.new('olly, & olly')
        hash = {"olly"=>2}
        expect(word.count).to eq(hash)
    end

    it 'should return olly:2 if it has olly OLLY' do
        word = Tools::WordCount.new('olly, & OLLY')
        hash = {"olly"=>2}
        expect(word.count).to eq(hash)
    end
end