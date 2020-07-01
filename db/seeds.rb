Song.destroy_all

30.times do 
    Song.create(title:Faker::Music::Prince.song, released:true, release_year: rand(1960..2020), artist_name: Faker::GreekPhilosophers.name, genre: Faker::Music.genre)
end