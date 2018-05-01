require 'csv'

csv = CSV.read('db/fixtures/area.csv')

csv.each_with_index do |ing, i|
	next if i === 0

	area_name				=	ing[0]
	area_name_eng			=	ing[1]

	Area.seed do |s|
		s.id   				=	i
		s.area_name 	=	area_name
		s.area_name_eng 	=	area_name_eng
	end
end

