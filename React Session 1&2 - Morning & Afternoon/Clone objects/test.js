const x = { a: "a", b: "b", c: "c", d: "d", e: "e" };

//clone using spread operator
const fn2 = (obj) => {
  const ob = { ...obj };
  console.log(ob);
};

// clone using different functions
const fn3 = (temp) => {
  // using object assign()
  let alpha = Object.assign(temp, { x: "x" });
  console.log(temp);

  //using JSON parse()
  let beta = JSON.parse(JSON.stringify(temp));
  console.log(beta);

  alpha = { a: "z" };
  console.log("alpha: ", alpha);
  console.log("temp: ", temp);

  beta = { a: "z" };
  console.log("beta: ", beta);
  console.log("temp: ", temp);
};

fn2(x);
fn3(x);
