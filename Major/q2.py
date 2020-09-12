# Honor Code

# I hereby confirm that I am the sole author of the work and that I've written all the solutions entirely on my own.
# I have not taken any help from online source nor have I discussed these solutions with anyone.

# Kshitij Alwadhi
# 2019EE30577
# Group 30


import math


class Point():
    def __init__(self, x, y):
        self.x = x
        self.y = y

    @staticmethod
    def getLengthWithCompass(a, b):
        # assert: a and b are two objects of the class Point
        length = 0
        # code for calculating length here

        # assert: length is of the type float, it is the distance between the 2 points given as arguements
        return length


class Line(Point):
    def _init_(self, x=0, y=0, slope=0):
        Point._init_(self, x, y)
        self.slope = slope

    @staticmethod
    def intersectTwoLines(line1, line2):
        exception = False
        # code for solving intersection
        if(exception):
            return "exception"
        else:
            # assert: p is the point of intersection of the two lines
            # p is object of class Point
            return (p)


class Circle(point):
    def __init__(self, x, y, r):
        Point.__init__(self, x, y)
        self.r = r

    @staticmethod
    def intersectTwoCircles(circle1, circle2):

        # code for calculating (x,y)

        exception = False
        # code here for solving
        if(exception):
            return "exception"
        else:
            # assert: p1 and p2 are two points(objects of Point class) of intersection of two circles (if no exception raised)
            return (p1, p2)

    @staticmethod
    def intersectLineCircle(line, circle):

        exception = False
        # code here for solving
        if(exception):
            return "exception"
        else:
            # here p1,p2 are two points(objects of point class)
            return (p1, p2)


def drawPerpendicular(point, line):
    # take a point on the line
    P1 = line.P1
    rad = point.getLengthWithCompass(P1)
    C = Circle(point, rad)
    (Pi1, Pi2) = line.intersectLineCircle(C)
    # we have 2 points on the line equidistant from point
    C1 = Circle(Pi1, rad)
    C2 = Circle(Pi2, rad)

    # intersection of the 2 circles will give us the perpendicular
    return C1.intersectTwoCircles(C2)


def SquareRoot(n):
    # using the method taught to us in the first class of COL100
    Origin = Point(0, 0)
    B = Point(n, 0)
    radius = (n+1)/2
    centre = Point((n+1)/2, 0)
    C = Circle(centre, radius)
    L = Line(Origin, B)
    L_p = drawPerpendicular(B, L)
    (x, y) = C.intersectLineCircle(L_p)

    # length between any of the two intersection points with circle will be the answer
    return B.getLengthWithCompass(x)
