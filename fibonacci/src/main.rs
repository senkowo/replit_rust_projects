//use std::io;

fn main() {
    /*loop {
        println!("Enter nth number in fibonacci sequence: ");
        let mut inseq = String::new();
        io::stdin()
            .read_line(&mut inseq)
            .expect("Failed to read line");
        let inseq: u8 = match inseq.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                println!("Inproper input, please try again.");
                continue;
            },
        };

        match fib(inseq) {
            Ok(result) => println!("Fibonacci {} = {}", inseq, result),
            Err(e) => println!("Error at Fibonacci {}: {}", inseq, e),
        }

    }*/

    let nths = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 90, 91, 92, 93, 94, 95, 96];

    for nth in nths {
        match fib(nth) {
            Ok(result) => println!("Fibonacci {} = {}", nth, result),
            Err(e) => println!("Error at Fibonacci {}: {}", nth, e),
        }
    }
}

fn fib(n: u8) -> Result<u64, &'static str> {
    let mut prev: u64 = 0;
    let mut curr: u64 = 1;
    let mut overflow = false;
    for _ in 1..n {
        let result = prev.checked_add(curr);
        match result {
            Some(next) => {
                prev = curr;
                curr = next;
            }
            None => {
                overflow = true;
                break;
            }
        }
    }
    match overflow {
        false => Ok(curr),
        true => Err("Calculation overflow"),
    }
}

// tutorial --
// https://jeremybytes.blogspot.com/2021/09/coding-practice-learning-rust-with.html?m=1
