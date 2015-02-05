desc "populate products"
task :populate => :environment do
  Product.populate(100) do |product|
    product.name = Populator.words(2).titleize
    product.description = Populator.sentences(5)
    product.filter = %w{ Tablet Phone Laptop PC }
  end
end
