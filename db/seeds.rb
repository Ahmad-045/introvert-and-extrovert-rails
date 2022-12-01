# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# db/seeds.rb

questionData = [
  {
    content: 'You`re really busy at work and a colleague is telling you their life story and personal woes. You: ',
    options: [
      {content: 'Don`t dare to interrupt them', option_type:'introvert'},
      {content: 'Think it`s more important to give them some of your time; work can wait ',option_type:'extrovert'},
      {content: 'Listen, but with only with half an ear',option_type:'introvert'},
      {content: 'Interrupt and explain that you are really busy at the moment ',option_type:'extrovert'}
    ]
  },
  {
    content: 'You`ve been sitting in the doctor`s waiting room for more than 25 minutes. You: ',
    options: [
      {content: 'Look at your watch every two minutes ',option_type:'introvert'},
      {content: 'Bubble with inner anger, but keep quiet ',option_type:'extrovert'},
      {content: 'Explain to other equally impatient people in the room that the doctor is always running late ',option_type:'introvert'},
      {content: 'Complain in a loud voice, while tapping your foot impatiently ',option_type:'extrovert'}
    ]
  },
  {
    content: 'You`re having an animated discussion with a colleague regarding a project that you`re in charge of. You: ',
    options: [
      {content: 'Don`t dare contradict them ',option_type: 'extrovert'},
      {content: 'Think that they are obviously right ',option_type: 'introvert'},
      {content: 'Defend your own point of view, tooth and nail ',option_type: 'extrovert'},
      {content: 'Continuously interrupt your colleague ',option_type: 'introvert'}
    ]
  },
  {
    content: 'You are taking part in a guided tour of a museum. You: ',
    options: [
      {content: 'Are a bit too far towards the back so don`t really hear what the guide is saying ',option_type: 'introvert'},
      {content: 'Follow the group without question',option_type: 'extrovert'},
      {content: 'Make sure that everyone is able to hear properly ',option_type: 'introvert'},
      {content: 'Are right up the front, adding your own comments in a loud voice ',option_type: 'extrovert'}
    ]
  },
  {
    content: 'During dinner parties at your home, you have a hard time with people who: ',
    options: [
      {content: 'Ask you to tell a story in front of everyone else ',option_type: 'extrovert'},
      {content: 'Talk privately between themselves ',option_type: 'extrovert'},
      {content: 'Hang around you all evening ',option_type: 'introvert'},
      {content: 'Always drag the conversation back to themselves ',option_type: 'introvert'}
    ]
  },
  {
    content: 'You crack a joke at work, but nobody seems to have noticed. You: ',
    options: [
      {content: 'Think it`s for the best — it was a lame joke anyway' ,option_type: 'extrovert'},
      {content: 'Wait to share it with your friends after work' ,option_type: 'extrovert'},
      {content: 'Try again a bit later with one of your colleagues ' ,option_type: 'introvert'},
      {content: 'Keep telling it until they pay attention' ,option_type: 'introvert'}
    ]
  }
]


questionData.each do |data|
  q = Question.create(content: data[:content])

  data[:options].each do |opt|
    q.options.create!(opt)
  end
end
