pca_eigen_decomp <- function(X) {
  if (!is.matrix(X)) {
    stop("Input is not a Matrix")
  }

  if (any(is.na(X))) {
    stop("Missing values not acceptable")
  }

  n <- nrow(X)
  p <- ncol(X)
  
  if (n < 2 || p < 2) {
    stop("n & p minimum is to be 2.")
  }

  k <- min(n, p)


#  STEP 1 : STANDARDIZED THE DATA 
  Y <- apply(X, 2, function(col) col - mean(col))  # Centering
  Y <- apply(Y, 2, function(col) col / sd(col))    # Scaling


# STEP 2 : COVARIANCE MATRIX
  C <- cov(Y) 


# STEP 3 : EIGEN DECOMPOSITION 
  eigen_decomp <- eigen(C)
  values <- eigen_decomp$values
  vectors <- eigen_decomp$vectors


# STEP 4 : SORT THE EIGEN VECTORS BY IN ORDER OF EIGEN VALUES
  sorted_idx <- order(values, decreasing = TRUE)
  values <- values[sorted_idx]
  vectors <- vectors[, sorted_idx]


# STEP 5 : SELECT THE TOP K EIGENVECTORS TO FORM THE PROJECTION MATRIX
  k_component <- vectors[, 1:k, drop = FALSE]

# STEP 6 : PROJECT THE DATA 
  x_pca <- Y %*% k_component


  std_devs <- sqrt(values[1:k])
  
  list(
    loadings = vectors,  
    scores = x_pca,      
    standard_deviations = std_devs
  )
}





# --------- TEST CASE  USArrests DATASET ---------
data(USArrests)
X <- USArrests[, -4] 
X_matrix <- as.matrix(X)

result_custom <- pca_eigen_decomp(X_matrix)
result_princomp <- princomp(X)

print("Custom PCA Loadings:")
print(result_custom$loadings)
print("Princomp Loadings:")
print(result_princomp$loadings)


print("Custom PCA Scores:")
print(result_custom$scores)
print("Princomp Scores:")
print(result_princomp$scores)

