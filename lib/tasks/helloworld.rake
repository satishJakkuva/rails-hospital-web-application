namespace :helloworld do
  desc 'hello world'
  task hello: :environment do
    puts 'hello world'
  end

  task add: :environment do
    a = 10
    b = 20
    puts a + b
  end
  task multiply: :environment do
    a = [1, 2, 3, 4]
    a.each do |mul|
      puts mul * 2
    end
  end
end
