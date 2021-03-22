import sys
import ipaddr, ipaddress
import requests
import datetime
import time
import mysql.connector

def bl_spamhaus(url):
	r = requests.get(url)
	d = r.text
	a = 0
	u = "false"
	spamhaus_ips = []
	for i, l in enumerate(d.split('\n')):
		if (i < 3):
			continue
		elif (i == 3):
			print(bls_URL)
			lm = l.split('s:')[1]
			lm = lm.split(', ')[1]
			edt = datetime.datetime.strptime(lm.split(' G')[0], '%d %b %Y %H:%M:%S')
			if (edt == get_sql_exp(url)):
				print("They are equal.  No action is required")
				return
			else:
				print("They are not equal")
				update_bls_exp(edt)
				u = "true"
		elif(i >= 4 and u == "true"):
			ipa = l.split(' ; ')[0]
			if (ipa != ""):
				spamhaus_ips.append(ipa)
				a=a+1
				print(ipa)

def bl_type01(url):
	r = requests.get(url)
	d = r.text
	a = 0
	u = "false"
	spamhaus_ips = []
	for i, l in enumerate(d.split('\n')):
		if (i < 3):
			continue
		elif (i == 3):
			print(bls_URL)
			lm = l.split('s:')[1]
			lm = lm.split(', ')[1]
			edt = datetime.datetime.strptime(lm.split(' G')[0], '%d %b %Y %H:%M:%S')
			if (edt == get_sql_exp(url)):
				print("They are equal.  No action is required")
				return
			else:
				print("They are not equal")
				update_bls_exp(edt, bls_url)
				u = "true"
		elif(i >= 4 and u == "true"):
			ipa = l.split(' ; ')[0]
			if (ipa != ""):
				spamhaus_ips.append(ipa)
				a=a+1
				print(ipa)

def call_al_filter(al_filter):
	Print("FUNCTION: call_al_filter")
	
# Update the field bl_
def update_bls_exp(dt, url):
	sql = """ UPDATE bl_Sources SET bl_Source_Expires = %s WHERE bl_Source_URL = %s """
	data =  (dt, url)
	bls_cursor.execute(sql, data)
	bls_conn.commit()
	print(bls_cursor.rowcount, "record(s) effected")

def get_sql_exp (url):
	sql = """ SELECT CAST(bl_Source_Expires AS CHAR)FROM bl_Sources WHERE bl_Source_Active = true AND bl_Source_URL = %s """
	data = (url,)
	bls_cursor.execute(sql, data)
	obj_result = bls_cursor.fetchall()
	dt1 = obj_result[0]
	dt2 = datetime.datetime.strptime(str(dt1[0]), '%Y-%m-%d %H:%M:%S')
	return dt2

def update_sql_ips(al_name, ip_address, exp_dt):
	sql = "SELECT bl_Import_Source,"

def add_sql_ips(al_ip_address, al_source_name, al_source_date, al_destination , al_expires, al_ipaddress_notation):
	sql = """INSERT INTO ip_blacklist (bl_ipaddress, bl_ipaddress_import_Source, bl_ipaddress_import_date, bl_ipaddress_destination, bl_ipaddress_expires, bl_ipaddress_notation_type) VALUES (%s, %s, %s, %s, %s, %s)"""
	now = datetime.now()
	data = (al_ip_address, al_source_name, now, al_destination, al_expires, al_ipaddress_notation )
	bls_cursor.execute(sql, data)
	mydb.commit()

# Check to see if an IP address with a give Source Name Exist in the SQL database table bl_ipaddress
def chk_sql_ips(al_name, ip_address):
	sql = """SELECT bl_ipaddress_import_Source, bl_ipaddress FROM ip_blacklist WHERE bl_ipaddress_import_Source = %s AND bl_ipaddress = %s """
	data = (al_name,ip_address)
	try:
		bls_cursor.execute(sql,data)
		r = bls_cursor.fetchall()
		if (len(r) == 0):
			print("false")
			return "false"
		else:
			print("true")
			print(len(records))
			return "true"
	except:
		print("No Data Returned")

# check to see if a specifice address list source name exisit in the ip_blacklist table
def chk_sql_aln(al_name):
	sql = """SELECT * FROM ip_blacklist WHERE bl_ipaddress_import_Source = %s """
	data = (al_name,)
	try:
		bls_cursor.execute(sql, data)
		r = bls_cursor.fetchall()
		if (len(r) == 0):
			return "false"
		else:
			return "true"
	except:
		return "unknown"


# Retreive all SQL records with a specifice address list source name
def get_all_slq_source_name(al_name):
	r = chk_sql_aln(al_name)
	if (r == "false"):
		print("No Records Found")
	elif(r == "true"):
		sql_ips = []
		print("Records Found")
		sql = """SELECT * FROM ip_blacklist WHERE bl_ipaddress_import_Source = %s """
		data = (al_name,)
		bls_cursor.execute(sql, data)
		blips = bls_cursor.fetchall()
		
		for blip in blips:
			print(blip[0])
			sql_ips.append(blip[0])
			print(sql_ips)
	else:
		print("Unknown Error")


# Main Coding Section

bls_conn = mysql.connector.connect(host="localhost", user="mk", password ="4GGIuse0nly.", database="Blacklist")

bls_cursor = bls_conn.cursor(buffered=True)

bls_cursor.execute("SELECT * FROM bl_sources WHERE bl_source_active = 1")

bls_records = bls_cursor.fetchall()

for x in bls_records:
	bls_Name = (x[0])                         # Address List Source Name and/or Classifier
	bls_Descripton = (x[1])                   # Address list Descripton
	bls_WS = (x[2])                           # Address List source website
	bls_url = (x[3])                          # Address List URL
	bls_OF = (x[4])                           # Address List Output File Name
	bls_IPT = (x[5])                          # Internet Address Type (IPV4 or IPV6)
	bls_IPN = (x[6])                          # Internet Address Notation Type (IP or CIDR)
	bls_ALN = (x[7])                          # Address List Name (MIKROTIK address-list-name)
	bls_UI = (x[8])                           # Blacklist Source's Update Interval
	bls_A = (x[9])                            # Blacklist Source's is active
	bls_exp = (x[10])                         # Blacklist Source's Expiration Date and Time
	bls_sf = (x[11])                          # Blacklist Source filter (used to determine how the web page is to be scraped
	#print(bls_Name)
	#get_exp(bls_URL)
	#bl_type01(bls_URL)
	#chk_sql_ips("local", "127.0.0.0/8")
	# Check to see if this is a new source
	get_all_slq_source_name(bls_Name)
