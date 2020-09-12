class vector(point):
    def __init__(self, x, y, z):
        self.x = x
        self.y = y
        self.z = z

    @staticmethod
    def add(v1, v2):
        return vector(v1.x+v2.x, v1.y+v2.y, v1.z+v2.z)

    def scalarMul(self, const):
        return vector(const*self.x, const*self.y, const*self.z)

    @staticmethod
    def dot(v1, v2):
        return vector(v1.x * v2.x, v1.y*v2.y, v1.z*v2.z)
