

#If


name=input("Enter the name")
if name=="Pradeep":
 print("Welcome Pradeep:)")

#If else

a=input("Enter the number")

if int(a)%2==0:
  print("the entered number is even")
else :
  print("The entered number is Odd")


print("default print")

#multiple statements

b=input("enter the value for another number")
if int(b)<20:
 print("if statement")
 print(int(a)+2)
 print(a%2)
else:
 print("Else statement")
 print(b)

#Statement in a single Line

c=input("enter the number")
print("even")if int(a)%2==0 else print("odd")

#multiple Statements in a single Line 

d=input("enter the value for d")
{print("d is even"),print(d) }if int(d)%2==0 else {print("d is odd"),print('else',d)}

#ElIf

age=int(input("Enter Your age"))
if age>=50 :
 print("Senior Citizen , eligible to Vote")
elif age>=18 :
 print("eligible to vote")
elif age<18 :
 print("Not eligible to vote")

else #is optional
 print("sorry result not found")


