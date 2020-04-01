RSpec.describe Tools::Resistor do
    let(:var) { Tools::Resistor}

    it 'should return nil if its empty' do
        expect(var.color_coded).to eq(nil)
    end

    describe 'The program will take color names as input and output digit number' do
        it 'should return digit as output' do
            expect(var.color_coded([:brown])).to be_a(Integer)
        end
    
        it 'should return 18 for [\'brown\',\'gray\']'do
            expect(var.color_coded([:brown,:gray])).to eq(18)
        end
    end

    describe 'should return two digit number, even if the input is more than two colors!'do
        it 'should return 8 for [\'gray\']'do
            expect(var.color_coded([:gray])).to eq(8)
        end

        it 'should return 15 even if there are 3 colors'do
            expect(var.color_coded([:brown,:green,:violet])).to eq(15)
        end

        it 'should return 2 digit even id there are 4 colors'do
            expect(var.color_coded([:gray,:green,:violet,:blue])).to eq(85)
        end
    end

    describe ' using method specification for multipliers and tolerance' do
        it 'should return 20 as default tolerance' do
            expected = '16000000.0 ohms +/-20%'
            expect(var.specification([:brown, :blue, :blue])).to eq(expected)
        end

        it 'should return 16000000 ohms for [:brown, :blue, :blue]' do
            expected = '16000000.0 ohms +/-20%'
            expect(var.specification([:brown, :blue, :blue])).to eq(expected)
        end

        it 'should return +/-2% for [:red] tolerance' do
            expected = '16000000.0 ohms +/-2%'
            expect(var.specification([:brown, :blue, :blue,:red])).to eq(expected)
        end

        it 'should return 1.6 ohms for gold multiplier' do
            expected = '1.6 ohms +/-2%'
            expect(var.specification([:brown, :blue, :gold,:red])).to eq(expected)
        end
    end
end