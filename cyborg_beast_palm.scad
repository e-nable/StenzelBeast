//Nathaniel Stenzel's attempt to clone the Cyborg Beast palm in openscad.

module pinky_side_wrist_joint(){
	difference(){
		hull(){
		translate([-30.5,50,-22])cube([2,10,10]);
		translate([-29.5,20,-22])cube([2,20,1]);
		translate([-30.5,66,-17])rotate([0,90,0])cylinder(d=10,h=3);
		}
		translate([-34,64.8,-17.3])rotate([0,90,0])cylinder(d=5,h=8);
	}
}

module thumb_side_wrist_joint(){
	difference(){
		hull(){
		translate([22.5,46,-22])cube([2,21,10]);
		translate([22,66,-17])rotate([0,90,0])cylinder(d=10,h=3);
		}
		translate([21,64.8,-17.3])rotate([0,90,0])cylinder(d=5,h=8);
	}
}

module palm(digits=[true,true,true,true,true]){
	difference(){
		union(){
			if (digits[0]){
				echo("thumb");
				thumb_side_wrist_joint();
				translate([27.5,57.5,-9])rotate([250,-2,-2])thumb_mount();
			}
			pinky_side_wrist_joint();
			hull(){
			translate([-12.2,54,8])cube([21,8,5]);
				translate([-12.2,54,8])cube([21,8,2]);
				translate([-30.2,10,-19])cube([55.2,4,2]);
				translate([-3,46,-18])sphere(d=55);
				translate([-2.8,60,-15])rotate([87,0,0])cylinder(h=10,d=55.5);
			}//end of hull
			translate([-28.2,9,-22])cube([51.2,18,11]);
			translate([-30.2,10,-18])rotate([0,90,0])cylinder(d=8,h=55.2);
		}//end of union	

		//finger knuckle gaps
		translate([-26.3,10,-20])rotate([0,90,0])cylinder(d=16,h=4.8);
		translate([-12.3,10,-20])rotate([0,90,0])cylinder(d=16,h=4.8);
		translate([2.4,10,-20])rotate([0,90,0])cylinder(d=16,h=4.8);
		translate([16.3,10,-20])rotate([0,90,0])cylinder(d=16,h=4.8);
		//finger knuckle axel hole
		translate([-35,10.5,-18])rotate([0,90,0])cylinder(d=4,h=66);

		hull(){ //make room for the flesh
			translate([-7,45,-17])sphere(d=42);
			translate([1,45,-17])sphere(d=42);
			translate([-13,35,-20])sphere(d=30);
			translate([7.5,35,-20])sphere(d=30);
			translate([-3,65,-17])sphere(d=51);
		}
		//make room for more thumbs and fingers
		if(digits[4] == false) translate([-25.7,30,-20])rotate([90,0,0])cylinder(d=15,h=30);
		if(digits[3] == false) translate([-10,30,-20])rotate([90,0,0])cylinder(d=14,h=30);
		if(digits[2] == false) translate([5.4,30,-20])rotate([90,0,0])cylinder(d=14,h=30);
		if(digits[1] == false) translate([21,30,-20])rotate([90,0,0])cylinder(d=15,h=30);
		if(digits[0] == false) translate([20,59,-20])sphere(d=30);


		translate([-62,0,-57])cube([130,130,35]);
		translate([0,100,-10])sphere(d=74);
		//translate([-30,10,-10])rotate([35,0,0])cube([60,40,10]);
		translate([-2,34,-10])cylinder(d=5,h=20);
		translate([16,48,-10])cylinder(d=5,h=20);
		//5 holes near wrist through the top for finger wires
		translate([5.3,65,10.2])rotate([80,50,30])cylinder(d=2,h=9);
		translate([26,55,-4])rotate([-10,-45,0])cylinder(d=2,h=22);
		translate([2.5,65,11])rotate([90,0,18])cylinder(d=2,h=20);
		translate([-1.5,65,11])rotate([90,0,10])cylinder(d=2,h=20);
		translate([-5.0,65,11])rotate([90,0,-2])cylinder(d=2,h=20);
		translate([-8.5,65,11])rotate([93,0,-16])cylinder(d=2,h=20);

		//4 holes near fingers through the top for finger wires
		translate([-24,16,-22])rotate([-20,0,0])cylinder(d=2,h=20);
		translate([-10,16,-22])rotate([-20,0,0])cylinder(d=2,h=20);
		translate([5,16,-22])rotate([-20,0,0])cylinder(d=2,h=20);
		translate([18,16,-22])rotate([-20,0,0])cylinder(d=2,h=20);
		//elastic tie down spots for the fingers
		translate([-24,13,-22])rotate([0,0,0])cylinder(d=2,h=20);
		translate([-10,13,-22])rotate([0,0,0])cylinder(d=2,h=20);
		translate([5,13,-22])rotate([0,0,0])cylinder(d=2,h=20);
		translate([18,13,-22])rotate([0,0,0])cylinder(d=2,h=20);
		//4 grooves for finger wires
		translate([-24.5,22,-11])rotate([36,0,-21])cube([2,35,5]);
		translate([-11,22,-6])rotate([33,0,-10])cube([2,30,5]);
		translate([5,20,-5])rotate([27,0,9])cube([2,35,5]);
		translate([17,20,-10])rotate([32,0,20])cube([2,39,5]);
	}
	echo(digits);
}

module thumb_mount(){
	difference(){
		hull(){
			translate([-8,-7,-10])cube([1,1,10.5]);
			translate([0,0,-10])cylinder(d=7,h=10.5);
			translate([0,0,-10])cylinder(d=7,h=10.5);
			translate([10,10.5,-10])cylinder(d=12,h=10.5);
			translate([-5,-6,-10])cube([1,22,10.5]);
		}
		hull(){
			translate([0,0,-8.3])cube([1,40,7]);
			translate([10,16,-8.3])cube([15,1,7]);
		}
		translate([0,0,-14])cylinder(d=3,h=20);
		translate([4,2.7,-14])cylinder(d=3,h=20);
		translate([10,10.5,-14])cylinder(d=3,h=20);
		translate([0,0,-14])cylinder(d=3,h=116);
		translate([10,10.5,-12])cylinder(d=3,h=20);
		translate([0,20,-4.5])rotate([90,0,-10])cylinder(d=3,h=30);
	}
}

palm(digits=[true,true,true,true,true],$fn=20);
//color("red")translate([0, 0, 0])rotate([0, 0, 0])translate([-0.0, -0.0, 0]) import("R palm.stl");

