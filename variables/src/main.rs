fn main() {
    let s = String::from("hewwo hooman >w<");
    let first_word = ret_first_word(&s);
    println!("The first word of '{}' is '{}'", s, first_word);

    let s = "awoo! cries the cute momiji";
    let first_word = ret_first_word(&s);
    println!("The first word of '{}' is '{}'", s, first_word);
}

fn ret_first_word(s: &str) -> &str {
    let byte_arr = s.as_bytes();

    for (i, &byte) in byte_arr.iter().enumerate() {
        if byte == b' ' {
            return &s[..i];
        }
    }

    &s
}
