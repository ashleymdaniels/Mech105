# LU Factorization - Square matrix manipulation
This code is intended to take a square matrix and use partial reduse it to row-echelon form. There is one input, matrix [A] that will be divided into
four other matrices.

        -[U]  -   is the matrix that is in reduced row echelon form
        -[L]  -   is the multiplying factors that reduced [A] into [U]
        -[A]  -   the origonal unchanged [A] matrix
        -[P]  -   the idenity matrix that corresponds to pivoting that took place during the reduction
        
**NOTE: the relationship between the four matrices is [P][A] = [L][U]**
