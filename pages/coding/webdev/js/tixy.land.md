---
layout: page
location: pages/coding/webdev/js/leaf
permalink: /pages/coding/webdev/js/tixy.land
---

![mondrian squares](/resources/images/mondrian_squares.png)

## tixy.land creative javascript graphic coding game

It's available [here](https://tixy.land/). You can write your own code by adding it to the url like this: https://tixy.land/?code=%27HAVE+FUN%21%27. To help with your memory, I've copied out all the possibilities below:

The code returns the visibility for every dot. You can think of the values 0 and 1 representing true (visible) and false (invisible). The values between 0 and 1 represent more or less visible, or you can think of them as the radius of the circle (small radius = smaller circle = less visible). Negative numbers create red dots. Input is limited to 32 characters.

Params:

- Param `t` represents the time in seconds and allows you to animate. 
- Param `i` is the index of the dot (0..255).
- Param `x` is the column index (from 1 to 16).
- Param `y` is the row index (from 1 to 16).

Examples: 

- `Math.random() < 0.1` (returns 1 or 0)
- `Math.random()` (returns a value between 0 and 1)
- `Math.sin(t)` (`t` is the time in seconds)
- `i / 256` (`i` is the index of the dot - 0..255)
- `x / 16` (`x` is the column index - 1..16)
- `y / 16` (`y` is the row index - 1..16)
- `y - 8.5` (negative numbers are red)
- `y - t` (use time to animate)
- `y - t*4` (multiply time to increase speed)
- `[1, 0, -1][i%3]` (cycle colours / visibility from one dot to the next)
- `Math.sin(y/8 + t)` 
- `y - x` (simple triangle)
- `(y > x) && (16-x < y)` (quarter triangle)
- `i%4 - y%4` (pattern)
- `x%4 && y%4` (grid)
- `x>4 & y>4 & x<12 & y<12` (square)
- `-(x>t & y>t & x<16-t & y<16-t)` (animated square)
- `(y-6) * (x-6)` (mondrian squares) (see image below)
- `(y-4*t|0) * (x-8-t|0)` (moving cross)
- `4 * t & i & x & y` (sierpinski)
- `(t*10) & (1<<x) && y==8` (binary clock)
- `Math.random() * 2 - 1` (random noise)
- `Math.sin(i ** 2)` (smooth noise)
- `Math.sin(x/2)-Math.sin(x-t)-y+6` (waves)
- `Math.sin(t-Math.sqrt(x*x+y*y))` (ripples by @thespite)
- `(x-8)*(y-8) - Math.sin(t) * 64` (bloop bloop bloop by @v21)
- `y == x || -(17-x == y)` (diagonals)
- `(x-y) - Math.sin(t) * 16` (wipe)
- `Math.sin(t*5) * Math.tan(t*7)` (disco)
- `(x-5)**2+(y-5)**2-99*Math.sin(t)` (moving circle)


![mondrian squares](/resources/images/mondrian_squares.png)

My experiments:
- [`Math.cos(2*t*((i%2)%25(x*y)))`](https://tixy.land/?code=Math.cos(2*t*((i%2)%25(x*y))))
- [`Math.sin(10*t*((i%2F256)%25(x*y)))`](https://tixy.land/?code=Math.sin(10*t*((i%2F256)%25(x*y))))
- [`[1,%200,%20-1][i%3]-Math.sin(2*t)`](https://tixy.land/?code=[1,%200,%20-1][i%3]-Math.sin(2*t))
- [`((Math.sin(x+y)))*Math.sin(t)`](https://tixy.land/?code=((Math.sin(x+y)))*Math.sin(t))
- [`(x*Math.cos(10*t)>0)?-1:0`](https://tixy.land/?code=(x*Math.cos(10*t)>0)?-1:0) (flashing light v1)
- [`(x*Math.cos(10*t)>0)?-1:1`](https://tixy.land/?code=(x*Math.cos(10*t)>0)?-1:1) (flashing light v2)
- [`(x*y*Math.cos(5*t)>8)?-1:1`](https://tixy.land/?code=(x*y*Math.cos(5*t)>8)?-1:1) (encroaching circle)
- [`(x*y*Math.cos(5*t)>30)?-1:1`](https://tixy.land/?code=(x*y*Math.cos(5*t)>30)?-1:1)
- [`(x*y*Math.cos(5*t)%3E8)?-1:1`](https://tixy.land/?code=(x*y*Math.cos(5*t)%3E8)?-1:1)