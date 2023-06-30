/* 23 Feb 2022 14:40

*/
//: Testing status reply from server
Server.defalt.boot;
'status.reply' |>| { "status received".postln; };
'status.reply' |>| TestAction();
//:Deactivate status reply action.
'status.reply'.removeOsc;
// ================ Test setting a bus from osc
//: Start a test synth.
{ | freq = 400 | SinOsc.ar(freq, 0, 0.1).adsr.dup } +> \test;
//: Map the freq parameter to a bus
// If the bus is new, frequency will be set to = and no sound will be audible
~test.map(\freq, \bus.bus);
//:Set the bus to midi 7 - change the feequency
\bus.bus.set(67.midicps);
//:SetBus per default sets the first value received to bus named \bus:
\test |>| SetBus(); // create the binding
//: Test the binding over OSC
NetAddr.localAddr.sendMsg(\test, 72.midicps);