from pyramid.view import view_config
from mysql import *
from poe_util import *


@view_config(route_name='home', renderer='home.mak')
def home_view(request):
    return {'project': 'POE'}

@view_config(route_name='results', renderer='results.mak')
def results_view(request):
	results = []
	sql = MySQL()
	query = request.GET.get('query')
	results = sql.get_results(query)
	if results == None: results = ['Didnt find shit.']
	return {'query' : query, 'results' : results}

