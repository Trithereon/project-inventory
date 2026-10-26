# Brainstorm

## Database

- I want to populate the db with a few polytheistic religions that have a pantheon of gods, so Greek, Roman, Egyptian, and Norse.

- For family relation mapping, I think I'll have to have both directions, most of the time. For example: god_id=X related_id=Y relation=mother would also have to include god_id=Y related_id=X relation=son
  - Otherwise, I can have parents, siblings, spouses, cousins as separate tables.
  - Or parents and peers, where peers includes siblings, cousins and spouses, since parenthood is top-down, but everything else is lateral.

### God page

- Need the following columns from the db:
  - god (pantheon_id, name, gender, description, status, img_url)
  - pantheon (name)
  - domains (name, description)
  - symbols (god_id, symbol)
  - god_domains (god_id, domain_id)
  - god_counterparts (god_a_id, god_b_id)
  - god_parents (parent_id, child_id)
  - god_peers (god_a_id, god_b_id, relation)

## Content

Borrowing assets and text content.

- https://roman-empire.net/
- https://www.theoi.com/
- https://medium.com/@nyxshadowhawk/an-absolutely-massive-list-of-gods-the-norse-pantheon-7a5262ce2cdc
- wikipedia egyptian gods

## Theme

- casino zeus slot machine: clouds, blue sky, gold colors, divine look
- age of mythology
- valheim
- hercules
- clash of titans
- marvel thor, loki

## App architecture

- Probably will need a controller and router for domains, gods, and pantheons. Or maybe the app is simple enough for me to use juste one router and controller.

## TODO LIST:

- [x] Add edit/update to pantheons and gods
- [x] Make views for domains and symbols
- [ ] Implement server-side input validation
- [ ] Add counterparts for Roman/Greek gods
- [ ] Add family data
