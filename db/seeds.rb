# frozen_string_literal: true

10.times do |blog|
  Blog.create!(
    title: "Blog Post #{blog}",
    body: 'La fête nationale française s’appelle le Quatorze Juillet – et non pas « le jour de la Bastille » comme en anglais. Elle commémore la prise de cette fameuse prison le 14 juillet 1789 et le déclenchement de la Révolution française. Symbole du pouvoir absolu et arbitraire de l’Ancien Régime de Louis XVI, la conquête de la Bastille par le peuple prouva que le pouvoir du roi n’était plus absolu : les Français exigèrent qu’il se fonde sur la Nation et qu’il soit modéré par une séparation des pouvoirs.'
  )
end

puts '10 blog posts created'

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end

puts '5 skills created'

9.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title #{portfolio_item}",
    subtitle: 'My great service',
    body: 'Ce ne fut qu’en 1880, alors que la France était définitivement devenue républicaine, que le député Benjamin Raspail déposa la loi déclarant le 14 juillet fête nationale. La signification de la chute de la Bastille est si forte, donc, parce qu’elle équivaut à la naissance de la République.',
    main_image: 'https://via.placeholder.com/600X400',
    thumb_image: 'https://via.placeholder.com/350X200'
  )
end

puts '9 portfolio items created'
