import re

def get_query_type(query):
	if ' ' in query:
		words = query.split(' ')
		match = re.search('\d', query)
		if match:
			return 'level-item'
		else:
			return 'multi-word'
	else:
		return 'one-word'