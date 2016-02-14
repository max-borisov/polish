Record.destroy_all
Category.destroy_all

categories = [
  { title: 'Category 1'},
  { title: 'Category 2'},
  { title: 'Category 3'}
]
Category.create! categories

records = [
  { category_id: Category.first.id, pl: 'Record 1', ru: 'www' },
  { category_id: Category.first.id, pl: 'Record 2', ru: 'www' },
  { category_id: Category.last.id, pl: 'Record 3', ru: 'www' },
  { category_id: Category.last.id, pl: 'Record 4', ru: 'www' },
]
Record.create! records
