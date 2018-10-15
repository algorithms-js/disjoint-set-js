DisjointSet = require '../src/DisjointSet'


test 'all methods of the data structure disjoint set', ->
  SIZE = 10
  setTest = new DisjointSet()
  for i in [0...SIZE]
    setTest.add(i)

  expect(setTest.numOfSets()).toBe(SIZE)


  for i in [0...SIZE]
    expect(setTest.findSet(i)).toBe(i)
    expect(setTest.sizeOfSet(i)).toBe(1)


  for i in [0...SIZE]
    for j in [0...SIZE]
      if setTest[i] isnt setTest[j]
        expect(setTest.isConnected(i, j)).toBe(false)

  expect(setTest.unionSet(0, 1)).toBe(true)
  expect(setTest.unionSet(2, 4)).toBe(true)
  expect(setTest.unionSet(0, 2)).toBe(true)
  expect(setTest.sizeOfSet(0)).toBe(4)
  expect(setTest.numOfSets()).toBe(SIZE - 3)
  for i in [0...5]
    if i isnt 3
      expect(setTest.isConnected(3, i)).toBe(false)

  for i in [0...5]
    for j in [0...5]
      if i isnt 3 and j isnt 3
        expect(setTest.isConnected(i, j)).toBe(true)




  expect(setTest.unionSet(5, 6)).toBe(true)
  expect(setTest.unionSet(8, 7)).toBe(true)
  expect(setTest.unionSet(6, 7)).toBe(true)
  expect(setTest.sizeOfSet(5)).toBe(4)
  expect(setTest.numOfSets()).toBe(SIZE - 6)
  for i in [5...9]
    expect(setTest.isConnected(9, i)).toBe(false)


  for i in [5...9]
    for j in [5...9]
      expect(setTest.isConnected(i, j)).toBe(true)



  expect(setTest.unionSet(3, 9)).toBe(true)
  expect(setTest.unionSet(1, 9)).toBe(true)
  expect(setTest.unionSet(4, 7)).toBe(true)
  expect(setTest.numOfSets()).toBe(1)
  for i in [0...SIZE]
    for j in [0...SIZE]
      expect(setTest.isConnected(i, j)).toBe(true)



  for i in [0...SIZE]
    expect(setTest.sizeOfSet(i)).toBe(SIZE)

  setTest.erase()
  expect(setTest.numOfSets()).toBe(0)

  return
