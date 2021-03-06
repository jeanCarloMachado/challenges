fn main() {
    for result in run_to_seq(1,100).iter() {
        println!("{}", result);
    }
}

fn run_to_seq(start: i32, end: i32)  -> Vec<String> {
}


#[test]
fn test_1_to_16() {
    let expected = vec![
        "1",
        "2",
        "Fizz",
        "4",
        "Buzz",
        "Fizz",
        "7",
        "8",
        "Fizz",
        "Buzz",
        "11",
        "Fizz",
        "13",
        "14",
        "FizzBuzz",
        "16",
    ].iter()
    .map(|&s| s.to_string())
    .collect();

    assert_eq!(run_to_seq(1,16), expected);
}
