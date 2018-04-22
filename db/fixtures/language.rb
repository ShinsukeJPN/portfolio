require 'csv'

csv = CSV.read('db/fixtures/language.csv')

csv.each_with_index do |ing, i|
	next if i === 0

	language_name			=	ing[0]
	other_language			=	ing[1]

	Language.seed do |s|
		s.id   				=	i
		s.language_name 	=	language_name
		s.other_language 	=	other_language
	end
end