/* 24 Nov 2022 14:33

*/

\pingpongdebug.tr_(200, 100).hlayout(
	VLayout(
		HLayout(
			StaticText().string_("Ping"),
			Button().states_([
				["start", Color.red], ["stop", Color.blue]
			]).action_({ | me |
				\pingpongActions !!* [\stopSound, \startSound][me.value];
			}).value_(1)
		),
		Button().states_([["Take ball"]])
		.action_({
			"ping take ball pushed".postln;
			\pingpong.sensorbus.set(1);
			\pingpong.changed(\pingIsOn);
		})
		.addNotifier(\pingpong, \pingIsOn, { | n |
			// "Ping Take Ball received pingIsOn".postln;
			n.listener.states = [["Take ball", Color.blue]]
		})
		.addNotifier(\pingpong, \pongIsOn, { | n |
			n.listener.states = [["Take ball", Color.red]]
		}),
		Button().states_([["Play ball"]])
		.action_({
			"ping play ball pushed".postln;
			\pingpongActions !!* \trigPing;
		})
		.addNotifier(\pingpong, \pingIsOn, { | n |
			// "ping"
			n.listener.states = [["Play ball", Color.red]];
		})
		.addNotifier(\pingpong, \pongIsOn, { | n |
				n.listener.states = [["Play ball", Color.blue]];
		})
	),
	VLayout(
		StaticText().string_("Pong"),
		Button().states_([["Take ball"]])
		.action_({
			"pong take ball pushed".postln;
			\pingpong.sensorbus.set(0);
			\pingpong.changed(\pongIsOn);
		})
		.addNotifier(\pingpong, \pingIsOn, { | n |
			n.listener.states = [["Take ball", Color.red]]
		})
		.addNotifier(\pingpong, \pongIsOn, { | n |
			n.listener.states = [["Take ball", Color.blue]]
		}),
		Button().states_([["Play ball"]])
		.action_({
			"pong play ball pushed".postln;
			\pingpongActions !!* \trigPong;
		})
		.addNotifier(\pingpong, \pingIsOn, { | n |
			n.listener.states = [["Play ball", Color.blue]];
		})
		.addNotifier(\pingpong, \pongIsOn, { | n |
			n.listener.states = [["Play ball", Color.red]];
		})
	)
);
