require 'sqlite3'

class Connector

	@database = SQLite3::Database.new( 'db/davescabinet.db' );

	def Connector::get_database
		@database
	end

end