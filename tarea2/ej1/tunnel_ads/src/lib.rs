use std::fs::File;
use std::io::{BufRead, BufReader};

/// Returns a vector of tuples extracted from a file in the format:
///
/// <p1> <t1>
/// <p2> <t2>
/// ...
/// <pn> <tn>
pub fn parse_instance(file_path: &str) -> Vec<(u32, u32)> {
    let file = File::open(file_path).expect("Error opening file");
    let reader = BufReader::new(file);

    let mut tuples: Vec<(u32, u32)> = Vec::new();

    for line in reader.lines() {
        let line = line.expect("Error reading line");
        let mut numbers = line.split_whitespace();

        let num1: u32 = numbers
            .next()
            .expect("Invalid line format")
            .parse()
            .expect("Error parsing number");
        let num2: u32 = numbers
            .next()
            .expect("Invalid line format")
            .parse()
            .expect("Error parsing number");

        tuples.push((num1, num2));
    }

    tuples
}

fn order_by_sum

