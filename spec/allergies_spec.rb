RSpec.describe Tools::Allergies do

    let(:all) { ['cats','pollen','chocolate','tomatoes','strawberries','shellfish','peanuts','eggs'] }

    describe "determine whether or not they're allergic to a given item" do
      it 'matches the allergen with the score' do
        allergies = Tools::Allergies.new(1)
        expect(allergies.allergic_to?('eggs')).to be true
      end
      it 'does not match the allergen with the score' do
        allergies = Tools::Allergies.new(1)
        expect(allergies.allergic_to?('peanuts')).to be false
      end
      it 'matches multiple allergens with one score' do
        allergies = Tools::Allergies.new(3)
        expect(allergies.allergic_to?('eggs')).to be true
        expect(allergies.allergic_to?('peanuts')).to be true
      end
    end

    it 'should give chocolate and peanuts for score=34' do
        tom = Tools::Allergies.new(34)
        expect(tom.allergy_test).to eq(['chocolate','peanuts'])
    end

    it 'should give all allergies for score=255' do
        tom = Tools::Allergies.new(255)
        expect(tom.allergy_test).to match_array(all)
    end

    it 'should give eggs for score=256' do
      tom = Tools::Allergies.new(256)
      expect(tom.allergy_test).to eq([])
    end

    it 'should give eggs for score=257' do
        tom = Tools::Allergies.new(257)
        expect(tom.allergy_test).to eq(['eggs'])
    end
  end