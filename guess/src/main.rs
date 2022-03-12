use rand::Rng;
use std::cmp::Ordering;
use std::io;

fn main() {
    println!("Guess the number!");

    // declares the secret number using rand::thread_rng() with range 1-100
    let secret_number = rand::thread_rng().gen_range(1, 101);

    loop {
        println!("Please input your guess.");

        // String is best if need to know and mutate a string
        let mut guess = String::new();

        // for user input
        io::stdin()
            .read_line(&mut guess)
            .expect("Failed to read line");

        // shadows String guess into u32 int
        let guess: u32 = match guess.trim().parse() {
            // parse() returns enum and determines action based on that. 
            Ok(num) => num,
            Err(_) => continue,
        };

        println!("You guessed: {}", guess);

        // compares guess to secret_number
        match guess.cmp(&secret_number) {
            Ordering::Less => println!("Too small!"),
            Ordering::Greater => println!("Too big!"),
            Ordering::Equal => {
                println!("You win!");
                break;
            }
        }
    }
}
