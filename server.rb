require 'sinatra'
require 'rack-livereload'

use Rack::LiveReload

set :static, true
set :root, File.dirname(__FILE__)
set :public, 'build'

get '/hi' do
  %q(<html>
	<head>
		<link rel="stylesheet" type="text/css" href="css/test.css">
	</head>
	<body> Test
	</body>
  </html>)
end
