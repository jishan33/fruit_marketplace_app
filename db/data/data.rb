def products
[
  {
    title: "Harvest Gold Fruit Basket",
    rank: "A",
    quantity: 1,
    description: "An abundance of the choicest, freshest fruit, featuring just harvested varieties of pears from our own orchards.",
    price: 60,
    farmer_id: 1,
    picture: "fruit_box1.jpg"
  },

  {
    title: "All the Best Fruit Basket",
    rank: "B",
    quantity: 2,
    description: "A classic assortment of fresh fruit that is expertly paired to make a just right gift!",
    price: 40,
    farmer_id: 1,
    picture: "fruit_box2.jpg"

  },

  {
    title: "2lb Fresh Sweet Red Cherries Gift Box",
    rank: "B",
    quantity: 3,
    description: "Freshest cheeries .",
    price: 50,
    farmer_id: 1,
    picture: "fruit_box3.jpg"

  },

  {
    title: "Deluxe Winter Collection ",
    rank: "A",
    quantity: 1,
    description: "Top level Snow Pears",
    price: 100,
    farmer_id: 2,
    picture: "pear_box.jpg"

  },

  {
    title: 'Home Warming Collection',
    rank: "B",
    quantity: 2,
    description: "Sweet fruit for the Sweet home",
    price: 30,
    farmer_id: 2,
    picture: "fruit_box4.jpg"

  }
]
end

def farmers 
[
  { 
    name: "John Lu",
    address: '28 Jersey Parade yarra glen',
    fruit_types: 'pears, oranges, berries',
    introduction: 'Hello, I am a victorian farmer living in yarra glen, we produce fruit with passion and love',
    user_id: 1
  },

  {
    name: "Melo",
    address: '33 Melanda Parade bunyip',
    fruit_types: 'pears,  Mandarins, strawberries',
    introduction: 'Hello, I am a farmer living in bunyip, we produce fruit freshest air, water, and sunlight',
    user_id: 2

  }
]
end



