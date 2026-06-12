file = open("SO2GameSvrD", "rb")
data = file.read()
file.close()

data = data.replace("eth1", "e1\0\0")
file = open('SO2GameSvrD1', "wb")
file.write(data)
file.close() 
