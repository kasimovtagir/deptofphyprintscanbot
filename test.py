import datetime
from datetime import datetime

def return_time():
    dt = datetime.now()
    dt_string = dt.strftime("%d.%m %H:%M")
    return dt_string



dt = datetime.now()
dt_string = dt.strftime("%H:%M")
# timex = return_time()

print (dt_string)
if dt_string=="02:32":
    print("sad")