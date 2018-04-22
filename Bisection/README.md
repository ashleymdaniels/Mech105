# Bisection
This code is a closed method for finding the roots of a funtions. The closed methods are often computationally slow, 
however also accurate. 

* The inputs include:

          1. func - the input function: note that syms x needs to be put in before the function
          2. xl - the lower guess for the root
          3. xu - the upper guess for the root
          4. es - the maximum amount of error allowed (if not input the defalt is .0001%)
          5. maxit - the maximum amount of iterations allowed the defalt is 50)
          
* The outputs include:

          1. root - the estimated root value calculated
          2. fx - the value at that root (which should be close to zero)
          3. ea - the aproximate relative error
          4. iter - how many iterations that where ran
