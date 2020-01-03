const kafka = require('kafka-node');
const config = require('../config');

const client = new kafka.KafkaClient(config.KAFKA_SERVER);
const producer = new kafka.Producer(client);

let payloads = [
  { 
    topic: config.KAFKA_TOPIC,
    messages: ['This is a test payload']
  }
];

producer.on('ready', async function() {
  producer.send(payloads, err => {
    if (err) {
      console.log(`Broker failed to update on topic ${config.KAFKA_TOPIC}`);
    } else {
      console.log(`Broker update success on topic ${config.KAFKA_TOPIC}`);
    }
  });
});

producer.on('error', function(err) {
  console.log(`Connection to ${config.KAFKA_TOPIC} failed: ${err}`);
  throw err;
});