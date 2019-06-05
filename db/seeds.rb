# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Вопросы для "Основы CSS"

def print_msg(model, msg)
  puts "-> #{model}: #{msg} (#{model.count})"
end

def data_was_created(model)
  print_msg(model, 'Данные созданы')
end

def data_was_clear(model)
  print_msg(model, 'Данные очищены')
end

def table_empty(model)
  print_msg(model, 'Таблица пуста')
end

def id(model, params)
  model.where(params).pluck(:id).first
end

models = [Role, User, Category, Test, TestPassage, Question, Answer]
models.each do |model|
  if model.count > 0
    data_was_clear(model) if model.destroy_all
  else
    table_empty(model)
  end
end
puts

Role.create!([
{
  name: 'Администратор',
},
{
  name: 'Пользователь'
}
])
data_was_created(Role)

RoleUser.create!([
  {
    user_id: id(User, { last_name:  'Луков' }),
    role_id: id(Role, { name: 'Пользователь' })
  },
  {
    user_id: id(User, { last_name:  'Елкова' }),
    role_id: id(Role, { name: 'Пользователь' })
  },
  {
    user_id: id(User, { last_name:  'Дубов' }),
    role_id: id(Role, { name: 'Администратор' })
  }
])
])
data_was_created(RoleUser)

User.create!([
{
  first_name: 'Сергей',
  last_name:  'Луков',
},
{
  first_name: 'Мира',
  last_name:  'Елкова',
},
{
  first_name: 'Миша',
  last_name:  'Дубов'
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

TestAuthor.create!([
  {
    user_id: id(User, { last_name: 'Дубов' }),
    test_id: id(Test, { title: 'Модели Ruby on Rails' })
  },
  {
    user_id: id(User, { last_name: 'Дубов' }),
    test_id: id(Test, { title: 'Контроллеры в Ruby on Rails' })
  },
  {
    user_id: id(User, { last_name: 'Дубов' }),
    test_id: id(Test, { title: 'Основы PHP' })
  },
  {
    user_id: id(User, { last_name: 'Дубов' }),
    test_id: id(Test, { title: 'Основы HTML' })
  },
])
data_was_created(TestAuthor)

TestPassage.create!([
  {
    user_id: id(User, { last_name: 'Луков' }),
    test_id: id(Test, { title: 'Модели в Ruby on Rails' }),
    begin_at: Time.now
  },
  {
    user_id: id(User, { last_name: 'Луков' }),
    test_id: id(Test, { title: 'Контроллеры в Ruby on Rails' }),
    begin_at: Time.now
  },
  {
    user_id: id(User, { last_name: 'Елкова' }),
    test_id: id(Test, { title: 'Основы PHP' }),
    begin_at: Time.now
  },
  {
    user_id: id(User, { last_name: 'Елкова' }),
    test_id: id(Test, { title: 'Основы HTML' }),
    begin_at: Time.now
  },
])
data_was_created(TestPassage)

Question.create!([

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

  {
    #id: 7
    body: 'текст',
    level: 1,
    test_id: id(Test, { title: 'Ruby' })
  },
  #
  {
    #id: 8
    body: 'текст',
    level: 1,
    test_id: id(Test, { title: 'Ruby' })
  },

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

