require 'coverage_stats'
require 'approvals'

RSpec.describe "coverage", "stats" do
  it "does stuff" do
    expected = File.read('spec/expected_coverage.txt')
    output = get_coverage_data('spec/coverage.xml')
    expect(output).to eq expected
  end
end
