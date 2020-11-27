sig Grade { value: one Int }
sig Credit { value: one Int }

sig Course
{
	preReqs: set Course,
	credit: one Credit
}

sig Degree
{
	madeUpOf: set Course,
}

sig Professor { name: String }
sig Student 
{
	pursues: one Degree,
	isTaking: set Course,
	averaged: one Grade
}

sig Department
{
	madeUpOf: set Degree,
	thatHave: set Course,
	givenBy: set Professor,
	contains: set Student
}

sig University 
{
	madeUpOf: set Department,
	contains: set Student,
}

fact "grades and credits"
{
	all c: Credit |
		lte [c.value, 6] and gte [c.value, 1]
	all g: Grade |
		lte [g.value, 4] and gte [g.value, 0]
}
run {}
