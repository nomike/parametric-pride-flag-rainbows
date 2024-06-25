include<funcutils/string.scad>;
$fn=128;

minimum_height = 1;
layer_height = 0.2;
colors = 5;
outer_diameter = 55;
inner_diamter = 35;
step_width = (outer_diameter - inner_diamter) / colors;
insert_width = 5.1;
insert_length = 25.5;
knob_diameter = 2;
knob_distance = 6;
color_array = "6,5,4,3,2,1";


module knob(d, h) {
    cylinder(d=d, h=h);
}

module cutout() {
    outer_circle_height = sqrt(pow(outer_diameter / 2, 2) - pow(insert_length / 2, 2));
    cutout_offset = (insert_width / 2) + (inner_diamter / 2) + ((outer_circle_height - (inner_diamter / 2)) / 2);
    echo(cutout_offset);
    assert(cutout_offset - insert_width > inner_diamter / 2, "Warning: Cutout offset is less than inner radius. This will cause the cutout to overlap with the inner circle.");
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
    stripe_width = (outer_diameter - inner_diamter) / len(array);
    difference() {
        union() {
            for (i = [0 : len(array) - 1]) {
                difference() {
                    cylinder(h=minimum_height + array[i] * layer_height, d=inner_diameter + (i + 1) * stripe_width);
                    cylinder(h=minimum_height + array[i] * layer_height, d=inner_diameter + (i) * stripe_width);
                }
            }
        }
        color("Tomato") translate([-outer_diameter/2, 0, 0]) cube([outer_diameter, outer_diameter / 2, minimum_height + (layer_height * max(array))]);
    }
}

module rainbow() {
    difference() {
        union() for (i = [0 : colors]) {
            cylinder(h=minimum_height + (layer_height * i), d=outer_diameter - (i * step_width));
        }
        cylinder(h=minimum_height + (layer_height * colors), d=outer_diameter - (colors * step_width));
        translate([-60, 0, 0]) cube([120, 60, minimum_height + (layer_height * colors)]);
    }
}




difference() {
    rainbow_array([ for (i = split(color_array, ",")) float(i)], layer_height, minimum_height, inner_diamter, outer_diameter);
    cutout();    
}
