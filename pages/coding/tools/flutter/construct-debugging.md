---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Construct-Debugging
---

## Contents of this page:

- [Paying for matchboxes / payment](#paying-for-matchboxes--payments)

# Paying for matchboxes / payments

- When working locally, you can avoid the payment screen...
    - by creating Matchboxes with price = 0
    - by commenting out the lines of code in `matchbox_preview.dart` that call `showDialog` for the `paymentScreen`
        - eg Here: https://github.com/MentrixGroup/construct/blob/affb82fcd1337c3d407dceda71a0df9929ac46f4/app/lib/screens/matchbox_preview.dart#L86C5-L94C8
        - (code has changed since then but you can prob find equivalent)
