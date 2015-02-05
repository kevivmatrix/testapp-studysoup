require "rails_helper"

describe "Product" do
  context "search" do
    let!(:product1) { FactoryGirl.create :product, name: "random 12" }
    let!(:product2) { FactoryGirl.create :product, name: "search" }
    let!(:product3) { FactoryGirl.create :product, name: "random 21" }
    let(:query) { "Sear" }
    context "when query is passed" do
      it "should return products matching provided search query" do
        Product.search(query).should eq [ product2 ]
      end
    end
    context "when query is not passed" do
      it "should return products matching provided search query" do
        Product.search.should eq [ product1, product2, product3 ]
      end
    end
  end
  context "filter" do
    let!(:product1) { FactoryGirl.create :product, filter: "Laptop" }
    let!(:product2) { FactoryGirl.create :product, filter: "PC" }
    let!(:product3) { FactoryGirl.create :product, filter: "Tablet" }
    let!(:product4) { FactoryGirl.create :product, filter: "PC" }
    let!(:product5) { FactoryGirl.create :product, filter: "Phone" }
    let!(:product6) { FactoryGirl.create :product, filter: "Tablet" }
    context "filter params passed" do
      it "should return products that belong to the filter" do
        Product.filter(["PC", "Phone"]).should =~ [ product2, product4, product5 ]
      end
    end
    context "no filter params passed" do
      it "should return products that belong to the filter" do
        Product.filter.should =~ [ product1, product2, product3, product4, product5, product6 ]
      end
    end
  end
end
