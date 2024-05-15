//Library and Setup
const BME280 = require('bme280-sensor');
const BME280_OPTION = {
  i2cBusNo: 1, // defaults to 1
  i2cAddress: BME280.BME280_DEFAULT_I2C_ADDRESS() // defaults to 0x77
};
sensor = new BME280(BME280_OPTION);
sensor.init().then(function () {
    sendingMessage = true;
  })
  .catch(function (err) {
    console.error(err.message || err);
  });

// Get Sensor Function Setup
function getSensorValue(cb) {
  sensor.readSensorData().then(function (data) {cb(data.temperature_C);});
}
//Get Sensor Value and Print to Console
getSensorValue(function (content) {console.log(content);});