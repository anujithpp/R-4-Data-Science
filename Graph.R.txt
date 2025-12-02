install.packages("igraph")
library(igraph)

# Define the edges of the graph
# Each pair of numbers represents an edge between two vertices
edge_list <- matrix(c(
  "A", "B",
  "A", "C",
  "B", "D",
  "C", "D",
  "D", "E"
), ncol = 2, byrow = TRUE)

# Create the graph object from the edge list
# 'directed = FALSE' makes it an undirected graph
g <- graph_from_edgelist(edge_list, directed = FALSE)

# To view the graph's adjacency list representation
print(g)

# Add a single edge between vertex 'B' and vertex 'E'
g <- add_edges(g, c("B", "E"))

# Add a new vertex 'F' explicitly
g <- add_vertices(g, 1, name = "F")

# Now add the edge between 'A' and 'F'
g <- add_edges(g, c("A", "F"))


# Print the updated graph to see the new connections
print(g)

# You can also plot the graph to visualize the changes
plot(g, main="Graph with Added Edges")


# R function to perform and display DFS traversal
perform_dfs <- function(graph, start_vertex) {
  # Check if the start vertex exists in the graph
  if (!start_vertex %in% V(graph)$name) {
    return(paste("Error: Start vertex '", start_vertex, "' not found in the graph."))
  }

  # Perform the DFS traversal
  # The 'root' parameter specifies the starting vertex
  dfs_result <- dfs(graph, root = start_vertex, unreachable = FALSE)

  # Extract the names of the vertices in the order they were visited
  traversal_order <- V(graph)$name[dfs_result$order]

  # Return the traversal path
  return(traversal_order)
}

# Let's use our graph 'g' and start the traversal from vertex 'A'
dfs_path <- perform_dfs(g, start_vertex = "A")

# Print the result
cat("DFS Traversal starting from A:", paste(dfs_path, collapse = " -> "), "\n")

# Example of another traversal starting from 'C'
dfs_path_from_c <- perform_dfs(g, start_vertex = "C")
cat("DFS Traversal starting from C:", paste(dfs_path_from_c, collapse = " -> "), "\n")
