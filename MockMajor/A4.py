import copy


class sets:
    def __init__(self, *args):
        self.dict = {}
        for arg in args:
            self.insert(arg)

    def __repr__(self):
        return str(self.dict.keys())

    def insert(self, item):
        self.dict[item] = item

    def empty(self):
        if len(self.dict) == 0:
            return True

    @staticmethod
    def union(s1, s2):
        ans = copy.deepcopy(s1)
        for item in s2.dict:
            ans.insert(item)
        return ans

    @staticmethod
    def intersection(s1, s2):
        ans = sets()
        for item in s1.dict:
            if(item in s2.dict.keys()):
                ans.insert(item)
        return ans

    @staticmethod
    def belongs(s1, s2):
        flag = True
        for item in s1.dict:
            if item not in s2.dict.keys():
                flag = False
                break
        return flag


s1 = sets(2, 3)
s2 = sets(2, 3, 4)

print(sets.union(s1, s2))
print(sets.intersection(s1, s2))
print(sets.belongs(s1, s2))
