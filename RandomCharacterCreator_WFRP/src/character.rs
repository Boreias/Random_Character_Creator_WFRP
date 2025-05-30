use std::collections::HashMap;
use rand::seq::SliceRandom;
use rand;

use crate::db::Db;


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
    pub fn new(mut db: Db, species: Species, career: Career, career_level: u8, experience: u32) -> Self {
        let mut attributes = HashMap::new();
        let mut skills: HashMap<String, u8> = HashMap::new();
        let mut talents = HashMap::new();
        let trappings = Vec::new();

        let species_id = species.id;

        // Get species attributes
        for row in db.query(
            "SELECT Attributes.Name as attribute, SpeciesAttributes.AdditionalAdjustment as value
                    FROM SpeciesAttributes
                    INNER JOIN Attributes ON SpeciesAttributes.AttributesID=Attributes.ID
                    WHERE SpeciesAttributes.SpeciesID = $1",
                    &[&species_id]).unwrap() {
            let attribute_name: String = row.get("attribute");
            let attribute_value: i32 = row.get("value");
            attributes.insert(
                attribute_name,
                rand::random_range(1..11) + rand::random_range(1..11) + attribute_value as u8);
        }


        // Get species skills
        let mut species_skills_vec: Vec<String> = Vec::new();
        for row in db.query(
            "SELECT Skills.Name as skill
                    FROM SpeciesSkills
                    INNER JOIN Skills ON SpeciesSkills.SkillsID=Skills.ID
                    WHERE SpeciesSkills.SpeciesID = $1",
                    &[&species_id]).unwrap() {
            let skill_name: String = row.get("skill");
            species_skills_vec.push(skill_name);
        }
        species_skills_vec.shuffle(&mut rand::rng());
        skills.insert(species_skills_vec.pop().unwrap(), 5);
        skills.insert(species_skills_vec.pop().unwrap(), 5);
        skills.insert(species_skills_vec.pop().unwrap(), 5);
        skills.insert(species_skills_vec.pop().unwrap(), 3);
        skills.insert(species_skills_vec.pop().unwrap(), 3);
        skills.insert(species_skills_vec.pop().unwrap(), 3);

        // Get species talent
        let mut species_talents_vec: Vec<String> = Vec::new();
        for row in db.query(
            "SELECT Talents.Name as talent
                    FROM SpeciesTalents
                    INNER JOIN Talents ON SpeciesTalents.TalentsID=Talents.ID
                    WHERE SpeciesTalents.SpeciesID = $1",
                    &[&species_id]).unwrap() {
            let talent_name: String = row.get("talent");
            species_talents_vec.push(talent_name);
        }
        species_talents_vec.shuffle(&mut rand::rng());
        talents.insert(species_talents_vec.pop().unwrap(), 1);
        

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

    fn prepare_take_test(&mut self, db: &mut Db, skill: String) -> (String, bool) {
        let skill_db = db.query_one(
            "SELECT Skills.IsBasic as is_basic, Attributes.Name as attribute_name
                    FROM Skills
                    INNER JOIN Attributes ON Skills.AttributeID=Attributes.ID
                    WHERE Skills.Name = $1",
            &[&skill]).unwrap();

        let is_basic = skill_db.get("is_basic");
        let attribute_name: String = skill_db.get("attribute_name");

        (attribute_name, is_basic)
    }

    pub fn take_simple_test(&mut self, db: &mut Db, skill: String, dificulty: u8) -> bool {
        let roll = rand::random_range(1..101);

        let (attribute_name, is_basic) = self.prepare_take_test(db, skill.clone());

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

    pub fn take_test(&mut self, db: &mut Db, skill: String, dificulty: u8) -> i32 {
        let roll = rand::random_range(1..101);

        let (attribute_name, is_basic) = self.prepare_take_test(db, skill.clone());

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