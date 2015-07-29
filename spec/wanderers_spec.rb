require '../lib/wanderers'

describe Wanderers do
  let(:api) { Wanderers::Api.new }

  it "returns a wanderer name for a given ID" do
    expect(api.wanderer_by_id 1).to eq 'Good Cook Dennis'
  end

  it "handles bad ids" do
    expect(api.wanderer_by_id 999).to eq ""
  end

  it "returns a random wanderer with no id" do
    expect(api.wanderer == "").to eq false
  end
end
