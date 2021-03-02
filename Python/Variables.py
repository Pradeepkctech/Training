a=10
b="Pradeep"
c='Trainee'

print(a)
print(b)
print(c)

a,b,c,d=10,"pradeep",'trainee',True     #Assiging values for different variable with different data type in a single line

print(a,b,c,d)

a=b=c=10 #assigning same values for multiple variable
print(b)


x,y=10,20  

print('before interchange x,y:',x,y)

x,y=y,x #to interchange values of variables

print("after interchange x,y:",x,y)
#To find Datta type of a variables type() is used


print('the data type of variable d is:',type(d))
del x #this will delete the value of x

x=30
print(x+y)