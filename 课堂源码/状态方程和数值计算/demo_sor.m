% demo_sor.m ���ɳڵ�����
clear; clc;
A=[1 1 0 0 0;1 2 1 0 0;0 1 3 1 0;0 0 1 4 1;0 0 0 1 5]
b=[2 4 5 6 6]',w=1.46;
% A = [10 -2 -2; -2 10 -1; -1 -2 3], b=[1 0.5 1]'
 [x,k,flag]=sor(A,b,w)
% [x,k,flag]=gseid(A,b)
