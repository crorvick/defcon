EFF Def Con 21 Shirt Contest
============================

The shirt given out by the EFF at Def Con 21 included prizes for the
first 10 people to crack the puzzle on the front of the shirt.  The
shirt is divided into two sections: the cipher text and the key.

On the center of the shirt is a picture of a key on a red rectangular
background.  Within the background is a bunch of binary which decodes
to:

    violating terms of service is not a crime

if interpreted as ASCII.  When the shirt is put under a black light,
though, a subset of the ones and zeros glow.  Mapping this binary string
using ASCII results in:

    d[EFF]con

This is the key to the solution.  The cipher text is found around the
red rectangle.  The most difficult part of this puzzle is getting this
data into a usable format.  Once entered into a file as ASCII and then
converted to binary, the file can be decrypted with the above key using
GPG.  The cipher text is encoded with CAST5, GPG's default symmetric key
algorithm.

The cipher text decodes to the Bill of Rights with a URL at the end
offering the reader a reward.  The URL presented an image of Cyborg
Ada Lovelace with the text PASSWORD1 with further text on the page
instructing to send an email to an eff.org address with the shown
password.  First 10 to send the email were winners.
