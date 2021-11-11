lever_id = 10;
global.leverTriggered[lever_id] = pulled;
msgShown = true;

if (oBean.x < 1900 && oBean.x > 1620 && oBean.y > 600) {
	pulled = true;
}
