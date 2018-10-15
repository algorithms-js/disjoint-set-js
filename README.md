# Disjoint set

Implementation of the data structure disjoint set.

For more information about this data structure please see [here](https://en.wikipedia.org/wiki/Disjoint-set_data_structure).

# Example

```js
const DisjointSet = require('disjoint-set-js');

// create an instance
const mySet = new DisjointSet();

// enter all the elements you want.
// The elements should be numbers integer or string
mySet.add(0);
mySet.add(1);
mySet.add(2);
mySet.add(3);
mySet.add('five');
mySet.add('six');

mySet.numOfSets(); // 5

mySet.unionSet(0, 1);
mySet.unionSet(2, 1);
mySet.isConnected(0, 2); // true
mySet.sizeOfSet(2); // 3

mySet.unionSet('five', 3);
mySet.unionSet(3, 'six');
mySet.isConnected(3, 'five'); // true
mySet.sizeOfSet('six'); // 3

mySet.numOfSets(); // 2

mySet.isConnected(0, 'five'); // false

mySet.unionSet(0, 'six');
mySet.unionSet(3, 'six'); // true
mySet.numOfSets(); // 1

mySet.toString();

mySet.erase();
```
