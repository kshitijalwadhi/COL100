def shift(src_rod, dest_rod):
    print("Move the top disk from ", src_rod, " to ", dest_rod)

# IH : TowerOfHanoi(src_rod, dest_rod, aux_rod, n) moves n disks from src_rod to dest_rod using aux_rod as placeholder


def TowerOfHanoi(src_rod, dest_rod, aux_rod, n):
    if n == 1:
        shift(src_rod, dest_rod)
    else:
        TowerOfHanoi(src_rod, aux_rod, dest_rod, n-1)
        shift(src_rod, dest_rod)
        TowerOfHanoi(aux_rod, dest_rod, src_rod, n-1)


TowerOfHanoi('A', 'C', 'B', 4)


# Time complexity analysis:
# The recurrence relation follows:
# T(N) = 2 * T(N/2) +1
# T(1) = 1
# T(N) = 2^N - 1
# Therefore the algorithm grows exponentially with N
