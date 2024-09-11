include<funcutils/string.scad>;
$fn=128;

mode = "rainbow_array"; // [rainbow_array]

intersex = false;
polyamory = false;

epsilon = 0.01;
minimum_height = 1;
layer_height = 0.2;
outer_diameter = 55;
inner_diameter = 35;
insert_width = 5.1;
insert_length = 25.5;
knob_diameter = 2;
knob_distance = 6;
// Comma separated list of layer heights as integers, starting from the innermost circle
color_array = "3,1,2";
_color_array = [ for (i = split(color_array, ",")) float(i)];
_rainbow_width = (outer_diameter - inner_diameter) / 2;


_poly_triangle_height = minimum_height + (max(_color_array) + 2) * layer_height;


module knob(d, h) {
    cylinder(d=d, h=h);
}

module cutout() {
    outer_circle_height = sqrt(pow(outer_diameter / 2, 2) - pow(insert_length / 2, 2));
    cutout_offset = (insert_width / 2) + (inner_diameter / 2) + ((outer_circle_height - (inner_diameter / 2)) / 2);
    assert(cutout_offset - insert_width > inner_diameter / 2, "Warning: Cutout offset is less than inner radius. This will cause the cutout to overlap with the inner circle.");
    // Pin-Cutout
    translate([(-insert_length / 2), 0 - cutout_offset, 0]) color("Tomato") difference() {
        cube([ insert_length, insert_width, layer_height * 2]);
        // Knob 1
        translate([insert_length / 2 - knob_distance / 2 - knob_diameter / 2, insert_width / 2, layer_height * 2]) rotate([180, 0, 0]) knob(d=knob_diameter, h=layer_height * 2);        
        // Knob 2
        translate([insert_length / 2 + knob_distance / 2 + knob_diameter / 2, insert_width / 2, layer_height * 2]) rotate([180, 0, 0]) knob(d=knob_diameter, h=layer_height * 2);        
    }
}

module rainbow_array(array, layer_height, minimum_height, inner_diameter, outer_diameter) {
    stripe_width = (outer_diameter - inner_diameter) / len(array);
    difference() {
        union() {
            for (i = [0 : len(array) - 1]) {
                difference() {
                    cylinder(h=minimum_height + array[i] * layer_height, d=inner_diameter + (i + 1) * stripe_width);
                    translate([0, 0, -epsilon]) cylinder(h=minimum_height + array[i] * layer_height + epsilon * 2, d=inner_diameter + (i) * stripe_width);
                }
            }
        }
    }
}

module intersex() {
    circle_height = minimum_height + (max(_color_array) + 1) * layer_height;
    translate([0, 0 - (inner_diameter + _rainbow_width) / 2, epsilon]) difference() {
        cylinder(d=_rainbow_width * 0.58, h=circle_height);
        cylinder(d=_rainbow_width * 0.41, h=circle_height);
    }

}

module polyamory() {
   translate([inner_diameter / 2 * 0.9585, 0, -epsilon]) rotate([0, 0, -45]) color("Tomato") cube([_rainbow_width / sqrt(2) * 1.3, _rainbow_width / sqrt(2) * 1.3, _poly_triangle_height]);
    translate([inner_diameter / 2 * 0.9585 + _rainbow_width /2 * 1.3 - _rainbow_width * 0.45 / 2, -5.2, _poly_triangle_height - epsilon]) linear_extrude(layer_height + epsilon) resize([_rainbow_width * 0.45, 0], auto=true) import("heart.svg");
}

difference() {
    union() {
        rainbow_array(_color_array, layer_height, minimum_height, inner_diameter, outer_diameter);
        if (intersex) {
            intersex();
        }
        if (polyamory) {
            polyamory();
        }
    }
    translate([0,0,-epsilon]) cutout();    
    
    // trim half of the circle
    color("black") translate([-outer_diameter, 0, -1]) cube([outer_diameter * 2, outer_diameter, minimum_height + (layer_height * max(_color_array))+2]);
    // trim inner circle
    translate([0, 0, -epsilon*2]) cylinder(d=inner_diameter + epsilon, h=max(_color_array) + 10 * layer_height + epsilon * 3);
    // outer circle
    difference() {
    translate([0, 0, -epsilon*2]) cylinder(d=outer_diameter*2, h=max(_color_array) + 10 * layer_height + epsilon * 3);
    translate([0, 0, -epsilon*3]) cylinder(d=outer_diameter-epsilon, h=max(_color_array) + 10 * layer_height + epsilon * 4);
    }    
}
