import MySQLdb
from poe_util import *
class MySQL:
  conn = MySQLdb.connect(host = "127.0.0.1",
                         user = "chode",
                         passwd = "j90;stb",
                         db="chode_poe")

  cursor = conn.cursor()

  def get_level_items(self, query):
    query_parts = query.split(' ', 1)
    level = query_parts[0]
    item = query_parts[1]
    item_query_type = self.get_item_query_type(item)
    sql = "SELECT * FROM base_items WHERE " + item_query_type + " = '" + item + "'"
    self.cursor.execute(sql)
    row = self.cursor.fetchone()
    return row



  #Determine whether the query is for an item name or an item type.
  def get_item_query_type(self, query):
    self.cursor.execute("SELECT * FROM base_items WHERE item_name = %s", str(query))
    row = self.cursor.fetchone()
    if row: return 'item_name'
    else: return 'item_type'

  def get_mods_for_item_type(self, item_type):
    self.cursor.execute("SELECT description, value, name, level, mod_type FROM mods WHERE " + item_type + " = 'Yes'")
    results = self.cursor.fetchall()
    return results

  def get_mods_for_item_type_by_level(self, item_type, level):
    self.cursor.execute("SELECT description, value, name, level, mod_type FROM mods WHERE " + item_type + " = 'Yes' AND (level >= " + level + " OR mod_type = 'Implicit') ORDER BY level DESC")
    results = self.cursor.fetchall()
    return results

  def get_results(self, query):
    query_type = get_query_type(query)
    if query_type == 'level-item':
      query_parts = query.split(' ', 1)
      results = self.get_mods_for_item_type_by_level(query_parts[1], query_parts[0])
    elif query_type == 'one-word':
      results = self.get_mods_for_item_type(query)
    return results


#sql = MySQL()
#results = sql.get_level_items('66 prismatic ring')
#print results
