RSpec.describe Tools::Resistor do
    let(:var) { Tools::Resistor}

    it 'should return nil if its empty' do
        expect(var.color_coded).to eq(nil)
    end

    describe 'The program will take color names as input and output digit number' do
        it 'should return digit as output' do
            expect(var.color_coded(['brown'])).to be_a(Integer)
        end
    
        it 'should return 18 for [\'brown\',\'gray\']'do
            expect(var.color_coded(['brown','gray'])).to eq(18)
        end
    end

    describe 'should return two digit number, even if the input is more than two colors!'do
        it 'should return 8 for [\'gray\']'do
            expect(var.color_coded(['gray'])).to eq(8)
        end

        it 'should return 15 even if there are 3 colors'do
            expect(var.color_coded(['brown','green','violet'])).to eq(15)
        end

        it 'should return 2 digit even id there are 4 colors'do
            expect(var.color_coded(['gray','green','violet','blue'])).to eq(85)
        end
    end
end