Row {
	property string value: first.value + "." + second.value + "." + third.value + "." + forth.value;
	spacing: 5;

	IpField { id: first; }

	Text { text: "."; }

	IpField { id: second; }

	Text { text: "."; }

	IpField { id: third; }

	Text { text: "."; }

	IpField { id: forth; }
}
