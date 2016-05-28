import BaseHTTPServer, SimpleHTTPServer
import ssl
import os
ssl_versions = {
  'ssl2': ssl.PROTOCOL_SSLv2,
  'ssl3': ssl.PROTOCOL_SSLv3,
  'ssl23': ssl.PROTOCOL_SSLv23,
  'tls1': ssl.PROTOCOL_TLSv1,
  'tls11': ssl.PROTOCOL_TLSv1_1,
  'tls12': ssl.PROTOCOL_TLSv1_2,
}
ssl_version = ssl_versions.get(os.environ['ssl'], ssl.PROTOCOL_SSLv23)

httpd = BaseHTTPServer.HTTPServer(('0.0.0.0', 443), SimpleHTTPServer.SimpleHTTPRequestHandler)
httpd.socket = ssl.wrap_socket (httpd.socket, certfile='/server.pem', server_side=True, ssl_version=ssl_version)
httpd.serve_forever()
