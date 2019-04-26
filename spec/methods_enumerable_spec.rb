require_relative '.\Test_Enumerable_module\methods_enumerable.rb'

Rspec.describe Enumerable do
  it "It loops through an enumerable object" do
    res=[]
    [1,2,3,4].my_each{|v| res.push(v + 1)}
    expect(res).to eql([2,3,4,5]) 
  end
end
