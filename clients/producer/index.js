const kafka = require('kafka-node');
const config = require('../config');
const readline = require('readline');
const fs = require('fs');

const client = new kafka.KafkaClient({kafkaHost: config.KAFKA_SERVER});
const producer = new kafka.Producer(client);

const readInterface = readline.createInterface({
  input: fs.createReadStream('./producer/data/bank-full.csv'),
  // output: process.stdout,
  output: null,
  console: false
});

/*
  1 - age (numeric)
  2 - job : type of job (categorical: "admin.","unknown","unemployed","management","housemaid","entrepreneur","student",
                                      "blue-collar","self-employed","retired","technician","services") 
  3 - marital : marital status (categorical: "married","divorced","single"; note: "divorced" means divorced or widowed)
  4 - education (categorical: "unknown","secondary","primary","tertiary")
  5 - default: has credit in default? (binary: "yes","no")
  6 - balance: average yearly balance, in euros (numeric) 
  7 - housing: has housing loan? (binary: "yes","no")
  8 - loan: has personal loan? (binary: "yes","no")
  # related with the last contact of the current campaign:
  9 - contact: contact communication type (categorical: "unknown","telephone","cellular") 
  10 - day: last contact day of the month (numeric)
  11 - month: last contact month of year (categorical: "jan", "feb", "mar", ..., "nov", "dec")
  12 - duration: last contact duration, in seconds (numeric)
    # other attributes:
  13 - campaign: number of contacts performed during this campaign and for this client (numeric, includes last contact)
  14 - pdays: number of days that passed by after the client was last contacted from a previous campaign (numeric, -1 means client was not previously contacted)
  15 - previous: number of contacts performed before this campaign and for this client (numeric)
  16 - poutcome: outcome of the previous marketing campaign (categorical: "unknown","other","failure","success")
*/

const attributes = ['age', 'job', 'marital', 'education', 'default', 'balance', 'housing', 'loan', 'contact', 'day', 'month', 'duration', 'campaign', 'pdays', 'previous', 'poutcome', 'outcome'];

const convertToJson = (line) => {
  let values = line.split(';');
  let json = {};
  values.forEach((value, index) => {
    json[attributes[index]] = value.replace(/"/g, "");
  });
  return json;
}

producer.on('ready', async function() {
  readInterface.on('line', function(line) {
    let message = JSON.stringify(convertToJson(line));
    // console.log(message);

    producer.send([{topic: config.KAFKA_TOPIC, messages: [message]}], err => {
      if (err) {
        console.log(`Broker failed to update on topic ${config.KAFKA_TOPIC}`);
      } else {
        // console.log(`Broker update success on topic ${config.KAFKA_TOPIC}`);
      }
    });
  });
});

producer.on('error', function(err) {
  console.log(`Connection to ${config.KAFKA_TOPIC} failed: ${err}`);
  throw err;
});