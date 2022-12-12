# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# db/seeds.rb

require 'json'

QUESTIONS = [
  {
    id: 1,
    content: 'You`re really busy at work and a colleague is telling you their life story and personal woes. You: ',
    options: [
      {content: 'Don`t dare to interrupt them', option_type:'introvert'},
      {content: 'Think it`s more important to give them some of your time; work can wait ',option_type:'extrovert'},
      {content: 'Listen, but with only with half an ear',option_type:'introvert'},
      {content: 'Interrupt and explain that you are really busy at the moment ',option_type:'introvert'},
    ]
  },
  {
    id: 2,
    content: 'You`ve been sitting in the doctor`s waiting room for more than 25 minutes. You: ',
    options: [
      {content: 'Look at your watch every two minutes ',option_type:'introvert'},
      {content: 'Explain to other equally impatient people in the room that the doctor is always running late ',option_type:'extrovert'},
      {content: 'Bubble with inner anger, but keep quiet ',option_type:'introvert'},
      {content: 'Complain in a loud voice, while tapping your foot impatiently ',option_type:'extrovert'},
    ]
  },
  {
    id: 3,
    content: 'You`re having an animated discussion with a colleague regarding a project that you`re in charge of. You: ',
    options: [
      {content: 'Don`t dare contradict them ',option_type: 'introvert'},
      {content: 'Continuously interrupt your colleague ',option_type: 'extrovert'},
      {content: 'Think that they are obviously right ',option_type: 'introvert'},
      {content: 'Defend your own point of view, tooth and nail ',option_type: 'extrovert'},
    ]
  },
  {
    id: 4,
    content: 'You are taking part in a guided tour of a museum. You: ',
    options: [
      {content: 'Are right up the front, adding your own comments in a loud voice ',option_type: 'extrovert'},
      {content: 'Are a bit too far towards the back so don`t really hear what the guide is saying ',option_type: 'introvert'},
      {content: 'Follow the group without question',option_type: 'introvert'},
      {content: 'Make sure that everyone is able to hear properly ',option_type: 'extrovert'},
    ]
  },
  {
    id: 5,
    content: 'During dinner parties at your home, you have a hard time with people who: ',
    options: [
      {content: 'Ask you to tell a story in front of everyone else ',option_type: 'introvert'},
      {content: 'Hang around you all evening ',option_type: 'extrovert'},
      {content: 'Talk privately between themselves ',option_type: 'introvert'},
      {content: 'Always drag the conversation back to themselves ',option_type: 'extrovert'},
    ]
  },
  # {
  #   id: 6,
  #   content: 'You crack a joke at work, but nobody seems to have noticed. You: ',
  #   options: [
  #     {content: 'Think it`s for the best — it was a lame joke anyway' ,option_type: 'introvert'},
  #     {content: 'Try again a bit later with one of your colleagues ' ,option_type: 'introvert'},
  #     {content: 'Keep telling it until they pay attention' ,option_type: 'extrovert'},
  #     {content: 'Wait to share it with your friends after work' ,option_type: 'introvert'},
  #   ]
  # },
  # {
  #   id: 7,
  #   content: ' This morning, your agenda seems to be free. You: ',
  #   options: [
  #     {content: 'Know that somebody will find a reason to come and bother you' ,option_type: 'introvert'},
  #     {content: 'Question your colleagues about a project that`s been worrying you' ,option_type: 'extrovert'},
  #     {content: 'Heave a sigh of relief and look forward to a day without stress' ,option_type: 'introvert'},
  #     {content: 'Pick up the phone and start filling up your agenda with meetings ' ,option_type: 'extrovert'},
  #   ]
  # },
  # {
  #   id: 8,
  #   content: 'During dinner, the discussion moves to a subject about which you know nothing at all. You: ',
  #   options: [
  #     {content: 'Ask lots of questions to learn more about it ' ,option_type: 'extrovert'},
  #     {content: 'Don`t dare show that you don`t know anything about the subject ' ,option_type: 'introvert'},
  #     {content: 'Barely follow the discussion' ,option_type: 'introvert'},
  #     {content: 'Change the subject of discussion' ,option_type: 'extrovert'},
  #   ]
  # },
  # {
  #   id: 9,
  #   content: ' You`re out with a group of friends and there`s a person who`s quite shy and doesn`t talk much. You: ',
  #   options: [
  #     {content: 'Notice that they`re alone, but don`t go over to talk with them' ,option_type: 'introvert'},
  #     {content: 'Go and have a chat with them' ,option_type: 'extrovert'},
  #     {content: 'Shoot some friendly smiles in their direction ' ,option_type: 'extrovert'},
  #     {content: 'Hardly notice them at all' ,option_type: 'introvert'},
  #   ]
  # },
  # {
  #   id: 10,
  #   content: 'At work, somebody asks for your help for the hundredth time. You: ',
  #   options: [
  #     {content: 'Give them a hand, as usual ' ,option_type: 'introvert'},
  #     {content: 'Ask them, please, to find somebody else for a change' ,option_type: 'extrovert'},
  #     {content: 'Accept — you`re known for being helpful ' ,option_type: 'introvert'},
  #     {content: 'Loudly make it known that you`re annoyed' ,option_type: 'extrovert'},
  #   ]
  # },
  # {
  #   id: 11,
  #   content: 'You`ve been see a movie with your family and the reviews are mixed. You: ',
  #   options: [
  #     {content: 'Don`t share your point of view with anyone' ,option_type: 'introvert'},
  #     {content: 'Try to bring the others round to your point of view' ,option_type: 'extrovert'},
  #     {content: 'Didn`t like the film, but keep your views to yourself when asked ' ,option_type: 'introvert'},
  #     {content: 'State your point of view with enthusiasm' ,option_type: 'extrovert'},
  #   ]
  # },
].freeze

REDIS.set('QUESTIONS', QUESTIONS.to_json)
