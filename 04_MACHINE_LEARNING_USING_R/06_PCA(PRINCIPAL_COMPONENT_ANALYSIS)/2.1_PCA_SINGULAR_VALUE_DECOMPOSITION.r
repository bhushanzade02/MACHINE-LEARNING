pca_svd_decomp <- function(X) {
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

  # STEP 1 : STANDARDIZE THE DATA (Centering and Scaling)
  Y <- apply(X, 2, function(col) col - mean(col))  # Centering
  Y <- apply(Y, 2, function(col) col / sd(col))    # Scaling



  # STEP 2 : SINGULAR VALUE DECOMPOSITION (SVD)
  svd_decomp <- svd(Y)  #
  


  # Extract components from the SVD
  U <- svd_decomp$u   
  D <- svd_decomp$d   
  V <- svd_decomp$v   


  # STEP 3 : SELECT THE TOP K SINGULAR VECTORS
  k_component <- V[, 1:k, drop = FALSE]


  # STEP 4 : PROJECT THE DATA 
  x_pca <- U[, 1:k] %*% diag(D[1:k])


  # STEP 5 : STANDARD DEVIATIONS 
  std_devs <- D[1:k]  
  

  list(
    loadings = V,              
    scores = x_pca,            
    standard_deviations = std_devs  
  )
}






# --------- TEST CASE  USArrests DATASET ---------
data(USArrests)
us_data <- as.matrix(USArrests)

custom_pca_us <- pca_svd_decomp(us_data)
builtin_pca_us <- princomp(us_data, cor = TRUE)

cat("\nCustom PCA Loadings (USArrests):\n")
print(custom_pca_us$loadings)

cat("\nBuilt-in PCA Loadings (USArrests):\n")
print(builtin_pca_us$loadings)