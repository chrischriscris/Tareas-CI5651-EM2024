use std::env;

use tunnel_ads::parse_instance;

fn main() {
    let args: Vec<String> = env::args().collect();
    let file_path = &args[1];

    let tuples = parse_instance(file_path);

    for tuple in tuples {
        println!("{:?}", tuple);
    }
}
