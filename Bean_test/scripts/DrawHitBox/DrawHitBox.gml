
function DrawHitBox(){
	
	draw_set_color(c_red);
	draw_set_alpha(0.3);
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,0);
	draw_set_alpha(1);
	draw_set_color(c_yellow);
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);
	
}