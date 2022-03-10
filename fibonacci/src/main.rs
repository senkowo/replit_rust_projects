use std::io;

fn main() {
  let mut input = String::new();

  println!("Enter n^th place in fibonacci sequence");
  io::stdin().read_line(&mut input).expect("failed to readline");

  println!("user input: {}", input);
}