mod character;
use character::{Character, Species, Career};
use postgres::{Client, NoTls};
use rand::Rng;
use std::env;


fn main() {
    let args: Vec<String> = env::args().collect();

    let mut client = Client::connect("host=localhost user=postgres dbname=wfrp", NoTls).unwrap();

    let species: Species;
    let career: Career;
    let career_level: u8;
    let experience: u32;

    if args.len() > 1 { // Espécie
        let species_argument = &args[1];

        let species_db = client.query_one(
            "SELECT ID, Name FROM Species WHERE Name = $1",
            &[&species_argument]).unwrap();
        species = Species::new(species_db.get(0), species_db.get(1));
    } else {
        let species_roll = rand::random_range(1..101);

        let species_db = client.query_one(
            "SELECT ID, Name FROM Species WHERE $1 BETWEEN InitialPercentage AND MaxPercentage",
            &[&&species_roll]).unwrap();

        species = Species::new(species_db.get(0), species_db.get(1));
    }

    if args.len() > 2 { // Carreira
        let career_argument = &args[2];

        let career_db = client.query_one(
            "SELECT ID, Name FROM Career WHERE Name = $1",
            &[&career_argument]).unwrap();
        career = Career::new(career_db.get(0), career_db.get(1));
    } else {
        let career_roll = rand::random_range(1..101);

        let career_db = client.query_one(
            "SELECT ID, Name FROM Career WHERE $1 BETWEEN InitialPercentage AND MaxPercentage",
            &[&&career_roll]).unwrap();
        
        career = Career::new(career_db.get(0), career_db.get(1));
    }

    if args.len() > 3 { // Nível de Carreira
        career_level = args[3].parse().unwrap();
    } else {
        career_level = 1;
    }

    if args.len() > 4 { // Pontos de Experiência
        experience = args[4].parse().unwrap();
    } else {
        experience = 70;
    }

    let character = Character::new(species, career, career_level, experience);
}
