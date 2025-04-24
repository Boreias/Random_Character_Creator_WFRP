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
    pub fn new(species: Species, career: Career, career_level: u8, experience: u32) -> Self {
        let mut client = Client::connect("host=localhost user=postgres dbname=wfrp", NoTls).unwrap();

        let mut attributes = HashMap::new();
        let mut skills: HashMap<String, u8> = HashMap::new();
        let mut talents = HashMap::new();
        let trappings = Vec::new();

        let species_id = species.id;

        // Get species attributes
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
// Each Species has a variety of Skills and Talents to choose from.
// You may choose 3 Skills to gain 5 Advances each, and 3 Skills
// to gain 3 Advances each. If a Talent listing presents a choice, you
// select one Talent from the choices given. Any Random Talents are
// determined by the Random Talent table. If you roll a Talent you
// already have, you may reroll. Note: All Characters are assumed to
// be fluent in Reikspiel,, the language of the Empire, and do not
// need to take it as a Skill. For more on this, see page 124.

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

    fn prepare_take_test(&mut self, skill: String) -> (String, bool) {
        let mut client = Client::connect("host=localhost user=postgres dbname=wfrp", NoTls).unwrap();

        let skill_db = client.query_one(
            "SELECT Skills.IsBasic as is_basic, Attributes.Name as attribute_name
                    FROM Skills
                    INNER JOIN Attributes ON Skills.AttributeID=Attributes.ID
                    WHERE Skills.Name = $1",
            &[&skill]).unwrap();

        let is_basic = skill_db.get("is_basic");
        let attribute_name: String = skill_db.get("attribute_name");

        (attribute_name, is_basic)
    }

    pub fn take_simple_test(&mut self, skill: String, dificulty: u8) -> bool {
        let roll = rand::thread_rng().gen_range(1, 101);

        let (attribute_name, is_basic) = self.prepare_take_test(skill.clone());

        match self.skills.get(&skill) {
            Some(&skill_value) => {
                return (self.attributes.get(&attribute_name).unwrap() +  skill_value + dificulty) >= roll;
            }
            None => {
                if is_basic {
                    return (self.attributes.get(&attribute_name).unwrap() +  dificulty) >= roll;
                }
                println!("Skill not found: {}", skill);
                return false;
            }
        }
    }

    pub fn take_test(&mut self, skill: String, dificulty: u8) -> i32 {
        let roll = rand::thread_rng().gen_range(1, 101);

        let (attribute_name, is_basic) = self.prepare_take_test(skill.clone());

        match self.skills.get(&skill) {
            Some(&skill_value) => {
                return (((self.attributes.get(&attribute_name).unwrap() + skill_value + dificulty) / 10) - (roll / 10)) as i32;
            }
            None => {
                if is_basic {
                    return ((self.attributes.get(&attribute_name).unwrap() + dificulty) / 10 - (roll / 10)) as i32;
                }
                println!("Skill not found: {}", skill);
                return -10;
            }
        }
    }
}