import sys
from CPTcliu import Complayer

filepath = sys.argv[1]
print(sys.argv[2])
no_layers = int(sys.argv[2])

mydata = Complayer(filepath, no_layers)
mydata.plot_layers()
mydata.plot_cpt()
