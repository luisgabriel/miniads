ad_list = [
  [
    243.4,
    [
      [ 12.6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' ],
      [ 137.6, 'Aenean at felis porttitor, pulvinar mauris ac, laoreet est.' ]
    ],
    [
      [ 'Austin, London, Toronto, Santiago', :unkown ],
      [ '', :male ]
    ]
  ],
  [
    1344.8,
    [
      [ 667.6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' ],
      [ 34.6, 'Aenean at felis porttitor, pulvinar mauris ac, laoreet est.' ],
      [ 27.46, 'Aenean at felis porttitor, pulvinar mauris ac, laoreet est.' ]
    ],
    [
      [ 'Austin, London, Toronto, Santiago', :unkown ],
      [ 'Recife', :female ],
      [ '', :male ],
      [ 'Warsaw, Moscow, Talin', :male ],
      [ 'Olinda, Campinas', :unkown ]
    ]
  ],
  [
    434.7,
    [
      [ 57.6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' ]
    ],
    [
      [ 'Austin, London, Toronto, Santiago', :unkown ],
      [ 'Recife', :female ],
      [ '', :male ],
      [ 'Warsaw, Moscow, Talin', :male ],
      [ 'Olinda, Campinas', :unkown ]
    ]
  ]
]


for i in 1..4
  ad_list.each do |budget, creatives, targetings|
    temp = Ad.new budget: budget

    creatives.each do |bid, ad_text|
      temp.creatives.new bid: bid, ad_text: ad_text
    end

    targetings.each do |places, gender|
      temp.targetings.new places: places, gender: gender
    end

    temp.save!
  end
end
