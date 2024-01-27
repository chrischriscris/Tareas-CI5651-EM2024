use std::fs::File;
use std::io::{BufRead, BufReader};

use crate::petition::Petition;

/// Returns a vector of Petition structs, each one representing a petition, with
/// its start and end, from a file with the following format:
///
/// <p1> <t1>
/// <p2> <t2>
/// ...
/// <pn> <tn>
///
/// where p1, p2, ..., pn are the petition's start and t1, t2, ..., tn are the
/// petition's size.
pub fn parse_instance(file_path: &str) -> Vec<Petition> {
    let file = File::open(file_path).expect("Error opening file");
    let reader = BufReader::new(file);

    let mut petitions: Vec<Petition> = Vec::new();

    let mut id = 1;
    for petition in reader.lines() {
        let petition = petition.expect("Error reading line");
        let mut numbers = petition.split_whitespace();

        let p: u32 = numbers
            .next()
            .expect("Invalid line format")
            .parse()
            .expect("Error parsing number");

        let t: u32 = numbers
            .next()
            .expect("Invalid line format")
            .parse()
            .expect("Error parsing number");

        petitions.push(Petition::new(id, p, t));
        id += 1;
    }

    petitions
}
