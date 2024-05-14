const LEDPin = 4;
const wpi = require('wiring-pi');

// set up wiring
wpi.setup('wpi');
wpi.pinMode(LEDPin, wpi.OUTPUT);

//blinkLED();
//LED Setup
wpi.digitalWrite(LEDPin, 1);

setTimeout(function() {wpi.digitalWrite(LEDPin, 0);}, 500);