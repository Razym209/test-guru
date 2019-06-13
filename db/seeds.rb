# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Вопросы для "Основы CSS"

def data_was_created(model)
  puts "Данные созданы: #{model} (#{model.count})"
end

def data_was_clear(model)
  puts "Данные очищены: #{model} (#{model.count})"
end

def id(model, params)
  model.where(params).pluck(:id).first
end

models = [User, Category, Test, TestUser, Question, Answer]
models.each { |model| data_was_clear(model) if model.destroy_all }

User.create!([
{
  first_name: 'Сергей',
  last_name:  'Луков',
},
{
  first_name: 'Мира',
  last_name:  'Елкова',
}
]);
data_was_created(User)

Category.create!([
  { title: 'PHP' },
  { title: 'HTML' },
  { title: 'Ruby' }
]);
data_was_created(Category)

Test.create!([
  {
    #id: 1
    title: 'Основы PHP',
    level: 0,
    category_id: id(Category, { title: 'PHP' })
  },
  {
    #id: 2
    title: 'история PHP',
    level: 0,
    category_id: id(Category, { title: 'PHP' })
  },
  {
    #id: 3
    title: 'Основы HTML',
    level: 0,
    category_id: id(Category, { title: 'HTML' })
  },
  {
    #id: 4
    title: 'история HTML',
    level: 0,
    category_id: id(Category, { title: 'HTML' })
  },
  {
    #id: 5
    title: 'погружение в HTML',
    level: 3,
    category_id: id(Category, { title: 'HTML' })
  },
  {
    #id: 6
    title: 'Модели в Ruby on Rails',
    level: 2,
    category_id: id(Category, { title: 'Ruby' })
  },
  {
    #id: 7
    title: 'Контроллеры в Ruby on Rails',
    level: 1,
    category_id: id(Category, { title: 'Ruby' })
  },
]);
data_was_created(Test)

TestUser.create!([
  {
    user_id: id(User, { last_name: 'Луков' }),
    test_id: id(Test, { title: 'Модели Ruby on Rails' })
  },
  {
    user_id: id(User, { last_name: 'Луков' }),
    test_id: id(Test, { title: 'Контроллеры в Ruby on Rails' })
  },
  {
    user_id: id(User, { last_name: 'Елкова' }),
    test_id: id(Test, { title: 'Основы PHP' })
  },
  {
    user_id: id(User, { last_name: 'Елкова' }),
    test_id: id(Test, { title: 'Основы HTML' })
  },
])
data_was_created(TestUser)

Question.create!([
  # Вопросы для "Основы PHP"
  {
    #id: 1
    body: 'текст',
    level: 1,
    test_id: id(Test, { title: 'Основы PHP' })
  },
  {
    #id: 2
    body: 'текст',
    level: 2,
    test_id: id(Test, { title: 'Основы PHP' })
  },
  {
    #id: 3
    body: 'текст',
    level: 1,
    test_id: id(Test, { title: 'Основы PHP' })
  },
  # Вопросы для "Основы HTML"
  {
    #id: 4
    body: 'текст',
    level: 2,
    test_id: id(Test, { title: 'Основы HTML' })
  },
  {
    #id: 5
    body: 'текст',
    level: 1,
    test_id: id(Test, { title: 'Основы HTML' })
  },
  {
    #id: 6
    body: 'текст',
    level: 1,
    test_id: id(Test, { title: 'Основы HTML' })
  },
  # Вопросы для ""
  {
    #id: 7
    body: 'текст',
    level: 1,
    test_id: id(Test, { title: 'Ruby' })
  },
  # Вопросы для "Фауна для самых маленьких"
  {
    #id: 8
    body: 'текст',
    level: 1,
    test_id: id(Test, { title: 'Ruby' })
  },
  # Вопросы для "Фауна Байкала"
  {
    #id: 9
    body: 'текст',
    level: 1,
    test_id: id(Test, { title: 'Ruby' })
  },
  {
    #id: 10
    body: 'текст',
    level: 1,
    test_id: id(Test, { title: 'Ruby' })
  },
  # Вопросы для "Модели в Ruby on Rails"
  {
    #id: 11
    body: 'текст',
    level: 1,
    test_id: id(Test, { title: 'Модели в Ruby on Rails' })
  },
  {
    #id: 12
    body: 'текст',
    level: 2,
    test_id: id(Test, { title: 'Модели в Ruby on Rails' })
  },
  # Вопросы для "Контроллеры в Ruby on Rails"
  {
    #id: 13
    body: 'текст',
    level: 1,
    test_id: id(Test, { title: 'Контроллеры в Ruby on Rails' })
  },
  {
    #id: 14
    body: 'текст',
    level: 1,
    test_id: id(Test, { title: 'Контроллеры в Ruby on Rails' })
  }
])
data_was_created(Question)

Answer.create!([
  {
    body: 'текст',
    user_id: id(User, { last_name: 'Луков' }),
    question_id: id(Question, { body: 'текст' }),
    correct: true
  },
  {
    body: 'текст',
    user_id: id(User, { last_name: 'Луков' }),
    question_id: id(Question, { body: 'текст' }),
    correct: true
  },
  {
    body: 'текст',
    user_id: id(User, { last_name: 'Елкова' }),
    question_id: id(Question, { body: 'текст' }),
    correct: true,
  },
  {
    body: 'текст',
    user_id: id(User, { last_name: 'Елкова' }),
    question_id: id(Question, { body: 'текст' }),
    correct: false,
  }
])
data_was_created(Answer)

