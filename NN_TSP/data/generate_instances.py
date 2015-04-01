import networkx as nx
import sys
sys.path.reverse()
import numpy as np
import pylab
import matplotlib.pyplot as plt
import random as rnd
import math
import scipy.sparse
import scipy.sparse.linalg
import scipy.cluster
import itertools
from copy import deepcopy


"""
" dist is the matrix of distances 
" (i.e: dist[a][b] = dist[b][a] = distance between point a and point b)
" nb_nodes is the number of nodes in the input
"""
def Held_Karp_algo(dist, nb_nodes):
    from itertools import combinations
    C = {}
    for k in xrange(1,nb_nodes):
         C[((0, k), k)] = dist[0][k]
    a = [i for i in xrange(nb_nodes)]
    for size in xrange(3,nb_nodes+1):
        subsets_size_s = list(itertools.combinations(a, size))
        for s in subsets_size_s:
            if 0 not in s:
                continue
            for k in s:
                if k == 0:
                    continue
                # print "treating ",k, "with ", s
                for m in s:
                    if m == 0 or m == k:
                        continue
                    l =  list(s)
                    l.remove(k)
                    l.sort()
                    s2 = tuple(l)
                    # print s, k, s2
                    if not (s, k) in C:
                        C[(s, k)] = C[(s2, m)] + dist[m][k]
                    C[(s, k)] = min(C[(s, k)], C[(s2, m)] + dist[m][k])
    opt = -1
    all_sets = tuple(i for i in xrange(nb_nodes))
    perm = {}
    for k in xrange(1,nb_nodes):
        if opt == -1 or opt > C[(all_sets, k)] + dist[0][k]:
            opt = C[(all_sets, k)] + dist[0][k]
            perm = k
    return opt, k


def check_all(dist, nb_nodes):
    val_opt = -1
    perm_opt = {}
    for perm in itertools.permutations(xrange(nb_nodes)):
        val_perm = 0
        for i in xrange(nb_nodes):
            val_perm += dist[perm[i]][perm[(i+1)%nb_nodes]]
        if val_opt == -1 or val_opt > val_perm:
            val_opt = val_perm
            perm_opt = perm
    return val_opt, perm_opt

"""    
" This takes the number of nodes and return the the position of the nodes
" and the matrix of the distances between the nodes
"""    
def make_instance(nb_nodes):
    pos = []
    # Todo : Set probabilities
    pos_x = np.random.poisson(nb_nodes,nb_nodes)
    pos_y = np.random.poisson(nb_nodes,nb_nodes)
    pos = zip(pos_x,pos_y)
    # example: 
    # pos = [(i,i) for i in xrange(nb_nodes)]
    
    dist = []
    for i in xrange(nb_nodes):
        dist.append([])
        for j in xrange(nb_nodes):
            dist_ij = math.sqrt((pos[i][0] - pos[j][0])**2
                                + (pos[i][1] - pos[j][1])**2)
            dist[i].append(dist_ij)
    return (pos,dist)


        # x = np.random.binomial(nOfEach[0] - 1, probs[0][0])
        # y = np.random.binomial(nOfEach[0] - 1, probs[0][0])
        # neighbs1 = rnd.sample(xrange(0, nOfEach[0] - 1), deg1)

nb_nodes = 10
pos,dist = make_instance(nb_nodes)

print Held_Karp_algo(dist, nb_nodes)
print check_all(dist, nb_nodes)
pos,dist = make_instance(nb_nodes)

print Held_Karp_algo(dist, nb_nodes)
print check_all(dist, nb_nodes)

