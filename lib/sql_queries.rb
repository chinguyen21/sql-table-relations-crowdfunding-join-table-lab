# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_title
  "SELECT projects.title, SUM(pledges.amount)
    FROM projects JOIN pledges ON projects.id = pledges.project_id
    GROUP BY title ORDER BY title;"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  "SELECT users.name, age, TOTAL(pledges.amount)
    FROM users JOIN pledges ON users.id = pledges.user_id
    GROUP BY name ORDER by name;"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  "SELECT projects.title, pledges_1.total_fund - funding_goal FROM projects JOIN
  (SELECT project_id, TOTAL(amount) as total_fund FROM pledges GROUP BY project_id) as pledges_1
  ON projects.id = pledges_1.project_id
  WHERE pledges_1.total_fund >= funding_goal;"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_summed_amount
  "SELECT name, SUM(amount) FROM users JOIN pledges ON users.id = pledges.user_id
  GROUP BY name ORDER BY SUM(amount);"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "SELECT projects.category, pledges.amount 
  FROM projects JOIN pledges ON projects.id = pledges.project_id
  WHERE category = 'music';"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  "SELECT projects.category, TOTAL(pledges.amount) 
  FROM projects JOIN pledges ON projects.id = pledges.project_id
  WHERE category = 'books';"
end
