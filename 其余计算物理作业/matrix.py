"""
    matrixmul.py
    
    4000*4000 双精度矩阵Intel Iris Plus 650 GPU计算程序
    
    Created by 李彦星 on 2018/4/25.
    Copyright © 2018年 WATT LEE. All rights reserved.
"""

#导入Opencl库
import pyopencl as cl
import numpy as np
import numpy.linalg as la
import time

"""
    @func: 计算矩阵乘法的函数
    @param:  matrix1      乘法矩阵A
    @param:  matrix2      乘法矩阵B
    @param:  res          结果矩阵C初始值
    @return: final_matirx 结果矩阵C最终值
"""

def openCL_multiplication(matrix1, matrix2, res):
    #初始化核心和序列
    ctx = cl.create_some_context()
    queue = cl.CommandQueue(ctx)

    # 配置核心运算变量
    mf = cl.mem_flags
    a_buf = cl.Buffer(ctx, mf.READ_ONLY | mf.COPY_HOST_PTR, hostbuf=matrix1)
    b_buf = cl.Buffer(ctx, mf.READ_ONLY | mf.COPY_HOST_PTR, hostbuf=matrix2)
    dest_buf = cl.Buffer(ctx, mf.WRITE_ONLY, matrix1.nbytes )

    # OpenCl 矩阵计算核心算法
    prg = cl.Program(ctx, """
        __kernel void multiplymatrices(const unsigned int size, __global float * matrix1, __global float * matrix2, __global float * res) {
    
        int i = get_global_id(1);
        int j = get_global_id(0);
    
        res[i + size * j] = 0;
    
        for (int k = 0; k < size; k++)
        {
        res[i + size * j] += matrix1[k + size * i] * matrix2[j + size * k];
        }
        }
        """).build()

    t0 = time.time()

    #计算矩阵乘法
    prg.multiplymatrices(queue, matrix1.shape, None,np.int32(len(matrix1)) ,a_buf, b_buf, dest_buf)

    #初始化并回调得到结果矩阵
    final_matrix = np.empty_like(matrix1)
    cl.enqueue_copy(queue, final_matrix , dest_buf)

    print ("结果矩阵：")
    print (final_matrix)

    delta_t = time.time() - t0
    print ('计算时间: ' + str(delta_t))

    return final_matrix

#生成4000*4000矩阵计算样本
a,b = np.mgrid[0:2000:0.5,0:2000:0.5]
c = np.zeros((4000*4000), dtype=np.float32)
#计算结果
openCL_multiplication(a, b, c)
