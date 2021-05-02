
#--------------# Time in R
### Sleep
# Recall in python, we use time.sleep(n) to sleep for n seconds. In R,
# we use Sys.sleep(n)

for (i in 1:10) {
		print(i)
		Sys.sleep(0.1)
}





### time.time() in r
# Recall, we use time.time() to get current time in python. Then we can 
# subtrack two time captures to measure how long does the program run.
# In R, we use Sys.time() to get current time.

Sys.time()
# [1] "2021-05-02 14:22:01 EDT"


st = Sys.time()
for (i in 1:3){
		print(i)
		Sys.sleep(0.1)
}
et = Sys.time()
est_time = et - st
print(est_time)
# Time difference of 0.304719 secs






















