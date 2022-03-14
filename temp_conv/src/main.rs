use std::io;

fn main() {
    println!("\nTemperature converter!");
    loop {
        println!("Type '1' for F° => C° and '2' for C° => F°: ");
        let mut scale = String::new();
        io::stdin()
            .read_line(&mut scale)
            .expect("Failed to read line");
        if scale.trim() == "q" {
            break;
        };
        let scale: u8 = match scale.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                println!("Improper input, please try again.");
                continue;
            }
        };
        if (scale != 1) && (scale != 2) {
            println!("Incorrect input, please try again.");
            continue;
        }

        println!(
            "Input the initial value in {}: ",
            if scale == 1 { "Fahrenheit" } else { "Celcius" }
        );
        let mut value = String::new();
        io::stdin()
            .read_line(&mut value)
            .expect("Failed to read line");
        if value.trim() == "q" {
            break;
        };
        let value: f32 = match value.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                println!("Improper input, please try again");
                continue;
            }
        };

        match conv(value, scale) {
            Ok(out) => println!(
                "The output in {} is {}°\n\tType \"q\" to quit\n",
                if scale == 1 { "Celcius" } else { "Fahrenheit" },
                out
            ),
            Err(e) => println!(
                "{} at {}° {} to {}\n",
                e,
                value,
                if scale == 1 { "Fahrenheit" } else { "Celcius" },
                if scale == 1 { "Celcius" } else { "Fahrenheit" }
            ),
        }
    }
}

fn conv(v: f32, s: u8) -> Result<f32, &'static str> {
    let overflow = false;
    let output = if s == 1 {
        (v - 32.0) / 1.8
    } else {
        (v * 1.8) + 32.0
    };

    // yet to set up checking for overflow.
    match overflow {
        false => Ok(output),
        true => Err("Overflow Error"),
    }
}
