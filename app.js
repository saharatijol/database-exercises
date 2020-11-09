var faker = require('faker');

// faker.internet.email()
// faker.date.past()

//console.log(faker.internet.email());

//console.log(faker.date.past());


function generateAddresses(){
    console.log(faker.address.streetAddress());
    console.log(faker.address.city());
    console.log(faker.address.state());
}

generateAddresses();
generateAddresses();
generateAddresses();