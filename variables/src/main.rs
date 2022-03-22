struct User {
    email: String,
    username: String,
    active: bool,
    sign_in_count: i32,
}

fn main() {
    let output = build_user(String::from("test@e621.net"), String::from("examplename"));
    println!("{}", output.email);
}

fn build_user(email: String, username: String) {
    User {
        email: email,
        username: username,
        active: true,
        sign_in_count: 1,
    }
}