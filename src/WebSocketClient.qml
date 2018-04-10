Object {
	signal error;
	signal closed;
	signal message;
	property bool connected;
	property string ip;
	property string port;
	property string host: "ws://" + ip + ":" + port;

	connect: {
		if (!this.ip || !this.port) {
			log("Failed to connect port:", this.port, "ip:", this.ip)
			return
		}

		log("Create socket for host:", this.host)
		var socket = new WebSocket(this.host)
		var context = this._context
		var self = this

		socket.onopen = context.wrapNativeCallback(function() {
			log("Sonnection opened")
			self.connected = true
		})

		socket.onclose = context.wrapNativeCallback(function(event) {
			log('Connection was closed. Code:', event.code, 'reason:', event.reason, "wasClean:", event.wasClean)
			self.connected = false
		})

		socket.onerror = context.wrapNativeCallback(function(error) {
			log("Connection error:", error.message)
		})

		socket.onmessage = context.wrapNativeCallback(function(event) {
			self.message(JSON.parse(event.data))
		})
	}
}
