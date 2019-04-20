Image {
	property int alpha;
	property int gamma;
	property int beta;
	height: 250;
	fillMode: Image.PreserveAspectFit;
	anchors.horizontalCenter: parent.horizontalCenter;
	source: "res/phone.png";
	transform.rotateY: -gamma;
	transform.rotateX: -beta;
}
