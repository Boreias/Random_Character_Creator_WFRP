mod character;
use character::{Character, Species, Career};
use postgres::{Client, NoTls};
use rand::Rng;


fn main() {
    let mut client = Client::connect("host=localhost user=postgres dbname=wfrp", NoTls).unwrap();

    let species_roll = rand::thread_rng().gen_range(1, 101);

    let species_db = client.query_one(
        "SELECT ID, Name FROM Species WHERE $1 BETWEEN InitialPercentage AND MaxPercentage",
        &[&&species_roll]).unwrap();

    let species = Species::new(species_db.get(0), species_db.get(1));


    let career_roll = rand::thread_rng().gen_range(1, 101);

    let career_db = client.query_one(
        "SELECT ID, Name FROM Career WHERE $1 BETWEEN InitialPercentage AND MaxPercentage",
        &[&&career_roll]).unwrap();
    
    let career = Career::new(career_db.get(0), career_db.get(1));

    let character = Character::new(species, career, 1);
}
