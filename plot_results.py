
import matplotlib.pyplot as plt 
import csv


def get_values():
    block_size = []
    L1DHits = []
    L1IHits = []
    with open('results.csv') as csvfile:
        reader = csv.reader(csvfile, delimiter=';')
        for row in reader:
            try:
                block_size.append(int(row[0]))
                L1DHits.append(1-float(row[1]))
                L1IHits.append(1-float(row[2]))
            except ValueError:
                pass
                
    return block_size, L1DHits, L1IHits

block_size, L1DHits, L1IHits = get_values()
print("L1DHits")
print(L1DHits)
print("L1IHits")
print(L1IHits)

plt.plot(block_size, L1DHits, label = "L1DHits")   
plt.plot(block_size, L1IHits, label = "L1IHits") 
plt.xscale('log', basex=2)
plt.xlabel('Block Size [Bits]') 
plt.ylabel('Hit Rate [0-1]') 
plt.title('Block Size vs Hit Rates') 
plt.legend()
#plt.savefig('block_size_analyses.png')
plt.show()
