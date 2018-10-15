
class DisjointSet
  constructor: ->
    @parent  = {}
    @height  = {}
    @size    = {}
    @sets    = 0

  ###*
  # Add new node
  # @param {!(number|string)} node - number should be integer
  ###
  add: (node) ->
    @parent[node] = node
    @height[node] = 0
    @size[node]   = 1
    @sets        += 1
    return


  ###*
  # Find the index of tree's root of the current node
  # @param {!(number|string)} node - number should be integer
  # @return {(number|string)}
  ###
  findSet: (node) ->
    if @parent.node?
      throw new Error("#{node} is not in the disjoint set")

    root = node

    while root isnt @parent[root]
      root = @parent[root]

    while root isnt @parent[node]
      tmp =  @parent[node]
      @parent[node] = root
      @height[tmp] = 0
      node = tmp

    return root

  ###*
  # Verify if the elements are in same set
  # @param {!(number|string)} nodeP - number should be integer
  # @param {!(number|string)} nodeQ - number should be integer
  # @return {boolean}
  ###
  isConnected: (nodeP, nodeQ) ->
    return @findSet(nodeP) is @findSet(nodeQ)

  ###*
  # Join the trees that contains the elements
  # @param {!(number|string)} nodeP - number should be integer
  # @param {!(number|string)} nodeQ - number should be integer
  # @return {boolean}
  ###
  unionSet: (nodeP, nodeQ) ->
    rootP = @findSet(nodeP)
    rootQ = @findSet(nodeQ)

    if rootP isnt rootQ

      if @height[rootP] < @height[rootQ]
        @parent[rootP] = rootQ
        @size[rootQ]  += @size[rootP]
      else
        @parent[rootQ] = rootP
        @size[rootP]  += @size[rootQ]

        if @height[rootP] is @height[rootQ]
          @height[rootP] += 1;

        @sets -= 1
        return true

    return false

  ###*
  # Return the number of elements connected with the node
  # @param {!(number|string)} node - number should be integer
  # @return {number}
  ###
  sizeOfSet: (node) ->
    rootNode = @findSet(node)
    return @size[rootNode];

  ###*
  # Return the number of sets in the disjoint set
  # @param {!(number|string)} node - number should be integer
  # @return {number}
  ###
  numOfSets: (node) ->
    return @sets

  ###*
  # Erase all nodes
  ###
  erase: ->
    @parent  = {}
    @height  = {}
    @size    = {}
    @sets    = 0
    return

  ###*
  # Return a string with all the elements with this format [element -> parent]
  # @override
  # @return {string}
  ###
  toString: ->
    nodes = for element, parent of @parent
      "[#{element} -> #{parent}]"
    return nodes.join(', ')

module.exports = DisjointSet
