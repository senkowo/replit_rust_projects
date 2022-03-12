use::std::io;

fn main() {
    println!("Temperature converter!");
    loop {
        println!("Type 'C' for Celcius and 'F' for Fahrenheit for the desired output scale: ");

        let mut scale = String::new();
        io::stdin().read_line(&mut scale).expect("Failed to read line");


        println!("For a test {}", scale);


        if scale != "C" || scale != "F" {
            println!("Incorrect input, please try again.");
            continue;
        }

        print!("Input the initial value: ");

        let mut value = String::new();
        io::stdin().read_line(&mut value).expect("Failed to read line");
        let value: i32 = match value.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                println!("Incorrect input, please try again.");
                continue;
            },
        };

        let output = if scale == "C" {
            (5/9)*(value-32)
        } else {
            (9/5)*value+32
        };

        println!("Your value in {}° is {}°.", scale, output)
    }
}
