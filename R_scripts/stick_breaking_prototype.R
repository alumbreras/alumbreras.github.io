n <- 1000
# Stick breaking
v  <- rbeta(n, 1, alpha)

pi <- numeric(n)
pi[1] <- v[1] 
pi[2:n] <- sapply(2:n, function(i) v[i] * prod(1 - v[1:(i-1)]))

# Atoms from the base measure
y <- G_0(n) 

# Sample from the Dirichlet Process G
theta <- sample(y, prob = pi, replace = TRUE)


K <- 1000

# Stick breaking
alpha <- 1000
v  <- rbeta(K, 1, alpha)

pi <- numeric(K)
pi[1] <- v[1] 
pi[2:K] <- sapply(2:K, function(i) v[i] * prod(1 - v[1:(i-1)]))

plot(cumsum(pi))
hist(pi, breaks=100)

# Atoms
G_0 <- function(n) rpois(n, 100)     # Poisson
G_0 <- function(n) rnorm(n, 0, 10) # Gaussian
y <- G_0(K) 

# Sample from the Dirichlet Process G
theta <- sample(y, prob = pi, replace = TRUE)
hist(theta, breaks = 20, xlab = "", main = "Samples from DP")

png("fig15_DPsamples.png", width = 16, height = 16, units = "cm", res=400)
hist(theta, breaks = 20, xlab = "", main = "Samples from DP")
dev.off()