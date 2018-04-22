# Simpsons 1/3 Rule
This code was made to produce an aproximation of the integration of a data set. 
Note that there are stipulations:

    -The data points must be imput as vector matrises 
    (one being the imput values and the other being the corresponding output values)
    
    -The data points must be evenly spaced
    
    -NOTE: The simpsons 1/3 rule is designed for data sets with an odd number of points 
    (or an even number of intervals), in the event that there is an even number of data points imput the 
    last interval will be solved using the trapazoidal method:
              *trapazoidal method = [(f(b) + f(a))/2] mult. (b-a)
