use std::collections::HashMap;
use postgres::{Client, NoTls};
use rand::Rng;


pub struct Species {
    id: i32,
    name: String,
}

impl Species {
    pub fn new(id: i32, name: String) -> Self {
        Species { id, name }
    }
}

pub struct Career {
    id: i32,
    name: String,
}

impl Career {
    pub fn new(id: i32, name: String) -> Self {
        Career { id, name }
    }
}


pub struct Character {
    species: String,
    career: String,
    career_level: u8,
    attributes: HashMap<String, u8>,
    skills: HashMap<String, u8>,
    talents: HashMap<String, u8>,
    trappings: Vec<String>,
}

impl Character {
    pub fn new(species: Species, career: Career, career_level: u8) -> Self {
        let mut client = Client::connect("host=localhost user=postgres dbname=wfrp", NoTls).unwrap();

        let mut attributes = HashMap::new();
        let mut skills: HashMap<String, u8> = HashMap::new();
        let mut talents = HashMap::new();
        let trappings = Vec::new();

        let species_id = species.id;

        for row in client.query(
            "SELECT Attributes.Name as attribute, SpeciesAttributes.AdditionalAdjustment as value
                    FROM SpeciesAttributes
                    INNER JOIN Attributes ON SpeciesAttributes.AttributesID=Attributes.ID
                    WHERE SpeciesAttributes.SpeciesID = $1",
                    &[&species_id]).unwrap() {
            let attribute_name: String = row.get("attribute");
            let attribute_value: i32 = row.get("value");
            attributes.insert(
                attribute_name,
                rand::thread_rng().gen_range(1, 11) + rand::thread_rng().gen_range(1, 11) + attribute_value as u8);
        }

        Character {
            species: species.name.to_string(),
            career: career.name.to_string(),
            career_level: career_level,
            attributes: attributes,
            skills: skills,
            talents: talents,
            trappings: trappings,
        }
    }

    pub fn take_test(&mut self, skill: String, dificulty: u8) -> bool {
        let roll = rand::thread_rng().gen_range(1, 101);

        match self.skills.get(&skill) {
            Some(&skill_value) => {
                return skill_value + dificulty >= roll;
            }
            None => {
                println!("Skill not found: {}", skill);
                return false;
            }
        }
    }
}