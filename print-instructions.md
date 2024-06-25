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

If you use another slicer software or an older version of prusa slicer, you will have to add the
color changes manually. Please check your slicer documentation for instructions on how to do this.

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

1. Light Blue
2. Light Pink
3. White

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

Alternatively you might just buy tons all different colors of filament and print it straight forward
with layer heights 7,6,5,1,2,3,4 and load the colors like this:

1. White
2. Light Orange
3. Mid Orange
4. Dark Orange
5. Light Pink
6. Mid Pink
7. Dark Pink

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
