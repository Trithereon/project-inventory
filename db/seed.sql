INSERT INTO
  pantheons (name, origin, description)
VALUES
  (
    'Roman',
    'Rome, 1000 BC',
    'Ancient Romans worshipped many gods, including Jupiter, Juno, Mars, and Minerva, believing the survival of the state depended on keeping their favor. Religion was practical and ritual-focused: public sacrifices, festivals, and omens, led by priests and magistrates. Households honored their own spirits, the Lares and Penates. Rome also adopted foreign gods, often matching them to its own deities.'
  ),
  (
    'Greek',
    'Greece, 2000 BC',
    'The Greeks worshipped anthropomorphic gods led by Zeus and the Olympians, including Athena, Apollo, and Poseidon. Each city had patron deities, temples, and festivals. Worship centered on sacrifice, prayer, and offerings, with oracles like Delphi offering guidance. Myths explained nature, heroes, and human fate.'
  ),
  (
    'Norse',
    'Scandinavia, 500 AD',
    'Norse pagans honored the Aesir and Vanir, including Odin, Thor, Freyja, and Frey, through feasts, sacrifices, and oaths. Their cosmos centered on the world tree Yggdrasil and was fated to end at Ragnarok. Fate, honor, and the favor of gods and ancestors shaped daily life.'
  ),
  (
    'Egyptian',
    'Egypt, 4000 BC',
    'Egyptians worshipped many gods, such as Ra, Osiris, Isis, and Horus, who embodied natural and cosmic forces. Pharaoh was the divine link to the gods, maintaining ma''at, or cosmic order. Temples held daily rituals, and elaborate burial practices aimed to secure a successful afterlife.'
  );

INSERT INTO
  gods (
    pantheon_id,
    name,
    gender,
    description,
    status,
    img_url
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        pantheons
      WHERE
        name = 'Roman'
    ),
    'Apollo',
    'Male',
    'An eternally youthful, beardless man crowned with laurel, usually holding a lyre or bow. He slew the serpent Python at Delphi and chased the nymph Daphne, who escaped by turning into a laurel tree.',
    'Major',
    '/assets/roman/apollo.jpg'
  ),
  (
    (
      SELECT
        id
      FROM
        pantheons
      WHERE
        name = 'Roman'
    ),
    'Ceres',
    'Female',
    'A mature, matronly woman wearing a crown of wheat ears and carrying a sheaf of grain, a torch, or a cornucopia. When her daughter Proserpina was abducted by Pluto, she searched the earth in grief and let the crops fail.',
    'Major',
    '/assets/roman/ceres.jpg'
  ),
  (
    (
      SELECT
        id
      FROM
        pantheons
      WHERE
        name = 'Roman'
    ),
    'Diana',
    'Female',
    'A young huntress in a short tunic with a bow and quiver, often with a crescent moon on her brow and hounds or a deer at her side. She turned the hunter Actaeon into a stag after he stumbled upon her bathing.',
    'Major',
    '/assets/roman/diana.jpg'
  ),
  (
    (
      SELECT
        id
      FROM
        pantheons
      WHERE
        name = 'Roman'
    ),
    'Juno',
    'Female',
    'A regal, stately woman wearing a diadem and veil, holding a scepter, with a peacock as her companion. She relentlessly persecuted Jupiter''s lovers and their children, and she tormented Aeneas and the Trojans.',
    'Major',
    '/assets/roman/juno.jpg'
  ),
  (
    (
      SELECT
        id
      FROM
        pantheons
      WHERE
        name = 'Roman'
    ),
    'Jupiter',
    'Male',
    'A powerful, bearded man in his prime, seated on a throne with an eagle beside him and a thunderbolt in hand. He overthrew his father Saturn to take power and was known for descending to earth in disguise to pursue mortals.',
    'Major',
    '/assets/roman/jupiter.jpg'
  ),
  (
    (
      SELECT
        id
      FROM
        pantheons
      WHERE
        name = 'Roman'
    ),
    'Mars',
    'Male',
    'A muscular warrior in full armor, with a crested helmet, spear, and shield, sometimes accompanied by a wolf. He fathered Romulus and Remus with the priestess Rhea Silvia and was famously caught in an affair with Venus.',
    'Major',
    '/assets/roman/mars.jpg'
  ),
  (
    (
      SELECT
        id
      FROM
        pantheons
      WHERE
        name = 'Roman'
    ),
    'Mercury',
    'Male',
    'A swift, youthful figure wearing winged sandals and a winged cap, carrying the snake-entwined caduceus. As a newborn he stole Apollo’s cattle, and he led the souls of the dead down to the underworld.',
    'Major',
    '/assets/roman/mercury.jpg'
  ),
  (
    (
      SELECT
        id
      FROM
        pantheons
      WHERE
        name = 'Roman'
    ),
    'Minerva',
    'Female',
    'A stern, helmeted woman in armor, carrying a spear and a shield bearing the aegis, with an owl as her companion. She burst fully armed from Jupiter’s forehead and turned Arachne into a spider after losing a weaving contest.',
    'Major',
    '/assets/roman/minerva.jpg'
  ),
  (
    (
      SELECT
        id
      FROM
        pantheons
      WHERE
        name = 'Roman'
    ),
    'Neptune',
    'Male',
    'A bearded, muscular man holding a trident and riding a chariot pulled by sea horses. He struck the ground to create springs and was said to have created the horse.',
    'Major',
    '/assets/roman/neptune.jpg'
  ),
  (
    (
      SELECT
        id
      FROM
        pantheons
      WHERE
        name = 'Roman'
    ),
    'Venus',
    'Female',
    'A strikingly beautiful woman, often nude or lightly draped, born from sea foam and shown rising on a scallop shell, accompanied by doves and her son Cupid. She won the Judgment of Paris by promising him Helen, which set the Trojan War in motion.',
    'Major',
    '/assets/roman/venus.jpg'
  ),
  (
    (
      SELECT
        id
      FROM
        pantheons
      WHERE
        name = 'Roman'
    ),
    'Vulcan',
    'Male',
    'A brawny, bearded smith in a work tunic, holding a hammer and tongs, and usually shown lame. He was hurled from Olympus (by Jupiter or Juno, depending on the version) and later forged weapons for Aeneas and Achilles.',
    'Major',
    '/assets/roman/vulcan.jpg'
  );

INSERT INTO
  domains (name)
VALUES
  ('Agriculture'),
  ('Arts'),
  ('Beauty'),
  ('Childbirth'),
  ('Commerce'),
  ('Crafts'),
  ('Desire'),
  ('Earthquakes'),
  ('Eloquence'),
  ('Fertility'),
  ('Fire'),
  ('Forge'),
  ('Grain'),
  ('Harvest'),
  ('Healing'),
  ('Horses'),
  ('Hunt'),
  ('Laws'),
  ('Love'),
  ('Marriage'),
  ('Moon'),
  ('Music'),
  ('Poetry'),
  ('Prophecy'),
  ('Protection of young women'),
  ('Roman state'),
  ('Sea'),
  ('Sky'),
  ('Sun'),
  ('Thunder'),
  ('Travelers'),
  ('Thieves'),
  ('Volcanoes'),
  ('War'),
  ('Wild nature'),
  ('Wisdom');

INSERT INTO
  symbols (symbol)
VALUES
  ('Lyre'),
  ('Laurel wreath'),
  ('Bow and arrow'),
  ('Sun chariot'),
  ('Bundle of wheat'),
  ('Cornucopia'),
  ('Torch'),
  ('Poppy'),
  ('Crescent moon'),
  ('Deer'),
  ('Hunting hound'),
  ('Peacock'),
  ('Diadem'),
  ('Scepter'),
  ('Pomegranate'),
  ('Thunderbolt'),
  ('Eagle'),
  ('Oak tree'),
  ('Spear'),
  ('Shield'),
  ('Helmet'),
  ('Wolf'),
  ('Woodpecker'),
  ('Caduceus'),
  ('Winged sandals'),
  ('Winged cap'),
  ('Purse'),
  ('Owl'),
  ('Aegis'),
  ('Olive tree'),
  ('Trident'),
  ('Horse'),
  ('Dolphin'),
  ('Sea chariot'),
  ('Dove'),
  ('Scallop shell'),
  ('Rose'),
  ('Myrtle'),
  ('Apple'),
  ('Hammer'),
  ('Anvil'),
  ('Tongs'),
  ('Volcano');

INSERT INTO
  god_symbols (god_id, symbol_id)
VALUES
  -- Apollo
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Apollo'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Lyre'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Apollo'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Laurel wreath'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Apollo'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Bow and arrow'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Apollo'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Sun chariot'
    )
  ),
  -- Ceres
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Ceres'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Bundle of wheat'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Ceres'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Cornucopia'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Ceres'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Torch'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Ceres'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Poppy'
    )
  ),
  -- Diana
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Diana'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Bow and arrow'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Diana'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Crescent moon'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Diana'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Deer'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Diana'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Hunting hound'
    )
  ),
  -- Juno
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Juno'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Peacock'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Juno'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Diadem'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Juno'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Scepter'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Juno'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Pomegranate'
    )
  ),
  -- Jupiter
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Jupiter'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Thunderbolt'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Jupiter'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Eagle'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Jupiter'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Scepter'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Jupiter'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Oak tree'
    )
  ),
  -- Mars
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Mars'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Spear'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Mars'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Shield'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Mars'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Helmet'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Mars'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Wolf'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Mars'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Woodpecker'
    )
  ),
  -- Mercury
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Mercury'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Caduceus'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Mercury'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Winged sandals'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Mercury'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Winged cap'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Mercury'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Purse'
    )
  ),
  -- Minerva
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Minerva'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Owl'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Minerva'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Helmet'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Minerva'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Aegis'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Minerva'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Olive tree'
    )
  ),
  -- Neptune
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Neptune'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Trident'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Neptune'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Horse'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Neptune'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Dolphin'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Neptune'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Sea chariot'
    )
  ),
  -- Venus
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Venus'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Dove'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Venus'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Scallop shell'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Venus'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Rose'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Venus'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Myrtle'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Venus'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Apple'
    )
  ),
  -- Vulcan
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Vulcan'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Hammer'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Vulcan'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Anvil'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Vulcan'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Tongs'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Vulcan'
    ),
    (
      SELECT
        id
      FROM
        symbols
      WHERE
        symbol = 'Volcano'
    )
  );

INSERT INTO
  god_domains (god_id, domain_id)
VALUES
  -- Apollo
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Apollo'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Sun'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Apollo'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Music'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Apollo'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Poetry'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Apollo'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Prophecy'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Apollo'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Healing'
    )
  ),
  -- Ceres
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Ceres'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Agriculture'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Ceres'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Grain'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Ceres'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Harvest'
    )
  ),
  -- Diana
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Diana'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Hunt'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Diana'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Moon'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Diana'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Wild nature'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Diana'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Protection of young women'
    )
  ),
  -- Juno
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Juno'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Marriage'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Juno'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Childbirth'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Juno'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Roman state'
    )
  ),
  -- Jupiter
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Jupiter'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Sky'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Jupiter'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Thunder'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Jupiter'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Laws'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Jupiter'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Roman state'
    )
  ),
  -- Mars
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Mars'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'War'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Mars'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Agriculture'
    )
  ),
  -- Mercury
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Mercury'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Commerce'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Mercury'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Travelers'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Mercury'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Thieves'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Mercury'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Eloquence'
    )
  ),
  -- Minerva
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Minerva'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Wisdom'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Minerva'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'War'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Minerva'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Crafts'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Minerva'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Arts'
    )
  ),
  -- Neptune
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Neptune'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Sea'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Neptune'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Earthquakes'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Neptune'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Horses'
    )
  ),
  -- Venus
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Venus'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Love'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Venus'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Beauty'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Venus'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Desire'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Venus'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Fertility'
    )
  ),
  -- Vulcan
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Vulcan'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Fire'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Vulcan'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Volcanoes'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        gods
      WHERE
        name = 'Vulcan'
    ),
    (
      SELECT
        id
      FROM
        domains
      WHERE
        name = 'Forge'
    )
  );
