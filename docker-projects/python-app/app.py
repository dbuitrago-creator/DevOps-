from http.server import BaseHTTPRequestHandler, HTTPServer
import socket
import os


class SimpleHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/" or self.path == "/health":
            hostname = socket.gethostname()
            message = f"DevOps Lab Python App\nHost: {hostname}\nPath: {self.path}\nStatus: OK\n"
            self.send_response(200)
            self.send_header("Content-type", "text/plain")
            self.end_headers()
            self.wfile.write(message.encode())
        else:
            self.send_response(404)
            self.end_headers()
            self.wfile.write(b"Not Found\n")


def run(server_class=HTTPServer, handler_class=SimpleHandler):
    port = int(os.environ.get("APP_PORT", "8000"))
    server_address = ("0.0.0.0", port)
    httpd = server_class(server_address, handler_class)
    print(f"Serving DevOps Lab app on port {port}...")
    httpd.serve_forever()


if __name__ == "__main__":
    run()
