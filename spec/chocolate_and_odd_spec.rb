require './lib/tools/chocolate_and_odd'

RSpec.describe Tools::Chocolate do
    # we have fairness? funcion for true false
    # we have 2 matrices inputed
    let(:main) { Tools::Chocolate }
    # checking for empty for nil etc..
    context 'Testing bad inputs' do
        it 'should return nil if there are not parameters' do
            expect( main.fairness?() ).to be nil
        end

        it 'should return nil even if there is only one parameter' do
            expect(main.fairness?(4)).to be nil
        end

        it 'should return nil if there are not matrices' do
            expect(main.fairness?([1, 2, 4],[2, 3, 4])).to be nil
        end
    end

    context 'Testing different cases' do
        it 'should return true if sum of person1 is equal with person2' do
            person1 = [[4, 3], [2, 4], [1, 2]]
            person2 = [[6, 2], [4, 2], [1, 1], [1, 1]]
            expect(main.fairness?(person1, person2)).to be true
        end

        it 'should return false if sum of person1 is not equal with person2' do
            person1 = [[4, 3], [2, 4], [1, 2]]
            person2 = [[6, 2], [4, 2], [1, 1], [1, 4]]
            expect(main.fairness?(person1, person2)).to be false
        end
    end
end

RSpec.describe Tools::Odd do
    let(:odd) { Tools::Odd.new() }

    context 'test for first method ' do
        it 'return 10 for given array[10]' do
            odd = Tools::Odd.new([10])
            expect(odd.first_odd_integer).to eq(10)
        end

        it 'should return 5 for given array[1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5, 5]' do
            odd = Tools::Odd.new([1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5, 5])
            expect(odd.first_odd_integer).to eq(5)
        end
    end

    context 'test for second method' do
        it 'should return 10 for [10]' do
            odd = Tools::Odd.new([10])
            expect(odd.all_odd_integers).to eq([10])
        end

        it 'should return 10 for [10]' do
            odd = Tools::Odd.new([1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5, 5])
            expect(odd.all_odd_integers).to eq([5, -1])
        end
    end
end