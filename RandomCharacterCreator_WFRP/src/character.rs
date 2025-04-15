use std::collections::HashMap;
use postgres::{Client, NoTls};
use rand::Rng;


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
    pub fn new(species: String, career: String, career_level: u8) -> Self {
        let mut attributes = HashMap::new();
        let mut skills = HashMap::new();
        let mut talents = HashMap::new();
        let trappings = Vec::new();

        Character {
            species,
            career,
            career_level,
            attributes,
            skills,
            talents,
            trappings,
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