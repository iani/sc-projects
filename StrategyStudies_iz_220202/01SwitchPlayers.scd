/*  3 Feb 2022 01:03
Play 10 moves, taking turns between player and opponent.
*/
//
var player, opponent;
// initialize player and opponent for a game where X plays first:
player = 0;
opponent = 1;
~switchPlayers = { // toggle values between 0 and 1:
	player = 1 - player;
	opponent = 1 - opponent;
};
10 do: {
    postf("player: %, opponent: %\n", player, opponent);
    ~switchPlayers.value;
};
