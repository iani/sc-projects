/*presets for jun saved at 230820_211614*/

//: (0) jun plainsynthtest nil
(
'amp': [ 0.044233434114386, "LFNoise2.kr(5).range(100, 10000) / 50000.0", 'on' ],
'freq': [ 396.87070557371, "LFNoise2.kr(5).range(100, 10000)", 'on' ],
'playfunc': 'plainsynthtest',
)
//: (1) jun grainmagshift hanbaiki
(
'amp': [ 0.47129314688838, "", 'on' ],
'buf': 'hanbaiki',
'endframe': [ 289880, nil, nil ],
'playfunc': 'grainmagshift',
'pos': [ 0.12301587301587, "", 'on' ],
'rate': [ 1, "Impulse.kr(1)", 'on' ],
'shift': [ -200.0, "", 'off' ],
'startframe': [ 2726, nil, nil ],
'stretch': [ 0.60464285714286, "", 'off' ],
'trate': [ 50, "" ],
'vol': [ 6.6824137062232, "", 'off' ],
)
//: (2) jun phasebuf weddellpock
(
'amp': [ 0.77607709750567, "", 'off' ],
'buf': 'weddellpock',
'dur': [ 0.69047619047619, "", 'off' ],
'endframe': [ 512199, nil, nil ],
'playfunc': 'phasebuf',
'pos': [ 0.51190476190476, "", 'off' ],
'rate': [ 1.0, "LFNoise2.kr(5).range(0.15, 5.2)", 'on' ],
'startframe': [ 40859, nil, nil ],
'trate': [ 0.3531746031746, "", 'off' ],
'trig': [ 62.0, "", 'off' ],
'vol': [ 7.0107394809776, "", 'off' ],
)
//: (3) jun grainecho wind_strong
(
'amp': [ 0.0, "", 'off' ],
'buf': 'wind_strong',
'dur': [ 1.0, "LFNoise0.kr(10)", 'off' ],
'endframe': 1150514,
'playfunc': 'grainecho',
'pos': [ 0, "", 'off' ],
'rate': [ 0, "", 'off' ],
'startframe': 888712,
'trate': [ 0, "", 'off' ],
'vol': [ 0, "", 'off' ],
)
//: (4) jun grainecho2 wind_strong
(
'amp': [ 0, "", 'off' ],
'buf': 'wind_strong',
'dur': [ 0.24206349206349, "LFNoise.kr(4).range(1, 2);", 'off' ],
'endframe': 1150514,
'playfunc': 'grainecho2',
'pos': [ 0.45238095238095, "", 'off' ],
'rate': [ 1.9843535278686, "", 'off' ],
'startframe': 888712,
'trate': [ 0.63888888888889, "", 'off' ],
'vol': [ 8.6963025951121, "", 'off' ],
)
/* THE END */