# Introduction

This repository houses a paper on the Aberth-Ehrlich Method that I wrote for my Master's Capstone in 2016, as well as the MATLAB code that I wrote as part of the project. The paper is roughly 7 pages long, and features a derivation of the technique. The appendices feature 5 pages of figures, and the MATLAB code which is included in this repository.

This is presented in the hopes that it will be educational. If you would like to implement the technique, I suggest looking into the [MPSolve package](https://github.com/robol/MPSolve), which has undergone more extensive testing and optimization.

# Abstract

We explore Aberth’s iterative method for finding all zeros of polynomials with complex coefficients. Both Jacobi and Gauss-Seidel versions of the method are discussed, and the Jacobi version is derived in detail. We also carefully justify the procedure given by Aberth for selecting initial approximations. Graphs are presented in the appendices, which show the strengths of Aberth’s method, and also demonstrate an issue that occurs if the initial approximations are selected such that they are symmetric about a line which the roots also happen to be symmetric about. This is crucial when approximating roots of polynomials with real coefficients, since such polynomials will always have roots which are symmetric about the real axis. Also provided in the appendices is a MATLAB implementation of both the Jacobi and Gauss-Seidel versions of Aberth’s method, complete with selection of initial approximations.
