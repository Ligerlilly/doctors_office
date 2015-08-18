require 'spec_helper'

describe Specialty do

  before do
    @specialty = Specialty.new({ id: nil, specialty: "Neurology" })
  end

  describe '#id' do
    it 'returns the id of the specialty' do
      expect(@specialty.id).to eq 0
    end
  end

end
