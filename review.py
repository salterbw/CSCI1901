def exe():
    execfile("review.py")

def basics():
    print "In python things are a bit different, and this is designed to help showcase some of the critical differences, and the best way to take advantage of them!"

    a = [1, 2, 3, 4, 5]
    b = [2, 4, 6, 8, 10]
    c = 3
    
    for i in range(5):
        print i
        print a[i]
        print b[i]

    if 6 > 9
        return False
    

    print "One of the critical things Python introduces is looping.  Specifically, we now know how to use for and while loops to our advantage.  For a great tutorial on these, visit www.khanacademy.com!"

    while 6 < 5:
        print "Something went wrong..."

    i = 0
    while i < 10:
        print i
        print a[i]
        print b[i]
        i += 1

    
    print "There's no difference between for loops and while loops.  That is to say, anything can be written either way!  The reason we have different loop structures is because they have varying uses.  For loops are best for when you know exactly how many times you want to iterate, or in Python they're useful for iterating through a list for some reason.  While loops are better if you're unsure exactly how many times you need to iterate through, but you know what you're end conditions will be.  It's all about knowing which tools to use!"

    print "Another thing worth mentioning is the syntax used to access a specific element in a list.  a[0] would give me the first element in the list a!  There are some pretty interesting things you can do with list slicing.  For instance, a[1:3:2] will give me the first through third, not including the third and it will only give me every other element.  lst[start value:end value:how you move through the list]."

    print "With the introduction of loops, we immediately realize that using helpers is no longer necessary, and in fact it's frowned upon in Python.  As it turns out, they don't work the same and scope starts acting strange!"
lst[0] + lst[1:]

