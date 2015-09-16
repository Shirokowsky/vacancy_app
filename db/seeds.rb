#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

skills = Skill.create([
  {name: 'smoke'},
  {name: 'learn'},
  {name: 'read'},
  {name: 'write'},
  {name: 'Ruby'},
  {name: 'Go language'},
  {name: 'Adobe'},
  {name: 'Quark'},
  {name: 'Corel'},
  {name: '3D'},
  {name: 'Linux'},
  {name: 'Windows'},
  {name: 'MacOS'},
  {name: 'Android'},
  {name: 'FirefoxOS'},
  {name: 'ReactOS'},
  {name: 'AngularJS'},
  {name: 'ReactJS'},
  {name: 'VanillaJS'},
  {name: 'Vanilla Total War'}
])

employees = Employee.create([
    {name: 'Комков Степан Алексеевич', contact: '960 456 11 11', status: true,  salary: 100 },
    {name: 'Соколова Юлия Евгеньевна', contact: '960 456 22 22', status: false, salary: 200 },
    {name: 'Тимошинов Дмитрий Иванович', contact: '960 456 33 33', status: true,  salary: 300 },
    {name: 'Трушина Кристина Андреевна', contact: '960 456 44 44', status: true,  salary: 400 },
    {name: 'Лопатников Алексей Александрович', contact: '960 456 55 55', status: true,  salary: 400 },
    {name: 'Иванова Анна Евгеньевна', contact: '960 456 66 66', status: true,  salary: 300 }
])

vacancies = Vacancy.create([
    {title: 'ror dev', salary: 300, contact: 'test@test.ru'},
    {title: 'php dev', salary: 100, contact: 'test@test.ru'},
    {title: 'go dev', salary: 200, contact: 'test@test.ru'},
    {title: 'c++ dev', salary: 300, contact: 'test@test.ru'}
])