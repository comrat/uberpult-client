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
		var self = this
		socket.onopen = function() {
			log("Sonnection opened")
			self.connected = true
			self._context._processActions()
		}

		socket.onclose = function(event) {
			log('Connection was closed. Code:', event.code, 'reason:', event.reason, "wasClean:", event.wasClean)
			self.connected = false
			self._context._processActions()
		}

		socket.onerror = function(error) {
			log("Connection error:", error.message)
			self._context._processActions()
		}

		socket.onmessage = function(event) {
			self.message(JSON.parse(event.data))
			self._context._processActions()
		}
	}
}
