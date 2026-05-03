#!/usr/bin/env python3
from http.server import HTTPServer, BaseHTTPRequestHandler
import socket

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        hostname = socket.gethostname()
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(f"""
        <html>
            <body>
                <h1>Python App on Pod: {hostname}</h1>
                <p>Namespace: {self.headers.get('X-Namespace', 'unknown')}</p>
                <p>Port: 5000</p>
            </body>
        </html>
        """.encode())

if __name__ == '__main__':
    server = HTTPServer(('0.0.0.0', 5001), Handler)
    print('Starting Python HTTP server on port 5001')
    server.serve_forever()