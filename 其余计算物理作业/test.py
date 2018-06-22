"""
test.py

4000*4000 双精度矩阵intelPython加速器并行计算程序

Created by 李彦星 on 2018/4/25.
Copyright © 2018年 WATT LEE. All rights reserved.
"""

import multiprocessing
import time
import numpy as np
import scipy.io as sio

#生成4000*4000的浮点类型矩阵元并进行分割
a,b = np.mgrid[0:2000:0.5,0:2000:0.5]
a1 = a[0:1000,0:4000]
a2 = a[1000:2000,0:4000]
a3 = a[2000:3000,0:4000]
a4 = a[3000:4000,0:4000]
c = []

#开启计时器
start = time.time()

#定义并行函数
def func1(a):
    d1 = np.matmul(a,b)
    return d1

def func2(a):
    d2 = np.matmul(a,b)
    return d2

def func3(a):
    d3 = np.matmul(a,b)
    return d3

def func4(a):
    d4 = np.matmul(a,b)
    return d4

#开启四核并行计算
if __name__ == "__main__":
    pool = multiprocessing.Pool(processes=4)
    
   
    c = [pool.map(func1,a1),pool.map(func2,a2),pool.map(func2,a3),pool.map(func2,a4)]


    pool.close()
    pool.join()
    
    #print(c)
    print("Sub-process(es) done.")
    elapsed = (time.time() - start)
    print("Time used:",elapsed)

