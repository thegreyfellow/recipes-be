# README

A simple straight forward recipe search using the `recipe.json`
file in the repository.

### Setup:

* Ruby version:
	*  2.7.x
- Rails version:
	-  6.1.x
- System dependencies:
	- Postgres v11 or more
-  Configuration:
	- Add postgres url in `.env` variable `DATABASE_URL` 
- Database creation and initialization:
	- run the current commands:
	```bash
	git clone git@github.com:thegreyfellow/recipes-be.git
	bundle exec rails db:create
	bundle exec rails db:migrate
	bundle exec rails db:seed:recipes_and_ingredients
	```

### Ideas to be implemented:
- [ ]  the data in `recipes.json` could be treated in a way
	that makes the SQL query more precise. one way to do this
	is to extract the ingredients as words and place them in 
	a field in `Ingredient` table, and query them instead.
	
- [ ] Also stemming the ingredients so that adding an `s` at the
end would still give correct results.

- [ ] Another way would be through datamining, by training a model on the ingredients, we could detect single word ingredients `pomme` and multiple word ingredients `pomme de terre` and be able to differientiate between them to get accurate results.
