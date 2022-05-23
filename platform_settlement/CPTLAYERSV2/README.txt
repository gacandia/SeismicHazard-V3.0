
Note:
    the user defined number of layers actually stands for the number of soil types

bugs fixed:
    the original Hidden Markov Random Field produces inconsistent array dimension where the increment of CPT depth is uniform.

change to the output:
    right now the code gives two csv file. One indicates the hard boundary according to the SBT types.
    The total boundary includes all potential boundaries of the soil layering.
    
    the figure esimtatedtype.png shows the inferred soil type of all boundaries, hence has more soil types than SBT types.
    The numbers are dummies ranging from 0 to no of soil types. Same numbers indicate same soil type.
