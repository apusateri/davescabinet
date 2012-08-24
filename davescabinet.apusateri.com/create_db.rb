require 'sqlite3'

quotes = [
	"If I could rub his head and he would crap out gift cards...",
	"I know what you did",
	"I can''t do that it would be like cutting off my own smile",
	"I saw a guy eat a cucumber once",
	"This font has bad kearning",
	"!working",
	"The beard will get Choovy",
	"I like tape",
	"You have the gall to question how I carrige return my lines\nYou have the gall to spell carriage wrong\nYou have the gauls to attack the saxons",
	"The keyboard bandit is stupid\nYour face is stupid",
	"Too busy being awesome!",
	"I''m barely wearing pants right now",
	"I was putting water in my hair and bugs fell out",
	"I was watching SyFy and it was about werewolves and the army...",
	"It''s like opening a can of worms\nand finding many smaller cans\nof worms inside",
	"Daves desk is here.  Daves desk has always been here",
	"Nuh-uh!!",
	"I wish you would stop playing cat -N- mouse games with my thirst",
	"Store R.I.P.",
	"Bye dave I miss u already",
	"When zombies attack I''m using this door as a weapon",
	"Nothing is broken\nIt''s just not all fixed right now",
	"Every time I think of you it brings a tear to my eye",
	"Bird-tation",
	"If someone owns a piece of land do they own it all the way to\nthe center of the earth?",
	"I can''t walk away...\nSo I''m burnind down the house.\n - Anthony",
	"You can''t just walk around wielding doors and apologies",
	"By the power of lies",
	"Sigh",
	"(1)",
	"(2)",
	"Shut uppa your face",
	"You''re dulling my shine",
	"winthebattle",
	"sleep",
	"There is no sign... of the chicken!",
	"Do you have a putter with an eraser on it?",
	"GetCredentials",
	"For shizzle",
	"Is there other food inside this food?",
	"Oh noes",
	"High fives all around",
	"Nothing bad happens at the fair",
	"Stupid (Fill in the blank) not checking stuff in",
	"Web 1, Me Nothing",
	"Hatehatehatehatehate",
	"Food fail",
	"We so excited",
	"Why does SQL timeout take so long",
	"MacBooks are stupid",
	"Hi",
	"I like pie",
	"F&#*@!\n^ Fampersand",
	"I would give you half my heat if I could",
	"Chinese hackers suck\nQuit whining and protect yourself",
	"I''d rather be bowling",
	"Camping:\n1. Climb a Tree\n2. Hide in a bush\n3. Shoot a deer",
	"Hale to the king baby",
	"I drink your milkshake",
	"Beware of the gargantu-ass",
	"Bori will live on in your heart\nWhat is a Bori? I don''t know that guy\nWhy teh h8?",
	"In soviet Russia, milkshake drinks you!",
]

db = SQLite3::Database.new( 'db/davescabinet.db');

# drop the table if it already exists

db.execute "DROP TABLE IF EXISTS QUOTES;";

# create the quotes table

db.execute <<SQL
	CREATE TABLE QUOTES (
		QuoteID INTEGER PRIMARY KEY,
		Text TEXT,
		Author TEXT,
		DateAdded TEXT,
		AddedBy TEXT
	);
SQL

# populate the quotes table

quotes.each do |q|
	print "Creating quote #{q}\n";
	db.execute "INSERT INTO QUOTES (Text, Author, DateAdded, AddedBy) VALUES ('#{q}', 'apusateri', DATETIME('now'), 'apusateri');"
end

#(1..40).each do |i|
#	print "Creating quote #{i}\n";
#	db.execute "INSERT INTO QUOTES (Text, Author, DateAdded, AddedBy) VALUES ('Test Quote #{i}', 'apusateri', DATETIME('now'), 'apusateri');";
#end