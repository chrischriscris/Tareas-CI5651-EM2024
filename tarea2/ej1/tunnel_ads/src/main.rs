use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    let instance_path = &args[1];

    let solution = tunnel_ads::solve(instance_path);

    solution.iter().for_each(|i| print!("{} ", i));
    println!();
}
