organization_employees = [
    {
        "name": "Frank",
        "lastName": "Lu",
        "role": "VP of Sales",
        "userId": 1,
        "managerId": 7,
        "salary": 100000
    },
    {
        "name": "Holly",
        "lastName": "Wilson",
        "role": "Head of HR",
        "userId": 2,
        "managerId": 7,
        "salary": 60000
    },
    {
        "name": "Jack",
        "lastName": "Ryan",
        "role": "Receptionist",
        "userId": 3,
        "managerId": 2,
        "salary": 40000
    },
    {
        "name": "Mike",
        "lastName": "Rochester",
        "role": "Account Executive",
        "userId": 4,
        "managerId": 1,
        "salary": 70000
    },
    {
        "name": "Priya",
        "lastName": "Sylva",
        "role": "Account Executive",
        "userId": 5,
        "managerId": 1,
        "salary": 68000
    },
    {
        "name": "Randy",
        "lastName": "Shaw",
        "role": "Account Executive",
        "userId": 6,
        "managerId": 1,
        "salary": 65000
    },
    {
        "name": "Alice",
        "lastName": "Olson",
        "role": "CEO",
        "userId": 7,
        "managerId": nil,
        "salary": 200000
    }
]


# An organization list of employees and their relationship is stored in a JSON object with the following format with no particular order.
# The above is just an example, the list can be much larger.

# userId is a numeric value showing a unique identified for the employee. ManagerId is the user ID of the person that an employee reports to. For instance, Priya Sylva reports to  Frank Lu because her managerId is 1 and Frank’s userId is 1.
# managerId of null signifies that the person reports to nobody.

# 1) Write a function called printTopPaid that gets the organization JSON object (array of objects) and a role as the input and
# prints out the 2 top paid people’s first and last name. For instance, if we ran the function like the following with organizationEmployees being the example JSON above:

# printTopPaid(organizationEmployees, “Account Executive“)

# the output of the function should be

# Mike Rochester
# Priya Sylva

def print_top_paid(employees, role)

  first = {salary: 0}
  second = {salary: 0}
  employees.each do |employee|
    next if employee[:role] != role

    if(employee[:salary] > first[:salary])
      second = first.dup
      first[:salary] = employee[:salary]
      first[:name] = employee[:name] + " " + employee[:lastName]
    elsif employee[:salary] > second[:salary] && employee[:salary] < first[:salary]
       second[:salary] = employee[:salary]
       second[:name] = employee[:name]
    end

  end

   puts first[:name]
   puts second[:name]

end


# print_top_paid(organization_employees, "Account Executive")



# 2) Write a function called printRoleSalarySum that gets the organization JSON (array of objects) as the input
#  and prints out the roles ordered by the sum of salary paid. For the above example object the results would be:


# Account Executive - 203000
# CEO - 200000
# VP of Sales - 100000
# Head of HR - 60000
# Receptionist - 40000

def print_role_salary_sum(employees)
  output = Hash.new(0)
  employees.each do |employee|
    role = employee[:role]
    output[role] += employee[:salary]
  end

   output.sort_by{|key, value|  value}.reverse.each{|ar| puts "#{ar[0]} - #{ar[1]}" }

end

print_role_salary_sum(organization_employees)



3) Write a function called printOrg that gets the organization JSON (array of objects) as input and outputs
the organizational chart in a textual format respecting hierarchy. For the example above the org chart would
look like this.


Alice Olson - CEO
Frank Lu - VP of Sales
Holly Wilson - Head of HR
Mike Rochester - Account Executive
Priya Sylva - Account Executive
Randy Shaw - Account Executive
Jack Ryan - Receptionist
