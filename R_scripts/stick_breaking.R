library(dplyr)
library(ggplot2)

#'@title Stick Breaking construction of a Dirichlet Process
#'@param n number of samples
#'@param alpha concentration parameter
#'@param G0 base measure
DP_stick_breaking <- function(n, alpha, G0) {

  # Stick breaking
  v  <- rbeta(n, 1, alpha)
  
  pi <- numeric(n)
  pi[1] <- v[1] 
  pi[2:n] <- sapply(2:n, function(i) v[i] * prod(1 - v[1:(i-1)]))
  
  # Atoms from the base measure
  y <- G0(n) 
  return(list(atoms = y,
              pis = pi))
  # Sample from the Dirichlet Process G
  #theta <- sample(y, prob = pi, replace = TRUE)
  #return(theta)
}


# Choose a base distribution
G0 <- function(n) rpois(n, 7)       # Poisson
G0 <- function(n) rnorm(n, 0, 1)   # Gaussian

# Concentration parameter around the base distribution
alphas <- c(1, 10, 100, 1000)
n <- 1000
df.G <- as.data.frame(matrix(NA, 0, 4))
names(df.G) <- c("xp", "i", "atom", "pi")

df.samples <- as.data.frame(matrix(NA, 0, 4))
names(df.samples) <- c("xp", "i", "alpha", "samples")

for(alpha in alphas){
  for(xp in 1:3){
    cat("\n", alpha)
    
    # Generate the DP
    G <- DP_stick_breaking(n, alpha, G0)
    df.G <- bind_rows(df.G, 
                      list(xp = rep(xp, n), 
                           alpha= rep(alpha, n), 
                           i=1:n,
                           atom = G$atoms,
                           pi=G$pis))
    
    # Generate samples from the DP
    samples <- sample(G$atoms, prob = G$pis, replace = TRUE)
    df.samples <- bind_rows(df.samples, 
                            list(xp = rep(xp, n), 
                                 alpha= rep(alpha, n), 
                                 i=1:n, 
                                 sample=samples))
  }
}

# Plot the DP
df.G$alpha <- factor(df.G$alpha)
p <- ggplot(df.G, aes(x=atom, y=pi)) + 
  geom_col(width=0.01)+
  facet_grid(alpha ~ xp, scales = "free") +
  theme_bw()
print(p)
ggsave(p, filename = paste0("fig15_DP.png"), 
       height=16, width=16, units='cm')

# Plot samples from the DP
df.samples$alpha <- factor(df.samples$alpha)
p <- ggplot(df.samples, aes(x=sample)) + 
     #geom_density() +
     #geom_histogram(bins=100, aes(y=..count../sum(..count..))) +
     geom_histogram(bins=1000) + 
     facet_grid(alpha ~ xp, scales = "free") +
     theme_bw()
print(p)
ggsave(p, filename = paste0("fig16_DPsamples.png"), 
       height=16, width=16, units='cm')


