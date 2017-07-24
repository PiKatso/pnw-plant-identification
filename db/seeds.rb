class Seed

  def self.begin
    Plant.destroy_all
    seed = Seed.new
    seed.generate_plants
  end

  def generate_plants
    20.times do |i|
      plant = Plant.create!(
        name: Faker::Ancient.god,
        scientific_name: Faker::Ancient.hero,
        plant_type: Faker::Ancient.titan,
        general: Faker::Hobbit.character,
        ecology: Faker::Hobbit.thorins_company,
        leaves: Faker::Hobbit.location,
        cones: Faker::Ancient.primordial,
        branches: Faker::Hobbit.location,
        bark: Faker::Ancient.primordial,
      )
      Plant.all.each do |p|
      puts "Made #{p.name}"
      end
    end
  end

end

Seed.begin
