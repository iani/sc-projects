/*  2 Mar 2022 19:33
Draft for plotting the output of Wolfram.
*/

//:
(
w = Window.new.front;
w.view.background_(Color.white);
w.drawFunc = {
    10000.do{ | i |
        // set the Color
        Pen.color = [Color.black, Color.white]@(i%2);
        Pen.addRect(
            Rect(i % 100 * 2, (i / 100).asInteger * 3, 2, 2)
        );
        Pen.fill;
    }
};
w.refresh;
)