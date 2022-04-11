use std::collections::HashMap;

fn main() {
    let text = "hello world wonderful world";

    let mut map = HashMap::new();

    for word in text.split_whitespace() {
        let count = map.entry(word).or_insert(0);
        *count += 1;
        println!("{:?}", map);
    }
    for _ in 0..3 {
        let count = map.entry("hello").or_insert(0);
        *count = 55;
    }
    println!("{:?}", map);
}
