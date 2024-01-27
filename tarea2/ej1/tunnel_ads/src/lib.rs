mod utils;
mod petition;

use utils::parse_instance;

/// Given a file path for an instance of the tunnel ads problem, in the format:
///
/// <p1> <t1>
/// <p2> <t2>
/// ...
/// <pn> <tn>
///
/// where p1, p2, ..., pn are the petition's start and t1, t2, ..., tn are the
/// petition's size, returns a vector of usize, each one representing
/// the index of the accepted ad petitions that maximizes the number of accepted
/// petitions that do not overlap each other.
pub fn solve(file_path: &str) -> Vec<usize> {
    let mut petitions = parse_instance(file_path);
    petitions.sort();

    let mut last_end = 0;
    let mut solution = Vec::new();
    for petition in petitions {
        if petition.start >= last_end {
            last_end = petition.end;
            solution.push(petition.id as usize);
        }
    };

    solution
}
