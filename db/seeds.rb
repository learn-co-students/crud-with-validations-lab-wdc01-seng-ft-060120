20.times {Song.create(title: Faker::Kpop.boy_bands,
    released: true, 
    release_year: rand(1999..2019),
    artist_name: Faker::Music.band,
    genre: Faker::Music.genre)}


