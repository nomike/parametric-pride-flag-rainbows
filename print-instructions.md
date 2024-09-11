The rainbow pins are divided into several stripes with different heights.
By adding a filament change between individual layers, you can print the stripes in different
colors.

The pins are designed to be printed with a single filament printer.

A number of presets are already defined and you can just run `make` to generate the STL files for
them.

If your paricular flag is not on the list, or if you want to customize the pins in any other way,
you can open `parametric pride rainbows.scad` in OpenSCAD and change the parameters in the
customizer.

##### Adding color changes

When you load the STL in prusa slicer, it will show a message that the object looks like a logo and
will ask you whether it should add color changes automatically. You should confirm this.

**Note:** I've noticed, that the automatic color change detection in prusa slicers is not perfect and sometimes makes mistakes. In particuar it mostly doesn't add a color change for the top most layer.

If you use another slicer software or an older version of prusa slicer, you will have to add the
color changes manually. Please check your slicer documentation for instructions on how to do this.

##### A few words about filament

There are various brands of filament available with different colors and translucency. In an ideal world, filament will be 100% opaque and you will have the perfectly colored filaments available for the flags you want to print.

In reality though you will have a limited range of filament you own and colors look different based on what's underneath.
A light blue will look darker if it's on top of a black layer than it would look if the layer below it was white.
This could sometimes be exploited to your advantage. If you print white, orange, black, orange for example, you could achive two shades of orange.

The example STL files available and generated represent the best I was able to achive with the colors I had available.
As I bought more different colors of filament, I was able to revise some of them, making them look better. In order to remain backwards compatible, I introduced new versions of those flags and kept the old ones.

You should print single test pieces first and experiment with the filament you own to see what looks best.
Open the design in OpenSCAD and change the parameters accordingly. In most cases it's sufficient to change the color_array in the customizer.

##### Instructions for various flags

The following flags are defined as presets and here are instructions on how to print them.
It mostly is a list of which color filament you should load into your printer in which order.

If there are special instructions for a particular flag, they will be listed here.

###### 6-Color Pride Flag

Load filament in this order:

1. Red
2. Orange
3. Yellow
4. Green
5. Blue
6. Purple

###### Transgender Pride Flag

Load filament in this order:

1. White
2. Light Pink
3. Light Blue

###### Nonbinary Pride Flag

Load filament in this order:

1. Yellow
2. White
3. Purple
4. Black

###### Asexual Pride Flag

Load filament in this order:

1. Black
2. Grey
3. White
4. Purple

###### Bisexual Pride Flag

Load filament in this order:

1. Pink
2. Purple
3. Blue

###### Pansexual Pride Flag

Load filament in this order:

1. Pink
2. Yellow
3. Blue

###### Lesbian Pride Flag

The lesbian flag contains three shades of orange and three shades of purple.
I don't want to buy that many different colors of filament, so I've used a little trick.

As each stripe is only one layer thicker then the next one, the color looks different depending on
the layer directly below. So if you print lavender on top of white, it looks lighter than if you
print it on top of black.

For this flag I've used that approach. The heights of the layer, from the smallest to the largest
stripe are 9,7,3,1,2,5,8.

Notice that there is no stripes with a layer height of 4 or 6. This is because these layer should be
printed in black, to make the next layer a bit darker, but the black should not be on top.

The logo-detection of your slicer will not add filament changes for these two layers, so you have to
add them manually.

Depending on the opacity of your filament you might need to experimet a bit with different orders.

For the provided example load Filament in this order

1. White
2. Orange
3. Light Pink
4. Black
5. Orange
6. Black
7. Lavender
8. Dark Orange
9. Dark Purple

It doesn't look perfect, but IMHO the flag is recognizable.

###### Lesbian Pride Flag v2

An easier version with less stripes which uses less filament changes.
Even though the top stripe should be a dark orange, red is close enough to look nice and appropriate.

1. White
2. Orange
3. Red
4. Light Pink
5. Purple

###### Gay Mens Pride Flag

Look at [Lesbian Pride Flag](#lesbian-pride-flag) for instructions, as it is printed in the same way.

Load filament in this order:

1. White
2. Green
3. Blue
4. Black
5. Green
6. Black
7. Blue
8. Dark Green
9. Dark Blue

###### Abrosexual Pride Flag

I also didn't have enough colors for that one and faked them with the trick pointed out in [Lesbian Pride Flag](#lesbian-pride-flag).

Only it is less colors now.

Load filament in this order, and add a color change at the start of the 4th stripe layer:

1. White
2. Red
3. Green
4. Black
5. Red
6. Black
7. Green

###### Abrosexual Pride Flag v2

As I got more variety in filament colors, I could print the flag with less trickery and less filament changes.

1. White
2. Turqoise / Light Green
3. Light Rose
4. Green
5. Purple

**Note:** As the Light Rose filament I use was a bit too translucent I printed two layers of it for the color to be nice. Consider this when setting the filament changes in your slicer.

###### Heterosexual Pride Flag

Load filament in this order:

1. White
2. Black

###### Maverique Pride Flag

Load filament in this order:

1. White
2. Yellow
3. Orange

###### Graysexual Pride Flag

Load filament in this order:

1. White
2. Gray
3. Purple

###### Gender Queer Pride Flag

Load filament in this order:

1. White
2. Green
3. Lavender

###### Intersex Pride Flag

Load filament in this order:

1. Yellow
2. Purple

###### Polyamory Pride Flag

Load filament in this order:

1. Pink
2. Light Blue
3. Dark Purple
4. White
5. Yellow

**Note:** White is printed for two layers to better cover the dark purple right underneath.

###### Leather Pride Flag

This flag is also sometimes used by members of the BDSM community.

Load filament in this order:

1. White
2. Blue
3. Black
4. Red
