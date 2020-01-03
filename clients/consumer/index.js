let kafka = require('kafka-node');
let config = require('../config.js');

let client = new kafka.KafkaClient({ kafkaHost: 'localhost:9092' });
let topics = [{ topic: config.KAFKA_TOPIC }];
let options = { autoCommit: false, fetchMaxWaitMs: 1000, fetchMaxBytes: 1024 * 1024 };

let consumer = new kafka.Consumer(client, topics, options);

consumer.on('message', function (message) {
  console.log(message);
});

consumer.on('error', function (err) {
  console.log(err);
});